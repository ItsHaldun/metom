#! /bin/bash

# Python Version
PYTHON_VER="3.11.2"

# Debugging step to ensure PYTHON_VER is not empty
if [[ -z "$PYTHON_VER" ]]; then
    echo "PYTHON_VER is not set! Exiting."
    exit 1
else
    echo "PYTHON_VER is set to: '$PYTHON_VER'"
fi


# Install pip and pipX
echo "Starting setup for METOM..."
echo "Installing pip..."
python -m ensurepip --upgrade

echo "Installing pipx..."
sudo apt update
sudo apt install pipx -y
pipx ensurepath
pipx --version


# Install Pyenv
# Check if it is already installed
echo "Installing Pyenv..."
if command -v pyenv >/dev/null 2>&1; then
	echo "Pyenv is already installed..."
else 
	echo "Installing Dependencies..."
	sudo apt install -y build-essential libssl-dev zlib1g-dev libncurses5-dev libncursesw5-dev \
    libreadline-dev libsqlite3-dev libgdbm-dev libdb5.3-dev libbz2-dev libexpat1-dev liblzma-dev tk-dev \
    libffi-dev uuid-dev libnss3-dev libedit-dev wget curl llvm xz-utils

	curl https://pyenv.run | bash

	# Reload profile
	source .pyenv_init

	# Verify Pyenv installation
	pyenv --version
fi


# Installing Pyenv environment
# Check if the Python version is already installed
if pyenv versions --bare | grep -q "^${PYTHON_VER}\$"; then
    echo "Python version $PYTHON_VER is already installed. Skipping installation."
else
    echo "Installing Python version '$PYTHON_VER' using pyenv..."
    pyenv install "$PYTHON_VER"
fi

echo "Switching to Python version $PYTHON_VER with Pyenv..."
pyenv shell $PYTHON_VER

# Install Poetry
echo "Installing Poetry..."
pipx install poetry
poetry --version

# Creating the Poetry Project
echo "Initializing Poetry project..."
poetry shell
echo "Installing project dependencies..."
poetry install

echo "Setup completed!"