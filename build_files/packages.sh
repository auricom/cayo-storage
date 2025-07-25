#!/bin/bash

set -ouex pipefail

### Install packages

dnf install -y \
	bat \
	btop \
	fd-find \
	fish \
	fzf \
	nfs-utils \
	nut \
	samba \
	ripgrep \
	usbutils

# Age
curl -sSfL --output /usr/bin/age https://dl.filippo.io/age/latest?for=linux/amd64
chmod +x /usr/bin/age

# Atuin
atuin_installer=$(mktemp --directory)
curl -sSfL --output "${atuin_installer}/atuin.tar.gz" "https://github.com/atuinsh/atuin/releases/latest/download/atuin-x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${atuin_installer}/atuin.tar.gz" -C "${atuin_installer}"
mv "${atuin_installer}"/*/atuin /usr/bin/atuin
rm -rf "${atuin_installer}"

# Chezmoi
chezmoi_version=$(curl -sX GET "https://api.github.com/repos/twpayne/chezmoi/releases/latest" | jq --raw-output '.tag_name')
chezmoi_installer=$(mktemp --directory)
curl -sSfL --output "${chezmoi_installer}/chezmoi.tar.gz" "https://github.com/twpayne/chezmoi/releases/download/${chezmoi_version}/chezmoi_${chezmoi_version#v}_linux-glibc_amd64.tar.gz"
tar xvf "${chezmoi_installer}/chezmoi.tar.gz" -C "${chezmoi_installer}"
mv "${chezmoi_installer}/chezmoi" /usr/bin/chezmoi
rm -rf "${chezmoi_installer}"

# Dust
dust_version=$(curl -sX GET "https://api.github.com/repos/bootandy/dust/releases/latest" | jq --raw-output '.tag_name')
dust_installer=$(mktemp --directory)
curl -sSfL --output "${dust_installer}/dust.tar.gz" "https://github.com/bootandy/dust/releases/latest/download/dust-${dust_version}-x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${dust_installer}/dust.tar.gz" -C "${dust_installer}"
mv "${dust_installer}"/*/dust /usr/bin/dust
rm -rf "${dust_installer}"

# Dysk
curl -sSfL --output /usr/bin/dysk https://dystroy.org/dysk/download/x86_64-linux/dysk
chmod +x /usr/bin/dysk

# Eza
eza_installer=$(mktemp --directory)
curl -sSfL --output "${eza_installer}/eza.tar.gz" "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${eza_installer}/eza.tar.gz" -C "${eza_installer}"
mv "${eza_installer}/eza" /usr/bin/eza
rm -rf "${eza_installer}"

# Sops
sops_version=$(curl -sX GET "https://api.github.com/repos/getsops/sops/releases/latest" | jq --raw-output '.tag_name')
curl -sSfL --output /usr/bin/sops "https://github.com/getsops/sops/releases/latest/download/sops-${sops_version}.linux.amd64"
chmod +x /usr/bin/sops

# Zoxide
zoxide_version=$(curl -sX GET "https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest" | jq --raw-output '.tag_name')
zoxide_installer=$(mktemp --directory)
curl -sSfL --output "${zoxide_installer}/zoxide.tar.gz" "https://github.com/ajeetdsouza/zoxide/releases/download/${zoxide_version}/zoxide-${zoxide_version#v}-x86_64-unknown-linux-musl.tar.gz"
tar xvf "${zoxide_installer}/zoxide.tar.gz" -C "${zoxide_installer}"
mv "${zoxide_installer}/zoxide" /usr/bin/zoxide
rm -rf "${zoxide_installer}"
