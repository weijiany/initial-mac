# /bin/bash

green='32m'
yello='33m'
red='31m'

function myEcho() {
   echo "\033[;${2}${1}\033[0m"
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
else
    myEcho '--->homebrew installed' ${green}
fi

# create virtual env for python
myEcho '====check venv is already exist' ${yello}
if [ ! -d venv ]; then
    python3 -m venv venv
else
    myEcho '--->venv exist' ${green}
fi

# activate virtual env
source venv/bin/activate

# install python dependency
myEcho '====install python dependency====' ${yello}
pip3 install --upgrade pip
pip3 install -r requirement.txt

# run ansible-playbook
myEcho '====run ansible playbook' ${yello}
ansible-playbook main.yml -i inventory/local --extra-vars "${SUDO_PASSWORD}"
myEcho '====install successfully' ${green}