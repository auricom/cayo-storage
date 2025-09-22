# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/cayo:centos@sha256:ebe4d26183966f809ab87146e14c2c746b5325e4265460f393e2a20d272a8a49

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint