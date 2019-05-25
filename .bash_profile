if [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi

if grep -qE "(Microsoft|WSL)" /proc/version &> /dev/null ; then
    echo "Windows 10 Bash"
    export SSH_AUTH_SOCK=/mnt/d/Program\ Files/wsl-ssh-pageant/wsl.sock
    PATH=$PATH:"/mnt/c/Program Files/Microsoft VS Code"
    alias code="Code.exe"
    alias winvlc='/mnt/c/Program\ Files\ \(x86\)/VideoLAN/VLC/vlc.exe'
else
    alias code="rmate"
fi

alias lipos='ssh lipos -A'
alias lipoj='ssh lipoj -A'

alias bal='rm -f debian/pkg/* && szn-buildpackage -nccu'

export SELECTED_EDITOR="/usr/bin/vim.basic"

DEBEMAIL="tomas.lipovsky@firma.seznam.cz"
DEBFULLNAME="Tomáš Lipovský"
USER='tomas.lipovsky'
export DEBEMAIL DEBFULLNAME USER
