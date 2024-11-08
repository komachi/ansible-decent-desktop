# ansible-decent-desktop

This is an experiment to make desktop/laptop configuration fully controllable by Ansible. Also to experiment with GNU/Linux-based web-3/dapp/defi/security-first/insert-your-buzzword-here setup. Also because it's a lot of work to configure everything each time. Also because I can.

This project is not intended to fulfil desires of every user. I use it to provision my own personal PC. You probably find some defaults incompatible with your view on desktop OS configuration, but you can fork and tune it for yourself, or just look at playbooks for inspirations. PRs with improvements welcomed btw.

This playbook meant to be run against Debian bookworm. It probably won't work for other distros/versions, but you can try.

It focus both on security and speed when it's possible. It uses lightweight software when possible and some specific tuning to meet the goal. Take note that while this README uses word "security" several times, nobody checked this. Think then do.

It enables autologin and intended to use only on single-user desktop machines. Use it only with full-disk encryption and if you are single user. Not only for that reason, the whole playbook is meant to be deployed on a single-user desktop machine.

## Software included

You should look for sources for full list, but here are some choices I made:

- OS: [Debian GNU/Linux](https://debian.org), stable (current bookworm)
- Shell: [bash](https://www.gnu.org/software/bash/)
- Init: [systemd](https://systemd.io)
- MAC: [AppArmor](https://apparmor.net/), [bubblewrap](https://github.com/containers/bubblewrap) used for [Flatpak](https://flatpak.org/)-packed apps. Sister project [apparmor-even-more-profiles](https://github.com/komachi/apparmor-even-more-profiles) deployed by default, bringing profiles for most of included software in enforce mode.
- VPN client: [Wireguard](https://wireguard.com)
- Firewall: [nftables](https://netfilter.org/projects/nftables/) + [OpenSnitch](https://github.com/evilsocket/opensnitch)
- Display server: [Wayland](https://wayland.freedesktop.org/)
- Audio/video server: [PipeWire](https://pipewire.org)
- Display manager: we don't need one, it can be replaced with single systemd unit
- Window manager: [sway](https://swaywm.org/)
- Notification daemon: [mako](https://wayland.emersion.fr/mako)
- Bar: [waybar](https://github.com/Alexays/Waybar)
- Applications launcher: [wofi](https://hg.sr.ht/~scoopta/wofi)
- URI opener: [jaro](https://github.com/isamert/jaro)
- Terminal emulator: [foot](https://codeberg.org/dnkl/foot)
- Network configuration: [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager)
- DNS server: [stubby](https://github.com/getdnsapi/stubby) + [unbound](https://github.com/NLnetLabs/unbound) with DNS blocklists enabled
- Media player: [mpv](https://mpv.io)
- File manager: [PCManFM](https://en.wikipedia.org/wiki/PCMan_File_Manager) and [nnn](https://github.com/jarun/nnn) are available
- [FreeTube](https://freetubeapp.io/) as alternative less privacy-invasing YouTube frontend, also [yt-dlp](https://github.com/yt-dlp/yt-dlp) configured to be used with mpv
- Music player: [mpd](https://musicpd.org/) + [ymuse](https://yktoo.com/en/software/ymuse/)
- Browser: [Firefox](https://mozilla.org/firefox), but [Chromium](https://chromium.org) also available and used for webapps
- Email client: [Thunderbird](https://www.thunderbird.net)
- Source code editor: [VSCodium](https://github.com/VSCodium/vscodium) with extensions from [Open VSX](https://open-vsx.org)
- File sync: [Syncthing](https://syncthing.net/)
- Download managers: [aria2](https://github.com/aria2/aria2), [qBittorrent](https://qbittorrent.org) for [BitTorent](https://www.bittorrent.org), [Nicotine+](https://nicotine-plus.org/) for [Soulseek](https://slsknet.org)
- Some cryptocurrency wallets: [Monero](https://www.getmonero.org/) fullnode, [Electrum](https://electrum.org) and [Wasabi Wallet](https://www.wasabiwallet.io/) for [Bitcoin](https://bitcoin.org/) network, [Electron Cash](https://electroncash.org/) for [Bitcoin Cash](https://bitcoincash.org/), [MyCrypto](https://www.mycrypto.com/) for [Ethereum](https://ethereum.org), [Zecwallet Lite](https://www.zecwallet.co/) for [Zcash](https://z.cash/), [Electrum Dash](https://electrum.dash.org/) for [Dash](https://dash.org/), [Bisq](https://bisq.network/) and [Uniswap](https://uniswap.org/) as DEX
- Support for [Ledger](https://www.ledger.com/), [Trezor](https://trezor.io/), [Nitrokey](https://www.nitrokey.com/), and [OnlyKey](https://onlykey.io/) hardware tokens
- [I2P](https://geti2p.net/), [Tor](https://torproject.org), [IPFS](https://ipfs.io/), etc.
- Office packages: [zathura](https://pwmt.org/projects/zathura/) + [zaread](https://github.com/paoloap/zaread) for simple document viewing and [LibreOffice](https://www.libreoffice.org/) for classical office package editing needs
- Image viewer: [imv](https://github.com/eXeC64/imv)
- Password manager: [KeePassXC](https://keepassxc.org/)
- [DeltaChat](https://delta.chat), XMPP ([Dino](https://dino.im/)), [Telegram](https://telegram.org), [Jami](https://jami.net), Matrix ([nheko](https://nheko-reborn.github.io)), [Mumble](https://www.mumble.info), [SimpleX](https://simplex.chat) messengers
- Local maps with [Organic Maps](https://organicmaps.app/).
- Local dicts with [dictd](https://sourceforge.net/projects/dict/) and [GoldenDict](http://goldendict.org/)
- Virtual machines: [libvirt](https://libvirt.org/) + [QEMU](https://www.qemu.org/) + [virt-manager](https://virt-manager.org/)
- [podman](https://podman.io) + [gvisor](https://gvisor.dev/) by default for launching [OCI containers](https://opencontainers.org), [Docker](https://www.docker.com/) also installed.
- [JOSM](https://josm.openstreetmap.de/) for OpenStreetMap editing
- [node.js](https://nodejs.org), [golang](https://golang.org/), [python](https://python.org), etc. dev env.
- et cetera, et cetera

## Roles

`main.yml` includes it all.

Playbook also depends on some roles defined in submodules, so you should also consult related upstream docs.

### remote_keyring

Install some additional keyrings.

### apt_transport_tor

Enable and enforce apt-transport-tor.

### boot_manager

Configure boot manager.

### audio

Configure audio settings.

### logind

Configure logind.

### additional_locales

Sets some additional locale settings not supported by debops.

### networking

Configure networking.

### mullvad

Configure mullvad VPN.

### firewall

Configure nftables.

### dm

Configure our dm replacement.

### de

Configure window manager and other goodies usually provided by desktop environment.

### packages

Configure specific packages. Most of packages configured here.

### games

Install and configure some games.

### themes

Configure themes.

### fonts

Configure fonts.

### hardware

Configure hardware.

### timezone

Set timezone.

### apparmor_profiles

Install additional apparmor profiles

## Desktop and security improvements

This playbook meant to be used on desktops, so there is specific desktop-friendly settings made. Most of packages are also configured specifically to address security or speed, but here is some things to note

- [Silent boot](https://wiki.archlinux.org/index.php/Silent_boot) is enabled
- [Watchdog](https://wiki.archlinux.org/title/Improving_performance#Watchdogs) is disabled
- [oomd](https://github.com/facebookincubator/oomd) is installed
- [zswap](https://en.wikipedia.org/wiki/Zswap) is enabled
- [gamemode](https://github.com/FeralInteractive/gamemode) is installed
- [VFS cache](https://docs.kernel.org/filesystems/vfs.html) pressure is set to 50, [vm.dirty_ratio](https://docs.kernel.org/admin-guide/sysctl/vm.html) is configured to a lower value
- [TCP Fast Open](https://en.wikipedia.org/wiki/TCP_Fast_Open) is enabled for both sides
- [cfs-zen-tweaks](https://github.com/igo95862/cfs-zen-tweaks) is installed
- [Core dumps](https://en.wikipedia.org/wiki/Core_dump) are disabled
- Ansible comes with [Redis cache](https://docs.ansible.com/ansible/latest/collections/community/general/redis_cache.html) and [mitogen](https://mitogen.networkgenomics.com/ansible_detailed.html)
- Analytics are opted-outed [with env list](/roles/de/files/environment.d/optout.conf)
- [tirdad](https://github.com/0xsirus/tirdad) is installed
- [kloak](https://github.com/vmonaco/kloak) is installed
- Some kernel modules are disabled according to [GrapheneOS list](https://github.com/GrapheneOS/infrastructure/blob/main/modprobe.d/local.conf)
- [Recommended settings from Linux Kernel Self-Protection Project](https://kspp.github.io/Recommended_Settings) are used
- Playbooks `os_hardening` and `ssh_hardening` from [DevSec Hardening Framework](https://dev-sec.io/) are applied

## Test in VM

It can be run in VirtualBox with help of Vagrant and Molecule.

```
poetry install
poetry run molecule converge
```

## Lint

```
sh lint.sh
```

## Run locally

```
sudo apt install git python3-poetry
cd $(mktemp -d)
git clone https://github.com/komachi/ansible-decent-desktop.git
cd ansible-decent-desktop
sh run.sh
```
