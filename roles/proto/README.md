# Proto Role

这个 Ansible role 用于安装和配置 Proto 工具管理器，并通过 `.prototools` 文件管理工具版本。

## 功能

- 安装 Proto 工具管理器
- 创建 `.prototools` 配置文件
- 通过 Proto 安装指定版本的工具（如 AWS CLI）
- 配置 shell 环境以使用 Proto 管理的工具

## 安装的工具

- **Proto** - 工具管理器
- **AWS CLI** - AWS 命令行工具（版本 2.24.20）

## 使用方法

在 playbook 中包含此 role：

```yaml
- hosts: local
  roles:
    - role: proto
```

## 变量

### 默认变量

- `proto_tools`: 要安装的工具列表及其版本
- `proto_install_url`: Proto 安装脚本的 URL
- `proto_home`: Proto 的安装目录

### 默认工具配置

```yaml
proto_tools:
  - name: awscli
    version: "asdf:2.24.20"
```

### 自定义变量

你可以通过 `--extra-vars` 或变量文件覆盖默认值：

```yaml
proto_tools:
  - name: awscli
    version: "asdf:2.24.20"
  - name: terraform
    version: "asdf:1.5.0"
  - name: kubectl
    version: "asdf:1.28.0"
```

## 安装过程

1. 检查 Proto 是否已安装
2. 如果未安装，下载并安装 Proto
3. 等待 Proto 安装完成
4. 创建 Proto 主目录
5. 创建 `.prototools` 配置文件
6. 通过 Proto 安装配置的工具

## 配置文件

`.prototools` 文件位于 `~/.proto/.prototools`，格式如下：

```
awscli = "asdf:2.24.20"
```

## 注意事项

- Proto 会安装到 `~/.proto` 目录
- `.prototools` 文件用于管理工具版本
- 需要重新加载 shell 环境才能使用 Proto 管理的工具
- 支持通过变量自定义要安装的工具列表和版本
