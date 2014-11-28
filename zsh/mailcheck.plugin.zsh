# Plugin to check if user has an email
_mail-installed() {
    type mail &> /dev/null
}

function has_mail() {
    _mail-installed || return 1
    mail -e &> /dev/null
}

function get_unread_mail() {
    _mail-installed || return 1
    local unread=$(mail -H 2> /dev/null | awk 'NR==2' | \grep -E -o '[[:digit:]]+ unread' | \egrep -E -o '^[[:digit:]]+')
    if [ -z $unread ]; then
        unread=0
    fi
    echo $unread
}

