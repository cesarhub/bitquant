# this is the location of the main server from a docker image
export cache_server=172.17.0.1

timeout 1 bash -c 'cat < /dev/null > /dev/tcp/'$cache_server'/3128'
if [ $? == 0 ] ; then
    echo "running proxy"
export http_proxy=http://$cache_server:3128/
export https_proxy=http://$cache_server:3128/
export ftp_proxy=http://$cache_server:3128/
export HTTP_PROXY=http://$cache_server:3128/
#cache with devpi-server
export PIP_INDEX_URL=http://127.0.0.1:3141/root/pypi/+simple/
#cache with git-cache-http-server
export GIT_PROXY=http://127.0.0.1:8080/
#cache with verdacchio
export NPM_CONFIG_REGISTRY=http://127.0.0.1:4873/
export YARN_REGISTRY=http://127.0.0.1:4873/
#'
fi
timeout 1 bash -c 'cat < /dev/null > /dev/tcp/$cache_server/3632'
if [ $? == 0 ] ; then
    echo "running distcc"
    export PATH=/usr/lib64/distcc:$PATH
    export DISTCC_HOSTS="$cache_server"
fi
