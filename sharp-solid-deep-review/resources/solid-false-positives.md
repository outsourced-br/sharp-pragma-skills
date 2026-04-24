# SOLID false positives

Do not flag:

- small concrete classes with no need for interfaces,
- simple data carriers used at boundaries,
- sealed classes when substitution is not needed,
- direct construction of trivial objects,
- methods with multiple statements but one clear responsibility.
