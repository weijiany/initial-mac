#!/bin/bash

green='32m'
yello='33m'
red='31m'

function myEcho() {
   printf "\033[;%s%s\033[0m\n" "${2}" "${1}"
}

# check SUDO_PASSWORD variable is passed
SUDO_PASSWORD=${1}
if [[ ${SUDO_PASSWORD} = "" ]]; then
    myEcho '**** SUDO_PASSWORD must be pass, and the variable can be set to the first parameters.' ${red}
    exit -1
fi

# install homebrew
myEcho '====check homebrew is installed' ${yello}
brew --version
if [ ${?} -ne 0 ]; then
    myEcho '--->install homebrew' ${green}
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi

# ensure brew is in PATH (Apple Silicon installs to /opt/homebrew)
if [ -x /opt/homebrew/bin/brew ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -x /usr/local/bin/brew ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi
myEcho '--->homebrew ready' ${green}

# install ansible via Homebrew
myEcho '====check ansible is installed' ${yello}
if ! brew list ansible &>/dev/null; then
    myEcho '--->install ansible' ${green}
    brew install ansible
else
    myEcho '--->ansible already installed' ${green}
fi

# run ansible-playbook
myEcho '====run ansible playbook' ${yello}
ansible-playbook main.yml -i inventory/local --extra-vars "ansible_become_password=${SUDO_PASSWORD}"
myEcho '====install successfully' ${green}
