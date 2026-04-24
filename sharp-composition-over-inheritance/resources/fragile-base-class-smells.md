# Fragile base class smells

- Protected mutable state used by many derived classes.
- Base constructor calls virtual members.
- Derived classes override methods only to disable behavior.
- Base class knows about derived class details.
- Adding one derived type forces changes to the base class.
