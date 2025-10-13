# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/cayo:centos@sha256:f5c0deffb1f5fb7876cf552511852c6a45e66b17743e238ba5a4588c696e7010

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint