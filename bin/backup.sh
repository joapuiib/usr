#!/bin/bash

# title             : backup.sh
# description       : This script syncronizes a set of files/folders (defined in BACKUP_FILE) from another computer ($HOST)
# author            : joapuiib (based in code from J.Ander Gómez)
# date              : 31/01/2020
# version           : 1.0    
# usage             : bash backup -h|--host hostname [-f backup_file ]
# notes             : Files are defined in .backup.txt by default in you working directory, one in each line.
#                     Lines starting with # are ignored
#                     Some files are included and excluded. See: $INCLUDE and $EXCLUDE
#==============================================================================

DIR_ACTUAL="$(pwd)"
USUARI=`whoami`

HOST=""
BACKUP_FILE=".backup.txt"
while [ $# -ge 1 ] ; do
    case $1 in
        -h | --host )
            HOST=$2
            shift
            ;;
        -f)
            BACKUP_FILE=$2
            shift
            ;;
        *)
            echo "Opció $1 errònia!"
            ;;
    esac
    shift
done

if [ -z ${HOST}  ] ; then

    echo ""
    echo "Us: $0 -h|--host host [-f backup_file ]"
    echo ""

    exit 0
fi

if [ ! -f "$BACKUP_FILE" ] ; then
    echo "Error: Backup file $BACKUP_FILE not found"
    exit 1
fi

FILES=`cat $BACKUP_FILE | grep -v ^\# | sed ':a;N;$!ba;s/\n/ :/g'`
if [ -z "$FILES" ] ; then
    echo "Error: Backup file empty"
    exit 1
fi


INCLUDE="--include=.git/"

EXCLUDE=""
EXCLUDE="$EXCLUDE --exclude=__pycache__/"
EXCLUDE="$EXCLUDE --exclude=build/"
EXCLUDE="$EXCLUDE --exclude=*egg-info/"

CMD_PROVA="rsync -avHCRn --delete $INCLUDE $EXCLUDE ${USUARI}@${HOST}:${DIR_ACTUAL}/./${FILES} ."
 CMD_REAL="rsync -avHCR  --delete $INCLUDE $EXCLUDE ${USUARI}@${HOST}:${DIR_ACTUAL}/./${FILES} ."

${CMD_PROVA}

echo ""
echo ${CMD_REAL}

echo -en "\n Vols continuar [S/N]: "
read opc

if [ "X${opc}" = "XS" ] ; then
    ${CMD_REAL}
fi

