# Dockerfile for S3FS

##How to use:
```
docker run -d  --name s3fs --cap-add SYS_ADMIN --device /dev/fuse -v /home/core/s3fs/mapped:/s3fs stakater/s3fs
```
This is WIP.
Issue: volume mapping won't work as expected due to specifying device `/dev/fuse` which is required for s3fs to work

References:
https://github.com/s3fs-fuse/s3fs-fuse