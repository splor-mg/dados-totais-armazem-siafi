ifeq ($(shell uname), Darwin)
    PYTHON = python3
else ifeq ($(shell uname), Linux)
    PYTHON = python3
else ifeq ($(shell uname | head -c 5) , MINGW)
# git bash needs prefixing with winpty
    PYTHON = py -3
else
# for cmd and powershell
    PYTHON = py -3
endif
