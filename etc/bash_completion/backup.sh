# Provide completion for backup.sh

#COMP_WORDS is an array containing all individual words in the current command line.
#COMP_CWORD is an index of the word containing the current cursor position.
#COMPREPLY is an array variable from which Bash reads the possible completions.

_backup() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=""

    case $prev in
        --remote)
            _known_hosts_real -a -F "$configfile" -- "$cur"
            ;;
        *)
            opts="--remote"
            ;;
    esac

    if [ ! "S${opts}" = "S" ]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    fi
}
complete -F _backup backup.sh
