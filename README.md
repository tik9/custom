## ZSH and Powershell Profile under one common roof on Windows and WSL/Debian
&nbsp;

If you frequently use both environments Linux Zsh and Windows Powershell and want to **share aliases across shell environments** like 

- jumping to a pre-defined folder with `cd`
- writing `lah` instead of `ls -lah`

 these repos are for you.  
&nbsp;
 
  **Motivation**
   
  Find common code that works on both systems: [common_functions.zsh](blob/master/common_functions.zsh) and [common_functions.ps1](https://github.com/tik9/psprofile/blob/master/common_functions.ps1)

  &nbsp;

## Getting Started

- Prepare a running Oh-My-Zsh and $profile Powershell installation
- *Fork* [zsh](https://github.com/tik9/custom/) and [powershell](https://github.com/tik9/psprofile)
- You can use each repo on its own, but the full benefit is to use both

&nbsp;

## To be done

- Automatic copying of the zsh and ps1 files between systems

&nbsp;


### Feature Comparison

 Feature| Linux |  Powershell 
---------|:-------------:|------:
Content   |  Functions | Functions
 Version Shell | Zsh 5 | Powershell 7 
 Environment | Debian/WSL/Zsh   | Windows native 
 Source Call |  exec zsh |  . $profile
 Github Repo | [Custom](https://github.com/tik9/custom)  |[WindowsPowershell](https://github.com/tik9/psprofile) 
 Name | [common_functions.zsh](common_functions.zsh) |[common_functions.ps1](https://github.com/tik9/psprofile/blob/master/common_functions.ps1)
 Source `cmd` |  `exec zsh` | `. profile.ps1`
 Based on| [Oh-myzsh](https://github.com/ohmyzsh/ohmyzsh) | Own Ideas