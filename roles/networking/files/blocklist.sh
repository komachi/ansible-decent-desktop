#!/bin/bash
# https://gist.github.com/mudge/eaff0a816e8ee49046e263b0a6e99fe7
set -euo pipefail
IFS=$'\n\t'

(
  curl -sSf "https://raw.githubusercontent.com/anudeepND/whitelist/master/domains/whitelist.txt"
) |
  cat | 
  sort -u | # Remove any duplicates
  awk '{print "local-zone: \""$1".\" always_transparent"}' > /etc/unbound/lists.d/01-safelist.conf

(
  curl -sSf "https://raw.githubusercontent.com/crazy-max/WindowsSpyBlocker/master/data/hosts/spy.txt" ;
  curl -sSf "https://hostfiles.frogeye.fr/multiparty-trackers-hosts.txt" ;
  curl -sSf "https://hostfiles.frogeye.fr/firstparty-trackers-hosts.txt" ;
  curl -sSf "https://www.github.developerdan.com/hosts/lists/ads-and-tracking-extended.txt" ;
  curl -sSf "https://zerodot1.gitlab.io/CoinBlockerLists/hosts_browser" ;
  curl -sSf "https://raw.githubusercontent.com/hoshsadiq/adblock-nocoin-list/master/hosts.txt" ; 
  curl -sSf "https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardMobileSpyware.txt" ;
  curl -sSf "https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardCNAME.txt" ;
  curl -sSf "https://raw.githubusercontent.com/r-a-y/mobile-hosts/master/AdguardTracking.txt" ;
  curl -sSf "https://adaway.org/hosts.txt" ;
) |
  cat |
  grep -E '^(0\.0\.0\.0|127\.0\.0\.1)' |
  tr -d '\r' |
  sort -u  |
  awk '{print "local-zone: \""$2".\" redirect\nlocal-data: \""$2". IN A 0.0.0.0\"\nlocal-data: \""$2". IN AAAA ::\""}' > /etc/unbound/lists.d/02-blocklist.conf