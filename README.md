# ansible-decent-desktop

This is an experiment to make desktop/laptop configuration fully controllable by Ansible. Also to experiment with GNU/Linux-based web-3/dapp/defi/security-first/insert-your-buzzword-here setup. Also because it's a lot of work to configure everything each time. Also because I can.

This project is not intended to fulfil desires of every user. I use it to provision my own personal PC. You probably find some defaults incompatible with your view on desktop OS configuration, but you can fork and tune it for yourself, or just look at playbooks for inspirations. PRs with improvements welcomed btw.

This playbook meant to be run against Debian buster. It probably won't work for other distros/versions, but you can try.

It focus both on security and speed when it's possible. It uses lightweight software when possible and some specific tuning to meet the goal. Take note that while this README uses word "security" several times, nobody checked this. Think then do.

It enables autologin and intended to use only on single-user desktop machines. Use it only with full-disk encryption and if you are single user. Not only for that reason, the whole playbook is meant to be deployed on a single-user desktop machine.

## Software included

You should look for sources for full list, but here are some choices I made:

- OS: [Debian GNU/Linux](https://debian.org), stable (currently buster)
- Shell: [bash](https://www.gnu.org/software/bash/)
- Init: [systemd](https://systemd.io) (sorry, all of them sucks)
- MAC: [AppArmor](https://apparmor.net/), [bubblewrap](https://github.com/containers/bubblewrap) used for [Flatpak](https://flatpak.org/)-packed apps
- VPN client: [Wireguard](https://wireguard.com)
- Firewall: [nftables](https://netfilter.org/projects/nftables/)
- Display server: [X.Org Server](https://www.x.org)
- Sound server: [PulseAudio](https://www.freedesktop.org/wiki/Software/PulseAudio/)
- Display manager: we don't need one, it can be replaced with single systemd unit
- Window manager: [i3wm](https://i3wm.org/)
- Terminal emulator: [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html)
- Network configuration: [NetworkManager](https://wiki.gnome.org/Projects/NetworkManager)
- DNS server: [stubby](https://github.com/getdnsapi/stubby) + [unbound](https://github.com/NLnetLabs/unbound)
- Media player: [mpv](https://mpv.io)
- Music player: [mpd](https://musicpd.org/) + [pms](https://ambientsound.github.io/pms/)
- Browser: [Firefox](https://mozilla.org/firefox), but [Ungoogled Chromium](https://github.com/Eloston/ungoogled-chromium) and [Brave](https://brave.com/) also available
- Email client: [Thunderbird](https://www.thunderbird.net)
- Source code editor: [VSCodium](https://github.com/VSCodium/vscodium)
- File sync: [Syncthing](https://syncthing.net/)
- Download manager: [aria2](https://github.com/aria2/aria2) + [uGet](https://ugetdm.com/), [XD](https://xd-torrent.github.io) for I2P torrents
- Some cryptocurrency wallets
- [I2P](https://geti2p.net/), [Tor](https://torproject.org), [IPFS](https://ipfs.io/), [Lokinet](https://loki.network), [Gnunet](https://gnunet.org), [Bisq](https://bisq.network/), etc.
- [Searx](https://searx.github.io/searx/), [Jackett](https://github.com/Jackett/Jackett)
- Office package: [zathura](https://pwmt.org/projects/zathura/) + [LibreOffice](https://www.libreoffice.org/) + [zaread](https://github.com/paoloap/zaread)
- Image viewer: [sxiv](https://github.com/muennich/sxiv)
- Password manager: [KeePassXC](https://keepassxc.org/)
- Local bookmarks with [shiori](https://github.com/go-shiori/shiori)
- [DeltaChat](https://delta.chat), XMPP ([coyim](https://coy.im/)), [Telegram](https://telegram.org), Slack ([slack-term](https://github.com/erroneousboat/slack-term)), [Jami](https://jami.net), Matrix ([Quaternion](https://github.com/quotient-im/Quaternion)) messengers
- Local maps with [Pure Maps](https://github.com/rinigus/pure-maps) and [OSM Scout Server](https://github.com/rinigus/osmscout-server)
- Local dicts with [dictd](https://sourceforge.net/projects/dict/) and [GoldenDict](http://goldendict.org/)
- Virtual machines: [libvirt](https://libvirt.org/) + [QEMU](https://www.qemu.org/) + [virt-manager](https://virt-manager.org/)
- et cetera, et cetera

## Roles

`main.yml` includes it all.

Playbook also depends on some roles defined in submodules, so you should also consult related upstream docs.

### remote_keyring

Install some additional keyrings.

### apt_transport_tor

Enable and enforce apt-transport-tor.

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

### display-server

Configure display server (Xorg).

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

### bin

Just checkouts https://github.com/komachi/bin to ~/bin

### timezone

Set timezone.

### apparmor_profiles

Install additional apparmor profiles from [apparmor-even-more-profiles](https://github.com/komachi/apparmor-even-more-profiles)

### additional_hardering

Some additional hardering settings placed here, for now it's just installs some packages from whonix repo
