#!/bin/sh

ENV_FILE="autoseg-environment.yml"

if [ ! -f "${ENV_FILE}" ]; then
    echo "No ${ENV_FILE}...grabbing it"
    wget -O ${ENV_FILE} https://raw.githubusercontent.com/SynapseWeb/PyReconstruct/autoseg-dev/autoseg-environment.yml
else
    echo "Grabbing new ${ENV_FILE} and checking for changes"
    wget -O "${ENV_FILE}.new" https://raw.githubusercontent.com/SynapseWeb/PyReconstruct/autoseg-dev/autoseg-environment.yml
    if cmp -s "${ENV_FILE}.new" "${ENV_FILE}"; then
        rm -f "${ENV_FILE}.new"
    else
        echo "Changes detected...using new ${ENV_FILE}"
        mv "${ENV_FILE}.new" "${ENV_FILE}"
    fi
fi
