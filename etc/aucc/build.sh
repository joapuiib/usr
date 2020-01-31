#!/bin/bash

if [ -f main.spec ] ; then
    pyinstaller --onefile main.spec
fi

chmod u+xs dist/aucc
