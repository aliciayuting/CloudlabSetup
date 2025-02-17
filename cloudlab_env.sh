#!/bin/bash
echo "This script requires /users/[yournetid]/opt-dev ./~/opt-dev folder to set environment variable correctly"
echo "Run mkdir opt-dev at ./~ before running this script"

# Check if the OPT_HOME argument is provided
if [ -z "$1" ]; then
    echo "your USER_HOME directory not provided. Please provide it as the first argument."
    echo "you can run this script as $./cloudlab_env_setup.sh /users/[yournetid] or $./cloudlab_env_setup.sh ~"
    exit 1
fi

# Set OPT_HOME to the first argument
USER_HOME=$(echo "$1" | sed 's:/*$::')
OPT_HOME=${USER_HOME}/opt-dev

# OPT_HOME=/users/[YOUR-CLOUDLAB-USER-NAME]/opt-dev

export DERECHO_INSTALL_PREFIX=${OPT_HOME}/
export CASCADE_INSTALL_PREFIX=${OPT_HOME}/
export FAISS_INSTALL_PREFIX=${OPT_HOME}/
export VORTEX_INSTALL_PREFIX=${OPT_HOME}/
export CURL_INSTALL_PREFIX=${OPT_HOME}/
export CMAKE_PREFIX_PATH=${OPT_HOME}:/usr/local:${CMAKE_PREFIX_PATH}
export C_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${CPLUS_INCLUDE_PATH}

# Configure library paths
export LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LD_LIBRARY_PATH}
export PATH=/usr/local/cuda/bin:$PATH

