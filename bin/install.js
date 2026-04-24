#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const os = require('os');

const sourceDir = path.join(__dirname, '..');

const args = process.argv.slice(2);
const skillDirs = fs.readdirSync(sourceDir)
    .filter(item => item.startsWith('sharp-') && fs.statSync(path.join(sourceDir, item)).isDirectory())
    .sort();

const profileTargets = [
    path.join(os.homedir(), '.codex', 'skills'),
    path.join(os.homedir(), '.gemini', 'skills'),
    path.join(os.homedir(), '.claude', 'skills')
];

const repoRelativeTargets = [
    path.join('.agents', 'skills'),
    path.join('.codex', 'skills'),
    path.join('.gemini', 'skills'),
    path.join('.claude', 'skills')
];

function printHelp() {
    console.log(`SharpPragma Skills installer

Usage:
  npx @outsourced-br/sharp-pragma-skills@latest install [repo-or-folder]
  npx @outsourced-br/sharp-pragma-skills@latest --repo <repo-or-folder>
  npx @outsourced-br/sharp-pragma-skills@latest --local
  npx @outsourced-br/sharp-pragma-skills@latest --target <skills-directory>
  npx @outsourced-br/sharp-pragma-skills@latest --profile

Modes:
  install <path>       Install into local skill directories under the given repo/folder.
  --repo <path>        Same as install <path>.
  --local              Install into local skill directories under the current directory.
  --target <path>      Copy directly into one specific skills directory.
  --profile            Install into user profile skill directories.

With no arguments, skills are installed into local skill directories under the current directory.`);
}

function takeOptionValue(optionName) {
    const index = args.indexOf(optionName);
    if (index === -1) {
        return null;
    }

    const value = args[index + 1];
    if (!value || value.startsWith('--')) {
        throw new Error(`${optionName} requires a path value.`);
    }

    return value;
}

function copySkills(targetBaseDir) {
    fs.mkdirSync(targetBaseDir, { recursive: true });

    skillDirs.forEach(skill => {
        const srcPath = path.join(sourceDir, skill);
        const destPath = path.join(targetBaseDir, skill);

        fs.rmSync(destPath, { recursive: true, force: true });
        fs.cpSync(srcPath, destPath, { recursive: true });
        console.log(`Installed ${skill} -> ${destPath}`);
    });
}

function installToTargets(targets) {
    targets.forEach(copySkills);
}

function installToRepository(repoPath) {
    const resolvedRepoPath = path.resolve(process.cwd(), repoPath);
    fs.mkdirSync(resolvedRepoPath, { recursive: true });

    const targets = repoRelativeTargets.map(relativeTarget => path.join(resolvedRepoPath, relativeTarget));
    console.log(`Installing into repository/folder: ${resolvedRepoPath}`);
    installToTargets(targets);
}

function getPositionalPath() {
    const positional = args.filter(arg => !arg.startsWith('--'));
    if (positional[0] === 'install') {
        return positional[1] || null;
    }

    return positional[0] || null;
}

try {
    if (args.includes('--help') || args.includes('-h')) {
        printHelp();
        process.exit(0);
    }

    console.log('Installing SharpPragma Skills...\n');

    const exactTarget = takeOptionValue('--target');
    const repoTarget = takeOptionValue('--repo') || takeOptionValue('--project');
    const isLocal = args.includes('--local');
    const isInstallCommand = args[0] === 'install';
    const isProfile = args.includes('--profile');
    const positionalPath = getPositionalPath();

    if (exactTarget) {
        const targetPath = path.resolve(process.cwd(), exactTarget);
        console.log(`Installing into exact skills directory: ${targetPath}`);
        copySkills(targetPath);
    } else if (repoTarget) {
        installToRepository(repoTarget);
    } else if (positionalPath) {
        installToRepository(positionalPath);
    } else if (isProfile) {
        console.log('Installing into user profile skill directories...');
        installToTargets(profileTargets);
    } else if (isLocal || isInstallCommand) {
        installToRepository(process.cwd());
    } else {
        installToRepository(process.cwd());
    }

    console.log('\nInstallation complete.');
} catch (error) {
    console.error('\nInstallation failed:', error.message);
    process.exit(1);
}
