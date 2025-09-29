# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/cayo:centos@sha256:7f76a3fb15c478f39a564413f2c1e6a1a2f029776b5cda882b186c88bf1e7e29

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint