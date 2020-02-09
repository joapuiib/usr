# Provide completion for custom rsync scripts

#COMP_WORDS is an array containing all individual words in the current command line.
#COMP_CWORD is an index of the word containing the current cursor position.
#COMPREPLY is an array variable from which Bash reads the possible completions.

_rsync() 
{
    local cur prev opts
    COMPREPLY=()
    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"
    opts=""

    case $prev in
        -h | --host)
            _known_hosts_real -a -F "$configfile" -- "$cur"
            ;;
        -f | --exclude )
            _filedir
            ;;
        *)
            case $cur in
                --*)
                    opts="--hosts --exclude"
                    ;;
                *)
                    opts="-h -f"
                    ;;
            esac
    esac

    if [ ! "S${opts}" = "S" ]; then
        COMPREPLY=( $(compgen -W "${opts}" -- ${cur}) )
    fi
}
complete -F _rsync rsync_a.sh
complete -F _rsync rsync_desde.sh
