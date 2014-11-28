# The Perl script colordiff is a wrapper for 'diff' and produces the same
# output but with pretty 'syntax' highlighting.
# http://www.colordiff.org/
#
_colordiff-installed() {
    type colordiff &> /dev/null
}

if _colordiff-installed; then
    alias diff='colordiff'
fi

