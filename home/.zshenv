for ve in rbenv pyenv; do
    if type ${ve} &> /dev/null; then
        eval "$(${ve} init -)"
    fi
done
export PATH="~/bin:/usr/local/sbin:/usr/local/bin:$PATH:`npm prefix -g`/bin:$HOME/packer"
[ -f /opt/boxen/env.sh ] && source /opt/boxen/env.sh
