#!/bin/bash
dnf shell -v -y  <<EOF
install --setopt=install_weak_deps=False --nodocs --allowerasing --best 'dnf-command(config-manager)' mageia-repos-cauldron
transaction run
repo disable mageia-x86_64
repo disable updates-x86_64
repo enable cauldron-x86_64
repo enable cauldron-x86_64-nonfree
repo enable cauldron-x86_64-tainted
config-manager  --add-repo http://mirrors.kernel.org/mageia/distrib/cauldron/x86_64/media/core/release cauldron
transaction run
upgrade --allowerasing --best --nodocs --setopt=install_weak_deps=False
run
EOF

