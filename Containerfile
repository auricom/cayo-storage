# Allow build scripts to be referenced without being copied into the final image
FROM scratch AS ctx
COPY build_files /

# Base Image
FROM ghcr.io/ublue-os/cayo:centos@sha256:c5d760e0bce858a306d0567d42159a80cd0bca2fc8250e38105383ca5509d21a

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=cache,dst=/var/cache \
    --mount=type=cache,dst=/var/log \
    --mount=type=tmpfs,dst=/tmp \
    /ctx/packages.sh && \
    ostree container commit

### LINTING
## Verify final image and contents are correct.
RUN bootc container lint