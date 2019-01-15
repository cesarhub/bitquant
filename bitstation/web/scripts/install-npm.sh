#!/bin/bash
# sudo portion of npm package installations

echo "Running npm installation"
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ME=`stat -c "%U" $SCRIPT_DIR/install-npm.sh`
pushd $SCRIPT_DIR > /dev/null
. norootcheck.sh

sudo /usr/share/bitquant/install-npm-sudo.sh $SCRIPT_DIR $ME

pushd /home/$ME > /dev/null
mkdir -p .ipython/kernels/javascript
pushd .ipython/kernels/javascript > /dev/null
cp $SCRIPT_DIR/javascript/* .
sed -i -e s/%%ME%%/$ME/gi kernel.json
popd > /dev/null
pushd git/ethercalc
npm i
popd
if [ -d git/etherpad-lite ] ; then
pushd git/etherpad-lite
make
popd
fi
popd > /dev/null
popd > /dev/null




