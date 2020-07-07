#!/bin/bash -ex
cd $(dirname $0)
releaseLine=$1
pushd jenkins/war${releaseLine}
  v=$(ls -d ?.* | sort -V | tail -1)
  rm -f latest
  ln -sf $v latest
popd
pushd jenkins/osx${releaseLine}
  cat > .htaccess << EOF
# generated by Puppet as defined from jenkins-infra/jenkins-infra
Redirect /osx${releaseLine}/latest /osx${releaseLine}/jenkins-$v.pkg
EOF
popd
echo -n $v > jenkins/version${releaseLine}.txt
