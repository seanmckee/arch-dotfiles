# User binaries and language/tool shims.
export PATH="$HOME/.local/bin:$PATH"

command -v mise >/dev/null && eval "$(mise activate zsh)"
command -v zoxide >/dev/null && eval "$(zoxide init zsh)"

# Shell history. Atuin keeps its own database, but zsh still needs a real
# HISTFILE: with none set, SAVEHIST defaults to 0 and nothing is ever persisted.
export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=50000
export SAVEHIST=50000
setopt EXTENDED_HISTORY SHARE_HISTORY HIST_IGNORE_ALL_DUPS HIST_IGNORE_SPACE HIST_REDUCE_BLANKS

# Context-aware shell history. Sync remains opt-in.
command -v atuin >/dev/null && eval "$(atuin init zsh)"

# Load project-local environment variables after tool-version managers.
command -v direnv >/dev/null && eval "$(direnv hook zsh)"

# Exit Yazi in the directory selected in its file manager.
function y() {
	local tmp cwd
	tmp="$(mktemp -t 'yazi-cwd.XXXXXX')" || return
	command yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	command rm -f -- "$tmp"
	[[ -n "$cwd" && "$cwd" != "$PWD" && -d "$cwd" ]] && builtin cd -- "$cwd"
}

source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

eval "$(starship init zsh)"
