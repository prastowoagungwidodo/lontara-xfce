![Lontara](https://static.lontara.app/logo.png)

[![bluebuild build badge](https://github.com/prastowoagungwidodo/lontara/actions/workflows/build.yml/badge.svg)](https://github.com/prastowoagungwidodo/lontara/actions/workflows/build.yml)

Lontara is a GNU/Linux desktop operating system based on Fedora Atomic Desktop. It's designed for comfortable (easy and secure) everyday use.

## Features

- Pre-Installed [Trivalent](https://github.com/secureblue/Trivalent) Browser (Chromium based browser with security patch)
- Kernel Hardening using kernel arguments and sysctl configuration
- USB Guard
- Homebrew
- Bazaar as default App Store
- Enable FailLock

## Installation

> [!WARNING]  
> [This is an experimental feature](https://www.fedoraproject.org/wiki/Changes/OstreeNativeContainerStable), try at your own discretion.

To rebase an existing atomic Fedora installation to the latest build:

- First rebase to the unsigned image, to get the proper signing keys and policies installed:

  ```
  rpm-ostree rebase ostree-unverified-registry:ghcr.io/prastowoagungwidodo/lontara:latest
  ```

- Reboot to complete the rebase:

  ```
  systemctl reboot
  ```

- Then rebase to the signed image, like so:

  ```
  rpm-ostree rebase ostree-image-signed:docker://ghcr.io/prastowoagungwidodo/lontara:latest
  ```

- Reboot again to complete the installation

  ```
  systemctl reboot
  ```

The `latest` tag will automatically point to the latest build. That build will still always use the Fedora version specified in `recipe.yml`, so you won't get accidentally updated to the next major version.

## ISO Download

[Download Latest Version](https://drive.google.com/file/d/1bz-tba_559KBV6f7DmxQrVJfBe3M_hfz/view?usp=sharing)

[Checksum](https://drive.google.com/file/d/1MmxTXKaXS2ymJIILl3IpbuoUx0crgbCs/view?usp=sharing)

It's recommended to use "Fedora Media Writer" to create a bootable USB drive. Using other options like DD and other applications should theoretically be fine, but I only tested using Fedora Media Writer.

You can create your own ISO image using [this](https://blue-build.org/learn/universal-blue/#fresh-install-from-an-iso) instructions.

## Post Installation

- To unlock MOK, use "lontara" as MOK Password.
- If youre using LUKS encryption, you can setup TPM2 Unlock using command: `ujust setup-luks-tpm-unlock`
- Trivalent disabled Chrome Extensions by default. Go to Security Settings to enable. `chrome://settings/security`
- Disable Network Service Sandbox if you have login sessions issues. `chrome://settings/security`
- If you having issues opening some apps and need to enable X11, override gnome-shell User Service using `systemctl --user edit org.gnome.Shell@user.service` and add the following content to the top of the file:

  ```
  [Service]
  ExecStart=
  ExecStart=/usr/bin/gnome-shell --mode=%i
  ```

make sure to reload the systemd user daemon and restart gnome-shell after that:

```
systemctl --user daemon-reload
```

Log out and log back in to apply the changes:

## Verification

These images are signed with [Sigstore](https://www.sigstore.dev/)'s [cosign](https://github.com/sigstore/cosign). You can verify the signature by downloading the `cosign.pub` file from this repo and running the following command:

```bash
cosign verify --key cosign.pub ghcr.io/prastowoagungwidodo/lontara
```
