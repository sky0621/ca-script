#!/bin/bash

if [ $# -ne 1 ]; then
  echo "need 1 arg" 1>&2
  exit 1
fi

SCRIPTDIR=$(cd $(dirname $BASH_SOURCE); pwd)

if [ ! -d $1 ]; then
  echo "not directory" 1>&2
  exit 1
fi

cd $1

mkdir cmd usecase domain adapter driver

(
  cd adapter
  mkdir -p controller/model gateway/model
  cp ${SCRIPTDIR}/controller/MEMO.md controller/
  cp ${SCRIPTDIR}/gateway/MEMO.md gateway/
)

(
  cd cmd
  cp ${SCRIPTDIR}/src/main.go ./
)

tree

