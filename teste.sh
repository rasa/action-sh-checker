#!/bin/bash

if [ "$SHELLCHECK_DISABLE" != 1 ]; then
	echo aqui
elif [ "$SHELLCHECK_DISABLE" != 0 ]; then
	echo aqui2
elif [ "$SHELLCHECK_DISABLE" != 1 ]; then
	echo aqui3
else
	echo aqui4
fi
