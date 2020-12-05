# initial mac

该代码库使用 ansible homebrew 为一个全新的 mac 安装以及配置一个开发常用所需要的软件包和配置。

怎么运行：

```
make run SUDO_PASSWORD='{your sudo password}'
```

在安装 cask 的时候，有些软件需要 sudo 的密码。

暂时安装了：

cask：

- iterm2
- lastpass
- clipy(剪切板工具 https://github.com/Clipy/Clipy)
- shiftit(窗口管理工具 https://github.com/fikovnik/ShiftIt)
- eudic(翻译软件 https://www.eudic.net/v4/en/app/eudic)
- qqmusic
- visual-studio-code
- zoom
- docker
- intellij-idea
- sogouinput
- postman
- dbeaver-community

dbeaver-community 需要配置 java 环境：

修改 `/Applications/DBeaver.app/Contents/Info.plist` Eclipse > array

cli package：

- warrensbox/tap/tfswitch(terraform 版本管理工具 https://github.com/warrensbox/terraform-switcher)
- jenv(java 版本管理工具 https://github.com/jenv/jenv)
- nvm(node 版本管理工具 https://github.com/nvm-sh/nvm)
- autojump(命令行强大的跳转工具 https://github.com/wting/autojump)
- kubectl(kubernetes 命令行工具 https://github.com/kubernetes/kubectl)
- zsh-autosuggestions(oh-my-zsh 自动提示插件 https://github.com/zsh-users/zsh-autosuggestions)
- zsh-syntax-highlighting(oh-my-zsh 高亮工具 https://github.com/zsh-users/zsh-syntax-highlighting)

如果上述软件不能满足需要，并且还想用 homebrew 安装，可以在下列两个数组中继续添加：

- cask: roles/homebrew/vars/main.yml > cask_list
- cli: roles/homebrew/vars/main.yml > cli_list

### git

配置 git alias.l = "log --graph --decorate --oneline"