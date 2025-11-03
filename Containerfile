# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/cayo:centos@sha256:f3f1737be5d075d368080119e73fa838b9bf74e52dcf9928e2db1c642b6df03c

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint