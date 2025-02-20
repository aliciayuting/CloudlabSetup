OPT_HOME=/users/Alicia/opt-dev
export DERECHO_INSTALL_PREFIX=/usr/local
export CASCADE_INSTALL_PREFIX=/usr/local
export FAISS_INSTALL_PREFIX=/usr/local
export VORTEX_INSTALL_PREFIX=${OPT_HOME}/
export CURL_INSTALL_PREFIX=/usr/local
export CMAKE_PREFIX_PATH=${OPT_HOME}:/usr/local:${CMAKE_PREFIX_PATH}
export C_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${C_INCLUDE_PATH}
export CPLUS_INCLUDE_PATH=${OPT_HOME}/include:/usr/local/include:${CPLUS_INCLUDE_PATH}

# Configure library paths
export LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LIBRARY_PATH}
export LD_LIBRARY_PATH=${OPT_HOME}/lib:/usr/local/lib:${LD_LIBRARY_PATH}
export PATH=/usr/local/cuda/bin:$PATH
export PATH=$PATH:${OPT_HOME}/bin
