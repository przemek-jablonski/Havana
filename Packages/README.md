# Packages

Umbrella Swift Package that hosts all of the modularised code for the `Havana` project. 
Each module is split into one or more targets.

#### Structure
Module configuration can be found in the `/Package.swift` file. 
Source code itself lives in the `/Sources` directory, alongside tests and it's split into two categories - `/Sources/Core` and `/Sources/Features`.

##### `/Sources/Core` 
- code that is meant to be shared by other modules, eg. `/Octokit` (module for interfacing with Github's API) or `/Motif` (design system elements).

##### `/Sources/Features` 
- code that forms particular features of the app, eg. `/Login` (module containing Login screen and it's logic) or `/ActivityFeed` (module containing Activity Feed screen and it's logic).
