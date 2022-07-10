# docker-s6-package

A Docker image containing the [s6 overlay](https://github.com/just-containers/s6-overlay) files only. It's not an OS image that you can base yours on, it just contains the literal s6 files. 

You can use it to overlay s6 into your image without having to locate/download/extract the appropriate tars for your target platform.

## Usage

In your Dockerfile:
```Dockerfile
FROM debian
# or whatever your base is

COPY --from=ghcr.io/jonohill/docker-s6-package / /

# And the rest of your image

```
