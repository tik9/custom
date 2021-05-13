## ZSH and Powershell Profile under one common roof on Windows and WSL
&nbsp;

If you frequently use both environments Linux Zsh and Windows Powershell and want to **share aliases across shell environments** like 

- jumping to a pre-defined folder with cd
- writing gs instead of git status

 these repos are for you.  
&nbsp;
 
  **Motivation**
   
  Find common code that works on both systems. Example: [common_functions.zsh](https://github.com/tik9/custom/blob/master/common_functions.zsh) and [common_functions.ps1](https://github.com/tik9/prs/blob/master/common_functions.ps1)

  &nbsp;

At present, two files will be shared across the environments (see details in each table):
1. [Common_Functions](###-1.-common_functions) - all aliases not related to git
2. [git](###-2.-git).[plugin.zsh][ps1]: git aliases

&nbsp;

## Getting Started

- a running Oh-My-Zsh and $profile Powershell installation
- Fork [zsh](https://github.com/tik9/custom/) and [powershell](https://github.com/tik9/psprofile)
- You can use each repo on its own, but the full benefit is to use both


&nbsp;

## Preconditions

- working Oh-My-Zsh and $profile Powershell
- Zsh installed
- Both envs do not have to be on the same PC, e. g. they can work separately

&nbsp;

## To be done (Tbd)

- Automatic copying of the two zsh and ps1 files between systems

&nbsp;


### Both in Common 

 Feature| Linux |  Powershell 
---------|:-------------:|------:
Content   |  Functions | Functions
 Version Shell | Zsh 5 | Powershell 5 
 Environment | Debian/WSL/Zsh   | Windows native 
 Source Call |  exec zsh |  . $profile
Release Version | 1 | 1


&nbsp;
### 1. Common Functions


 Feature| Linux |  Powershell 
--------|:-------:|------:
 Locationfolder | [Custom](https://github.com/tik9/custom)  |[WindowsPowershell](https://github.com/tik9/psprofile) 
 Name | [common_functions.zsh](common_functions.zsh) |[common_functions.ps1](https://github.com/tik9/psprofile/blob/master/common_functions.ps1)
 Source `cmd` |  `exec zsh` | `. profile.ps1`
 Based on| [Oh-myzsh](https://github.com/ohmyzsh/ohmyzsh) | [Useful Aliases](https://gist.github.com/timsneath/19867b12eee7fd5af2ba)


&nbsp;  
&nbsp;  
### 2. Git

| Feature |     Linux    |  Windows |
|----------|:-------------:|------:|
| Name | [git.plugin.zsh](https://github.com/tik9/custom/blob/master/plugins/git/git.plugin.zsh) |[git.ps1](https://github.com/tik9/prs/blob/master/git.ps1)|
| Sourced from |  [.zshrc](https://github.com/tik9/custom/blob/master/.zshrc) |  [profile.ps1](https://github.com/tik9/prs/blob/master/Microsoft.PowerShell_profile.ps1)|
| Based from| [Oh-myzsh](https://github.com/ohmyzsh/ohmyzsh) | oh-my-zsh

&nbsp;  
&nbsp;  


### Observations in daily use


| Feature |     Linux |  Windows |
|----------|:---------:|----------:|
Variable definiton | needed before | not needed before
Line Endings | Needs LF | Works with either LF or CRLF

&nbsp;  

Send a PR if you want to contribute