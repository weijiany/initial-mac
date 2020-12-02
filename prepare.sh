# /bin/bash

# install homebrew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# create virtual env for python
python3 -m venv venv

# activate virtual env
source venv/bin/activate

# install python dependency
pip3 install -r requirement.txt