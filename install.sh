#!/bin/bash

set -eu

PYTHON_VERSION=$1

if [ "$PYTHON_VERSION" == "3.12" ]; then
	dnf update -y
	dnf install -y make automake gcc gcc-c++ git kernel-devel glibc-static libffi-devel openssl-devel tar which zlib-devel
else
	yum update -y
	yum groupinstall -y "Development Tools"
	yum install -y gcc glibc libffi-devel openssl-devel tar which zlib-devel
fi
