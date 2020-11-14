## ZSH and Powershell Profile under one common roof on Windows and WSL
&nbsp;

If you frequently use **both environments** Linux **Zsh** and Windows **Powershell** and want to **share aliases across shell environments** like 

- jumping to a **pre-defined folder** with cd
- showing a list of files with **ls in combination with less**
- writing gs instead of **git status**

 these repos are for you.  
&nbsp;
 
  **Motivation**
   
  Find **common code** that works on both systems. Example: [common_functions.zsh](https://github.com/tik9/custom/blob/master/common_functions.zsh) and [common_functions.ps1](https://github.com/tik9/prs/blob/master/common_functions.ps1)

  &nbsp;

At present, two files will be shared across the environments (see details in each table):
1. [Common_Functions](###-1.-common_functions).[zsh][ps1]: all things not related to git
2. [git](###-2.-git).[plugin.zsh][ps1]: Only **git aliases**

&nbsp;

## Getting Started
&nbsp;

- a running **Oh-My-Zsh** and **$profile Powershell**
- Fork my [repo zsh](https://github.com/tik9/custom) **and/or**
- Fork my [repo powershell](https://github.com/tik9/prs)
- Choose the appropriate folders in your OS for the repos
- You can use each repo on its own, but the full benefit is to use both


&nbsp;

## Preconditions
&nbsp;

- Running **Oh-My-Zsh** and **$profile Powershell**
- In order to run Oh-My-Zsh you need **Zsh installed**.
- They do not have to be on the same PC, e. g. they can work separately
&nbsp;

## To be done (Tbd)
&nbsp;

- Automatic copying of the two zsh and ps1 files between systems

&nbsp;


### Both in Common 
&nbsp;

| Feature| Linux |  Powershell |
|----------|:-------------:|------:|
|Content   |  Functions | Functions
| Version Shell | Zsh 5 | Powershell 5 |
| Environment | Debian/WSL/Zsh   | Windows native |
| Source Call |  exec zsh |  . $profile|
|Release Version | 1 | 1

&nbsp;
### 1. Common Functions

&nbsp;

| Feature| Linux |  Powershell |
|----------|:-------------:|------:|
| Locationfolder | [Custom](https://github.com/tik9/custom)  | [WindowsPowershell](https://github.com/tik9/prs) |
| Name | [common_functions.zsh](https://github.com/tik9/custom/blob/master/common_functions.zsh) |[common_functions.ps1](https://github.com/tik9/prs/blob/master/common_functions.ps1)|
| Sourced from |  automatic | [profile.ps1](https://github.com/tik9/prs/blob/master/Microsoft.PowerShell_profile.ps1)|
| Based from| [Oh-myzsh](https://github.com/ohmyzsh/ohmyzsh) | [Useful Aliases](https://gist.github.com/timsneath/19867b12eee7fd5af2ba)


&nbsp;  
&nbsp;  
### 2. git
&nbsp;  

| Feature |     Linux    |  Windows |
|----------|:-------------:|------:|
| Name | [git.plugin.zsh](https://github.com/tik9/custom/blob/master/plugins/git/git.plugin.zsh) |[git.ps1](https://github.com/tik9/prs/blob/master/git.ps1)|
| Sourced from |  [.zshrc](https://github.com/tik9/custom/blob/master/.zshrc) |  [profile.ps1](https://github.com/tik9/prs/blob/master/Microsoft.PowerShell_profile.ps1)|
| Based from| [Oh-myzsh](https://github.com/ohmyzsh/ohmyzsh) | Copy and paste ;)

&nbsp;  
&nbsp;  


### Observations in daily use


| Feature |     Linux |  Windows |
|----------|:---------:|----------:|
Variable def. | Def. before use | Def. does not have to be before use
Line Endings | Needs LF | Works with either LF or CRLF

&nbsp;  

Send a **PR** if you want to contribute

&nbsp;  
