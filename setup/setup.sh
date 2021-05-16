#!/bin/bash

# Flask variables so that there is an environment setup
export FLASK_APP=server.py
export FLASK_ENV=development

echo "------------------------- Attention -------------------------------"
echo "   If this is your first installation, you may have to restart "
echo "   your terminal, after this preliminary installation"
echo "-------------------------------------------------------------------"

# Setup files and logs that we will need
mkdir tmp/
touch tmp/soteria.log
touch tmp/build.log
echo "------------------------- Step 1/4 --------------------------------"
echo "      Succesfully setup 'tmp' directory and logging files"
echo "-------------------------------------------------------------------"
logging=1

# Checks for correct python version
if [[ "$python" == 0 ]] ; then
  version=(python3 -c 'import sys; print(sys.version_info[:])')
  if [[ -z "$version" ]] ; then
    echo "Requires Python 3.6.9 or higher to run"
    exit 1;
  else
    echo "------------------------- Step 2/4 --------------------------------"
	  echo "      Succesfully Verified Python3 Installation"
	  echo "-------------------------------------------------------------------"
    python=1
  fi
else
    sudo apt install python3.6.9
    python=1
fi

while read p; do
 pip3 install $p
done < requirements.txt
req=1
echo "--------------------------- Step 3/4 ------------------------------"
echo "       Succesfully Installed Python3 Pip Requirements"
echo "-------------------------------------------------------------------"

echo "Python: "$python ." Pip: "$req. " Logging: "$logging >> tmp/build.log

# Try to kickstart Python Server:
echo "--------------------------- Step 4/4 ------------------------------"
echo "                 ...Launching Flask Server..."
echo "-------------------------------------------------------------------"
python3 server/server.py
