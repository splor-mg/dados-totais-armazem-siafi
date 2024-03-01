ifeq ($(shell uname), Darwin)
    PYTHON = python3
else ifeq ($(shell uname), Linux)
    PYTHON = python3
else ifeq ($(shell uname | head -c 5) , MINGW)
# git bash needs prefixing with winpty
    PYTHON = python
else
# for cmd and powershell
    PYTHON = python
endif
