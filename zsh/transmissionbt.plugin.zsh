# Transmission BitTorrent client
# http://www.transmissionbt.com/
alias txd="transmission-daemon --logfile /tmp/transmission-$USER.log"
alias txadd='transmission-remote -a'
alias tx='transmission-remote'
alias txls='transmission-remote -l'

function txrm() {
    transmission-remote -t $1 -r
}

function txstart() {
    transmission-remote -t $1 -s
}

function txstop() {
    transmission-remote -t $1 -S
}

