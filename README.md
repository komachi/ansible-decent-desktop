# ansible-decent-desktop

This is an experiment to make desktop/laptop configuration fully controllable by Ansible. Also to experiment with GNU/Linux-based web-3/dapp/defi/security-first/insert-your-buzzword-here setup. Also because it's a lot of work to configure everything each time. Also because I can.

This project is not intended to fulfil desires of every user. I use it to provision my own personal PC. You probably find some defaults incompatible with your view on desktop OS configuration, but you can fork and tune it for yourself. PRs with improvements welcomed btw.

This playbook meant to be run against Debian buster. It probably won't work for other distros/versions, but you can try.

It focus both on security and speed when it's possible. It uses lightweight software when possible and some specific tuning to meet the goal. Take note that while this README uses word "security" several times, nobody checked this. Think then do.

It enables autologin and intended to use only on single-user desktop machines. Use it only with full-disk encryption and if you are single user. Not only for that reason, the whole playbook is meant to be deployed on a single-user desktop machine.

## Software included

You should look for sources for full list, but here are some choices I made:

- OS: [Debian GNU/Linux](https://debian.org), stable (currently buster)
- Shell: bash
- Init: systemd (sorry, all of them sucks)
- Display server: X.Org Server
- Sound server: PulseAudio
- Display manager: we don't need one, it can be replaced with single systemd unit
- Window manager: [awesome](https://awesomewm.org)
- Terminal emulator: [rxvt-unicode](http://software.schmorp.de/pkg/rxvt-unicode.html)
- Network configuration: NetworkManager
- DNS server: [stubby](https://github.com/getdnsapi/stubby) + unbound
- Media player: [mpv](https://mpv.io)
- Music player: mpd + pms
- Browser: Firefox
- Source code editor: [VSCodium](https://github.com/VSCodium/vscodium)
- VPN client: [Wireguard](https://wireguard.com)
- Firewall: nftables
- File sync: Syncthing
- Download manager: aria2c + uGet
- Bitcoin, Ethereum and Monero fullnodes
- I2P, Tor, IPFS, Bisq, etc.
- Searx, Jackett
- et cetera, et cetera

## Roles

`main.yml` includes it all.

Playbook also depends on some roles defined in submodules, so you should also consult related upstream docs.

### apt_transport_tor

Enable and enforce apt-transport-tor.

### logind

Configure logind

### locales

Sets some additional locale settings not supported by debops.

### networking

Configure networking

### mullvad

Configure mullvad VPN

### firewall

Configure nftables

### display-server

Configure display server (Xorg)

### dm

Configure our dm replacement

### de

Configure window manager (awesome) and other goodies usually provided by desktop environment

### packages

Configure specific packages

### themes

Configure themes

### fonts

Configure fonts

### hardware

Configure hardware

### bin

Just checkouts https://github.com/komachi/bin to ~/bin

### additional_hardering

Some additional hardering settings placed here, for now it's just installs some packages from whonix repo

## Running in VM

Thanks to Vagrant, we can easily run this playbook in VM. This requires vagrant and virtualbox.

```sh
# Up vm and then provision
vagrant up --provision
```
