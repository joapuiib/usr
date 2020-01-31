# Custom bash configuration
# @author joapuiib

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/usr/bin" ] ; then
    PATH="$HOME/usr/bin:$PATH"
fi

# Source autocompletion scripts for user scripts
if [ -d $HOME/usr/etc/bash_completion ]; then
    for f in $HOME/usr/etc/bash_completion/*; do
        source $f
    done
fi


# custom aliases
# alias chrome='google-chrome'
alias chrome='chromium-browser'

libre_office()
{
    libreoffice "$@" &> /dev/null &
}
alias lo=libre_office

xdg_open()
{
    xdg-open "$@" &> /dev/null &
}
alias obri=xdg_open
alias pytest='python3 -m pytest'

# Prompt command
# Comanda que s'executara sempre que el Bash mostre el prompt
if which augment_path.sh &>/dev/null ; then
    export PATH_DEFAULT="$PATH"
    PROMPT_COMMAND="source augment_path.sh"
fi

# Env variables for fast cd on usual folders
if [ -f $HOME/docencia/.estat_actual ] ; then
    source $HOME/docencia/.estat_actual
fi

export PYTHONPATH="$HOME/docencia/python/pdf"

# LANG
LANG="en_US.utf8"
export LANG

# ?
# stty -ixon
