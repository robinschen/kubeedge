#!/bin/bash
# build.sh v1.7.0
COMMIT_SHA1=$(git rev-parse --short HEAD || echo "0.0.0")
BUILD_TIME=$(date "+%F %T")
goldflags="-s -w -X 'github.com/linuxsuren/cobra-extension/version.version=$1' -X 'github.com/linuxsuren/cobra-extension/version.commit=${COMMIT_SHA1}' -X 'github.com/linuxsuren/cobra-extension/version.date=${BUILD_TIME}'"
CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o keadm -ldflags "$goldflags" keadm.go && command -v upx &> /dev/null && upx keadm

