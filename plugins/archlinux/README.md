# Archlinux plugin

## Features

#### PACMAN

| Alias        | Command                                 | Description                                                  |
|--------------|-----------------------------------------|--------------------------------------------------------------|
| pacin        | sudo pacman -S                          | Install packages from the repositories                       |
| pacins       | sudo pacman -U                          | Install a package from a local file                          |
| pacinsd      | sudo pacman -S --asdeps                 | Install packages as dependencies of another package          |
| pacloc       | pacman -Qi                              | Display information about a package in the local database    |
| paclocs      | pacman -Qs                              | Search for packages in the local database                    |
| paclsorphans | sudo pacman -Qdt                        | List all orphaned packages                                   |
| pacmir       | sudo pacman -Syy                        | Force refresh of all package lists after updating mirrorlist |
| pacre        | sudo pacman -R                          | Remove packages, keeping its settings and dependencies       |
| pacrem       | sudo pacman -Rns                        | Remove packages, including its settings and dependencies     |
| pacrep       | pacman -Si                              | Display information about a package in the repositories      |
| pacreps      | pacman -Ss                              | Search for packages in the repositories                      |
| pacrmorphans | sudo pacman -Rs $(pacman -Qtdq)         | Delete all orphaned packages                                 |
| pacupd       | sudo pacman -Sy && sudo abs && sudo aur | Update and refresh the local package, ABS and AUR databases  |
| pacupd       | sudo pacman -Sy && sudo abs             | Update and refresh the local package and ABS databases       |
| pacupd       | sudo pacman -Sy && sudo aur             | Update and refresh the local package and AUR databases       |
| pacupd       | sudo pacman -Sy                         | Update and refresh the local package database                |
| pacupg       | sudo pacman -Syu                        | Sync with repositories before upgrading packages             |
| upgrade      | sudo pacman -Syu                        | Sync with repositories before upgrading packages             |
| pacfileupg   | sudo pacman -Fy                         | Download fresh package databases from the server             |
| pacfiles     | pacman -Fs                              | Search package file names for matching strings.              |

| Function       | Description                                          |
|----------------|------------------------------------------------------|
| pacdisowned    | List all disowned files in your system               |
| paclist        | List all installed packages with a short description |
| pacmanallkeys  | Get all keys for developers and trusted users        |
| pacmansignkeys | Locally trust all keys passed as parameters          |
