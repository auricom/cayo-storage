# Cayo Storage Deployment Guide

This guide provides step-by-step instructions for building and deploying the Cayo container image on storage server.

## Prerequisites

- A system with Podman installed
- `just` command runner installed

## Deployment Steps

### 1. Build the Container Locally

Build the container image using the provided Justfile:

```bash
just build
```

This command will build the container image locally using Podman.

### 2. Build the ISO Image

Create an ISO image for installation:

```bash
just build-iso
```

This will generate an ISO file that can be used for server installation.

### 3. Install on Server

Use the generated ISO to install the system on your target server:

1. Transfer the ISO to your server or burn it to installation media
2. Boot the server from the ISO
3. Follow the installation process to deploy the system

### 4. Switch to Container Image

Once the system is installed and running, you can target a new container image reference using bootc:

```bash
sudo bootc switch ghcr.io/auricom/cayo-storage:rolling
```

This command will:
- Pull the latest container image from the GitHub Container Registry
- Switch the system to boot from the new container image
- Apply any updates or changes included in the new image

## Additional Information

- The container images are automatically built and published to `ghcr.io/auricom/cayo-storage:rolling`
- You can check the status of your bootc system using `bootc status`
- To see available updates, use `bootc upgrade --check`

## Troubleshooting

If you encounter issues during deployment:

1. Verify that the container image is accessible: `podman pull ghcr.io/auricom/cayo-storage:rolling`
2. Check bootc logs: `journalctl -u bootc-fetch-apply-updates`
3. Ensure your system has sufficient resources for the container image

For more information about bootc, visit the [official documentation](https://bootc-dev.github.io/bootc/).
