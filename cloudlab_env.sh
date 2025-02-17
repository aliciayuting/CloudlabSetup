#!/bin/bash
echo "This script requires /users/[yournetid]/opt-dev folder"
echo "Run '\$ mkdir opt-dev' at ./~ before running this script"

# Check if the OPT_HOME argument is provided
if [ -z "$1" ]; then
    echo "your USER_HOME directory not provided. Please pass it as the first argument."
    echo "e.g. $./cloudlab_env_setup.sh /users/[yournetid] or $./cloudlab_env_setup.sh ~"
    return 1
fi

# Set OPT_HOME to the first argument
USER_HOME=$(echo "$1" | sed 's:/*$::')
OPT_HOME=${USER_HOME}/opt-dev

# OPT_HOME=/users/[YOUR-CLOUDLAB-USER-NAME]/opt-dev
echo " .. setting up derecho cascade vortex installation env variables"
export DERECHO_INSTALL_PREFIX=${OPT_HOME}/
export CASCADE_INSTALL_PREFIX=${OPT_HOME}/
export FAISS_INSTALL_PREFIX=${OPT_HOME}/
export VORTEX_INSTALL_PREFIX=${OPT_HOME}/
export CURL_INSTALL_PREFIX=${OPT_HOME}/

echo " .. setting up cmake cpp include path env variables"
export CMAKE_PREFIX_PATH=${OPT_HOME}:/usr/local:${CMAKE_PREFIX_PATH}
export C_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${CPLUS_INCLUDE_PATH}

# Configure library paths
echo " .. setting up library path env variables"
export LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LD_LIBRARY_PATH}

echo " .. setting up cuda path"
export PATH=/usr/local/cuda/bin:$PATH
echo "Finished setup the env path"
