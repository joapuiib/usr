#!/bin/bash

# title             : rsync_desde.sh
# description       : This script sends and syncronises a file/folder (--dir) FROM another computer ($HOST)
# original author   : J.Ander Gómez
# author            : joapuiib
# date              : 31/01/2020
# version           : 2.0    
# usage             : rsync_desde.sh --dir file --remote hostname [--exclude exclude_dir]
# ==============================================================================

USUARI=`whoami`
ORIGEN=""

DIR_ACTUAL="$(pwd)"

DIR=""

EXCLUDE=""

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
            ORIGEN=$2
            shift
            ;;
        *)
            echo "Opció $1 errònia!"
            ;;
    esac
    shift
done

#if [ "X${EXCLUDE}" != "X" ] ; then
#    EXCLUDE="--exclude ${EXCLUDE}"
#fi


if [ "X${DIR}" = "X" ] ; then

    echo ""
    echo "Us: $0 --dir <directori>"
    echo ""

    exit 0
fi
if [ "X${ORIGEN}" = "X" ] ; then

    echo ""
    echo "Us: $0 --remote <remote>"
    echo ""

    exit 0
fi

EXCLUDE=" ${EXCLUDE} --exclude *.pyc "
DIR=${DIR%%/}

#CMD_PROVA="rsync -avHCn -e 'ssh -p 2811' --delete ${EXCLUDE} ${ORIGEN}:${DIR_ACTUAL}/${DIR} ."
CMD_PROVA="rsync -avHCRn --delete ${EXCLUDE} ${USUARI}@${ORIGEN}:${DIR_ACTUAL}/./${DIR} ."
#CMD_REAL="rsync -avHC -e 'ssh -p 2811' --delete ${EXCLUDE} ${ORIGEN}:${DIR_ACTUAL}/${DIR} ."
 CMD_REAL="rsync -avHCR --delete ${EXCLUDE} ${USUARI}@${ORIGEN}:${DIR_ACTUAL}/./${DIR} ."

${CMD_PROVA}

echo ""
echo ${CMD_REAL}

echo -en "\n Vols continuar [S/N]: "
read opc

if [ "X${opc}" = "XS" ] ; then
    ${CMD_REAL}
fi
