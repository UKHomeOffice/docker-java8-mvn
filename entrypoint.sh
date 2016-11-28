#!/usr/bin/env bash

envsubst < ${HOME}/.m2/settings.xml.sub > ${HOME}/.m2/settings.xml
rm -f ${HOME}/.m2/settings.xml.sub

CMD=( "${@:1}" )

eval "${CMD[*]}"
