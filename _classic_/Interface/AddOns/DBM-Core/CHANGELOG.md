# DBM - Core

## [10.2.44](https://github.com/DeadlyBossMods/DeadlyBossMods/tree/10.2.44) (2024-05-28)
[Full Changelog](https://github.com/DeadlyBossMods/DeadlyBossMods/compare/10.2.43...10.2.44) [Previous Releases](https://github.com/DeadlyBossMods/DeadlyBossMods/releases)

- Prep another cata release with more fixes  
- Still can't reproduce reported cata errors, so more blind fixes to what's going on for some users. I tested using two characters, one level 1 and one level 80 grouping together. real specs and fallback specs recognized and role auto changed correctly. anyways, maybe this fixes niche cases?  
- more protections against weird cata nil errors that shouldn't happen  
- Update koKR (#1102)  
- Update localization.ru.lua (#1103)  
- Fix lua error if a DBM module loaded on an unspecced character in cata classic. Closes https://github.com/DeadlyBossMods/DeadlyBossMods/issues/1104  
- bump alpha  
