## ZSH Aliases

You have Zsh and want to **use  aliases and functions** like 
- `l` instead of `ls -lah`
- `q` instead of `wget http://speedtest.wdc01.softlayer.com/downloads/test100.zip --output-document=/dev/null` to get your internet speed
  
&nbsp;
 
 ### Getting Started
- Get`git`, `curl`, a unix like OS and [Zsh](https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH#how-to-install-zsh-on-many-platforms)
- Get Oh-My-Zsh[(https://github.com/ohmyzsh/ohmyzsh)] with `sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"`
- *Fork* [this repo](https://github.com/tik9/custom/)
- Get to know my custom plugin [common-aliases.zsh](blob/master/plugins/common-aliases/common-aliases.plugin.zsh)
- Edit .zshrc with e.g. `plugins=(git)` to only load the **git** plugin

&nbsp;

### Facts
 - Used version Zsh: 5
 - Oh-My-Zsh has lots of useful `plugins`
 - Refresh/reload Zsh command after change: `exec zsh`