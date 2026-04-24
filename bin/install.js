#!/usr/bin/env node

const fs = require('fs');
const path = require('path');
const os = require('os');

const sourceDir = path.join(__dirname, '..');

const geminiTarget = path.join(os.homedir(), '.gemini', 'skills');
const claudeTarget = path.join(os.homedir(), '.claude', 'skills');

function copySkills(targetBaseDir) {
    if (!fs.existsSync(targetBaseDir)) {
        fs.mkdirSync(targetBaseDir, { recursive: true });
    }

    const items = fs.readdirSync(sourceDir);
    const skills = items.filter(item => item.startsWith('sharp-') && fs.statSync(path.join(sourceDir, item)).isDirectory());

    skills.forEach(skill => {
        const srcPath = path.join(sourceDir, skill);
        const destPath = path.join(targetBaseDir, skill);
        
        fs.cpSync(srcPath, destPath, { recursive: true, force: true });
        console.log(`Copied ${skill} to ${destPath}`);
    });
}

console.log('Installing SharpPragma Skills...\n');

try {
    console.log('Installing for Gemini CLI...');
    copySkills(geminiTarget);
    
    console.log('\nInstalling for Claude Code...');
    copySkills(claudeTarget);

    console.log('\n✅ Installation complete!');
} catch (error) {
    console.error('\n❌ Installation failed:', error.message);
    process.exit(1);
}