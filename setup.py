import os

# Cria e ativa o ambiente virtual
os.system('virtualenv -p /usr/bin/python3.8 myenv')
os.system('.\\env\\Scripts\\activate.bat')

# Instala a biblioteca SeleniumLibrary
os.system('pip install robotframework')

# Instala a biblioteca SeleniumLibrary
os.system('pip install robotframework-seleniumlibrary')

# Cria o arquivo requirements.txt
os.system('pip freeze > requirements.txt')

# Desativa o ambiente virtual
os.system('deactivate')
