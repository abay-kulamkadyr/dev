# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc
. "$HOME/.cargo/env"
export PATH="$HOME/.cargo/bin:$PATH"
export XR_RUNTIME_JSON=/usr/local/share/openxr/1/openxr_monado-dev.json
export VK_LAYER_PATH=/home/abe/work/vulkan/Vulkan-ValidationLayers/build/layers
export MANPAGER='nvim +Man!'
export XDG_CONFIG_HOME="$HOME/.config"

eval "$(starship init bash)"
alias vim="nvim"

