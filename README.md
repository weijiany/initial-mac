# Initial Mac Setup

这是一个用 Ansible 自动化配置 Mac 开发环境的项目。

## 功能

- 安装和配置 Homebrew
- 安装 Oh My Zsh 并配置主题
- 配置 Git
- 安装和配置 Tmux
- 安装 Proto 工具管理器
- 通过 Proto 安装 AWS CLI

## 系统要求

- macOS (支持 Intel 和 Apple Silicon)
- 需要管理员权限（用于安装软件包）

## 快速开始

### 1. 克隆项目

```bash
git clone https://github.com/weijiany/initial-mac.git
cd initial-mac
```

### 2. 运行初始化脚本

```bash
# 替换 YOUR_SUDO_PASSWORD 为你的管理员密码
./run.sh YOUR_SUDO_PASSWORD
```

或者，如果你不想在命令行中暴露密码：

```bash
# 设置环境变量
export SUDO_PASSWORD="your_password"
./run.sh "$SUDO_PASSWORD"
```

## 脚本做了什么

1. **检查并安装 Homebrew** - 如果未安装，会自动安装 Homebrew
2. **安装 Ansible** - 通过 Homebrew 直接安装 Ansible（无需 Python 环境管理）
3. **运行 Ansible** - 执行 Ansible playbook 来配置系统

## 故障排除

### 如果 Homebrew 安装失败

可以手动安装 Homebrew：

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 如果 Ansible 安装失败

可以手动安装 Ansible：

```bash
brew install ansible
```

### 查看 Ansible 版本

```bash
ansible --version
```

## 项目结构

```
initial-mac/
├── run.sh              # 主入口脚本
├── main.yml            # Ansible 主 playbook
├── inventory/          # Ansible 主机清单
└── roles/              # Ansible 角色
    ├── homebrew/       # Homebrew 配置
    ├── oh_my_zsh/      # Oh My Zsh 配置
    ├── git/            # Git 配置
    ├── tmux/           # Tmux 配置
    └── proto/          # Proto 工具管理器配置
```

# initial mac

该代码库使用 ansible homebrew 为一个全新的 mac 安装以及配置一个开发常用所需要的软件包和配置。

怎么运行：

```
./run.sh '{you sudo password}'
```

在安装 cask 的时候，有些软件需要 sudo 的密码。

暂时安装了：

### Cask 软件

| 软件                                                 | 描述         | Homebrew 包名        |
| ---------------------------------------------------- | ------------ | -------------------- |
| [iTerm2](https://iterm2.com/)                        | 终端模拟器   | `iterm2`             |
| [LastPass](https://www.lastpass.com/)                | 密码管理器   | `lastpass`           |
| [QQ 音乐](https://y.qq.com/)                         | 音乐播放器   | `qqmusic`            |
| [Visual Studio Code](https://code.visualstudio.com/) | 代码编辑器   | `visual-studio-code` |
| [Zoom](https://zoom.us/)                             | 视频会议工具 | `zoom`               |
| [IntelliJ IDEA](https://www.jetbrains.com/idea/)     | Java IDE     | `intellij-idea`      |
| [搜狗输入法](https://pinyin.sogou.com/)              | 中文输入法   | `sogouinput`         |
| [Postman](https://www.postman.com/)                  | API 测试工具 | `postman`            |
| [滴答清单](https://dida365.com/)                     | 任务管理工具 | `ticktick`           |
| [微信](https://weixin.qq.com/)                       | 即时通讯工具 | `wechat`             |
| [企业微信](https://work.weixin.qq.com/)              | 企业通讯工具 | `wechatwork`         |
| [Slack](https://slack.com/)                          | 团队协作工具 | `slack`              |
| [Google Chrome](https://www.google.com/chrome/)      | 网页浏览器   | `google-chrome`      |
| [Raycast](https://www.raycast.com/)                  | 快速启动工具 | `raycast`            |
| [NetNewsWire](https://netnewswire.com/)              | RSS 阅读器   | `netnewswire`        |

### CLI 工具

| 工具                                                                                        | 描述                   | Homebrew 包名                  |
| ------------------------------------------------------------------------------------------- | ---------------------- | ------------------------------ |
| [autojump](https://github.com/wting/autojump)                                               | 命令行强大的跳转工具   | `autojump`                     |
| [kubectl](https://github.com/kubernetes/kubectl)                                            | Kubernetes 命令行工具  | `kubectl`                      |
| [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)                     | Oh My Zsh 自动提示插件 | `zsh-autosuggestions`          |
| [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)             | Oh My Zsh 语法高亮工具 | `zsh-syntax-highlighting`      |
| [watch](https://man7.org/linux/man-pages/man1/watch.1.html)                                 | 监控命令执行           | `watch`                        |
| [wget](https://www.gnu.org/software/wget/)                                                  | 文件下载工具           | `wget`                         |
| [Graphviz](https://graphviz.org/)                                                           | 图形可视化软件         | `graphviz`                     |
| [tmpwatch](https://linux.die.net/man/8/tmpwatch)                                            | 临时文件清理工具       | `tmpwatch`                     |
| [jq](https://stedolan.github.io/jq/)                                                        | JSON 处理工具          | `jq`                           |
| [yq](https://github.com/mikefarah/yq)                                                       | YAML 处理工具          | `yq`                           |
| [tmux](https://github.com/tmux/tmux)                                                        | 终端复用器             | `tmux`                         |
| [Go](https://golang.org/)                                                                   | 编程语言               | `go`                           |
| [tree](https://linux.die.net/man/1/tree)                                                    | 目录树显示工具         | `tree`                         |
| [expect](https://linux.die.net/man/1/expect)                                                | 自动化交互工具         | `expect`                       |
| [zsh](https://www.zsh.org/)                                                                 | Shell 解释器           | `zsh`                          |
| [Docker](https://www.docker.com/)                                                           | 容器化平台             | `docker`                       |
| [Docker Compose](https://docs.docker.com/compose/)                                          | 容器编排工具           | `docker-compose`               |
| [GNU sed](https://www.gnu.org/software/sed/)                                                | 流编辑器               | `gnu-sed`                      |
| [Docker Credential Helper for ECR](https://github.com/awslabs/amazon-ecr-credential-helper) | AWS ECR 凭证助手       | `docker-credential-helper-ecr` |

安装完 docker-credential-helper-ecr 后，需要更新 `~/.docker/config.json` 文件来启用它：

```json
{
  "credHelpers": {
    "public.ecr.aws": "ecr-login",
    "<your-account-id>.dkr.ecr.<region>.amazonaws.com": "ecr-login"
  }
}
```

请将 `<your-account-id>` 和 `<region>` 替换为你的 AWS account 和 region。

### Proto 工具

| 工具                                                     | 描述                         | 版本      |
| -------------------------------------------------------- | ---------------------------- | --------- |
| [AWS CLI](https://aws.amazon.com/cli/)                   | AWS 命令行工具               | `2.24.20` |
| [Go](https://golang.org/)                                | Go 编程语言                  | `1.24.1`  |
| [Helm](https://helm.sh/)                                 | Kubernetes 包管理器          | `3.17.1`  |
| [Helmfile](https://github.com/helmfile/helmfile)         | Helm 声明式部署工具          | `1.0.0`   |
| [jq](https://stedolan.github.io/jq/)                     | JSON 处理工具                | `1.7.1`   |
| [kubectl](https://kubernetes.io/docs/reference/kubectl/) | Kubernetes 命令行工具        | `1.32.2`  |
| [Node.js](https://nodejs.org/)                           | JavaScript 运行时            | `22.11.0` |
| [Proto](https://moonrepo.dev/proto)                      | 工具管理器                   | `0.49.5`  |
| [Pulumi](https://www.pulumi.com/)                        | 基础设施即代码工具           | `3.175.0` |
| [Python](https://www.python.org/)                        | Python 编程语言              | `3.10.11` |
| [SOPS](https://github.com/mozilla/sops)                  | 密钥管理工具                 | `3.10.2`  |
| [Terraform](https://www.terraform.io/)                   | 基础设施即代码工具           | `1.12.1`  |
| [Deno](https://deno.land/)                               | JavaScript/TypeScript 运行时 | `2.3.6`   |
| [Dive](https://github.com/wagoodman/dive)                | Docker 镜像分析工具          | `0.13.1`  |

如果上述软件不能满足需要，并且还想用 homebrew 安装，可以在下列两个数组中继续添加：

- cask: roles/homebrew/vars/main.yml > cask_list
- cli: roles/homebrew/vars/main.yml > cli_list

### git

配置 git alias.l = "log --graph --date=format:'%Y-%m-%d' --pretty=format:'%C(cyan)%h%Creset %Creset%C(auto)%d %s %C(black bold)(%ad) %C(bold blue)<%an>'"
