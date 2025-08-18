#!/bin/bash

set -ouex pipefail

### Install packages

dnf install -y \
	bat \
	btop \
	fd-find \
	fish \
	fzf \
	libusb1-devel \
	nfs-utils \
	nut \
	samba \
	ripgrep \
	usbutils

# Age
curl -sSfL --output /usr/sbin/age https://dl.filippo.io/age/latest?for=linux/amd64
chown root:root /usr/sbin/age
chmod +x /usr/sbin/age

# Atuin
atuin_installer=$(mktemp --directory)
curl -sSfL --output "${atuin_installer}/atuin.tar.gz" "https://github.com/atuinsh/atuin/releases/latest/download/atuin-x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${atuin_installer}/atuin.tar.gz" -C "${atuin_installer}"
mv "${atuin_installer}"/*/atuin /usr/sbin/atuin
chown root:root /usr/sbin/atuin
rm -rf "${atuin_installer}"

# Chezmoi
chezmoi_version=$(curl -sX GET "https://api.github.com/repos/twpayne/chezmoi/releases/latest" | jq --raw-output '.tag_name')
chezmoi_installer=$(mktemp --directory)
curl -sSfL --output "${chezmoi_installer}/chezmoi.tar.gz" "https://github.com/twpayne/chezmoi/releases/download/${chezmoi_version}/chezmoi_${chezmoi_version#v}_linux-glibc_amd64.tar.gz"
tar xvf "${chezmoi_installer}/chezmoi.tar.gz" -C "${chezmoi_installer}"
mv "${chezmoi_installer}/chezmoi" /usr/sbin/chezmoi
chown root:root /usr/sbin/chezmoi
rm -rf "${chezmoi_installer}"

# Dust
dust_version=$(curl -sX GET "https://api.github.com/repos/bootandy/dust/releases/latest" | jq --raw-output '.tag_name')
dust_installer=$(mktemp --directory)
curl -sSfL --output "${dust_installer}/dust.tar.gz" "https://github.com/bootandy/dust/releases/latest/download/dust-${dust_version}-x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${dust_installer}/dust.tar.gz" -C "${dust_installer}"
mv "${dust_installer}"/*/dust /usr/sbin/dust
chown root:root /usr/sbin/dust
rm -rf "${dust_installer}"

# Dysk
curl -sSfL --output /usr/sbin/dysk https://dystroy.org/dysk/download/x86_64-linux/dysk
chown root:root /usr/sbin/dysk
chmod +x /usr/sbin/dysk

# Eza
eza_installer=$(mktemp --directory)
curl -sSfL --output "${eza_installer}/eza.tar.gz" "https://github.com/eza-community/eza/releases/latest/download/eza_x86_64-unknown-linux-gnu.tar.gz"
tar xvf "${eza_installer}/eza.tar.gz" -C "${eza_installer}"
mv "${eza_installer}/eza" /usr/sbin/eza
chown root:root /usr/sbin/eza
rm -rf "${eza_installer}"

# Restic
restic_version=$(curl -sX GET "https://api.github.com/repos/restic/restic/releases/latest" | jq --raw-output '.tag_name')
restic_installer=$(mktemp --directory)
curl -sSfL --output "${restic_installer}/restic.bz2" "https://github.com/restic/restic/releases/download/${restic_version}/restic_${restic_version#v}_linux_amd64.bz2"
bunzip2 "${restic_installer}/restic.bz2"
mv "${restic_installer}/restic" /usr/sbin/restic
chmod +x /usr/sbin/restic
chown root:root /usr/sbin/restic
rm -rf "${restic_installer}"

# Resticprofile
resticprofile_version=$(curl -sX GET "https://api.github.com/repos/creativeprojects/resticprofile/releases/latest" | jq --raw-output '.tag_name')
resticprofile_installer=$(mktemp --directory)
curl -sSfL --output "${resticprofile_installer}/resticprofile.tar.gz" "https://github.com/creativeprojects/resticprofile/releases/download/${resticprofile_version}/resticprofile_${resticprofile_version#v}_linux_amd64.tar.gz"
tar xvf "${resticprofile_installer}/resticprofile.tar.gz" -C "${resticprofile_installer}"
mv "${resticprofile_installer}/resticprofile" /usr/sbin/resticprofile
chown root:root /usr/sbin/resticprofile
rm -rf "${resticprofile_installer}"

# Sops
sops_version=$(curl -sX GET "https://api.github.com/repos/getsops/sops/releases/latest" | jq --raw-output '.tag_name')
curl -sSfL --output /usr/sbin/sops "https://github.com/getsops/sops/releases/latest/download/sops-${sops_version}.linux.amd64"
chown root:root /usr/sbin/sops
chmod +x /usr/sbin/sops

# Starship
starship_installer=$(mktemp --directory)
curl -sSfL --output "${starship_installer}/starship.tar.gz" "https://github.com/starship/starship/releases/download/v1.23.0/starship-x86_64-unknown-linux-musl.tar.gz"
tar xvf "${starship_installer}/starship.tar.gz" -C "${starship_installer}"
mv "${starship_installer}/starship" /usr/sbin/starship
chown root:root /usr/sbin/starship
rm -rf "${starship_installer}"

# Zoxide
zoxide_version=$(curl -sX GET "https://api.github.com/repos/ajeetdsouza/zoxide/releases/latest" | jq --raw-output '.tag_name')
zoxide_installer=$(mktemp --directory)
curl -sSfL --output "${zoxide_installer}/zoxide.tar.gz" "https://github.com/ajeetdsouza/zoxide/releases/download/${zoxide_version}/zoxide-${zoxide_version#v}-x86_64-unknown-linux-musl.tar.gz"
tar xvf "${zoxide_installer}/zoxide.tar.gz" -C "${zoxide_installer}"
mv "${zoxide_installer}/zoxide" /usr/sbin/zoxide
chown root:root /usr/sbin/zoxide
rm -rf "${zoxide_installer}"
