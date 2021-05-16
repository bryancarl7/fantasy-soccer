echo -n "Have you run the initial setup?: "
read VAR

if [[ $VAR == "yes" || $VAR == "y" || $VAR == "Y" || $VAR == "Yes" || $VAR == ""]]
  printf"Starting Server...\n"
  python3 server/server.py
then
  printf"Runing Initial Setup...\n"
  ./setup/setup.sh
fi