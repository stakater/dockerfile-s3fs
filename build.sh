#!/bin/bash
_s3fs_version=$1
_s3fs_tag=$2
_release_build=false

if [ -z "${_s3fs_version}" ]; then
	source S3FS_VERSION
	_s3fs_version=$S3FS_VERSION
	_s3fs_tag=$S3FS_VERSION
	_release_build=true
fi

echo "S3FS_VERSION: ${_s3fs_version}"
echo "DOCKER TAG: ${_s3fs_tag}"
echo "RELEASE BUILD: ${_release_build}"

docker build --build-arg S3FS_VERSION=${_s3fs_version} --tag "stakater/s3fs:${_s3fs_tag}"  --no-cache=true .

if [ $_release_build == true ]; then
	docker build --build-arg S3FS_VERSION=${_s3fs_version} --tag "stakater/s3fs:latest"  --no-cache=true .
fi