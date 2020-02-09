#!/bin/bash

# title             : rsync_a.sh
# description       : This script sends and syncronises a file/folder (--dir) to another computer ($HOST)
# original author   : J.Ander Gómez
# author            : joapuiib
# date              : 31/01/2020
# version           : 2.0    
# usage             : rsync_desde.sh --dir file --remote hostname [--exclude exclude_dir]
# ==============================================================================

USUARI=`whoami`
DIR_ACTUAL=`pwd`

DESTI=""
DIR=""

EXCLUDE=' --exclude .DS_Store '
EXCLUDE=' --exclude *.pyc '

while [ $# -ge 1 ] ; do

    case $1 in
        -f)
            DIR=$2
            shift
            ;;
        --exclude)
            EXCLUDE=" ${EXCLUDE} $1 $2 "
            shift
            ;;
        -h | --host)
            DESTI=$2
            shift
            ;;
        *)
            echo "Wrong option: $1"
            ;;
    esac
    shift
done

DIR=${DIR%%/}


if [ -z ${DIR} ] ; then
    echo ""
    echo "Use: $0 --dir <directory>"
    echo ""

    exit 1
fi
if [ -z ${DESTI} ] ; then
    echo ""
    echo "Use: $0 --dir <directory>"
    echo ""

    exit 1
fi

CMD_PROVA="rsync -avHCRn --delete ${EXCLUDE} ./${DIR} ${USUARI}@${DESTI}:${DIR_ACTUAL}"
 CMD_REAL="rsync -avHCR  --delete ${EXCLUDE} ./${DIR} ${USUARI}@${DESTI}:${DIR_ACTUAL}"

${CMD_PROVA}

echo ""
echo ${CMD_REAL}

echo -en "\n Vols continuar [S/N]: "
read opc

if [ "${opc}" = "S" ] ; then
    ${CMD_REAL}
fi
