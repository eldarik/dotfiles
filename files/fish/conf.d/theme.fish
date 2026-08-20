# fzf palette follows the current appearance.
#
# fzf reads FZF_DEFAULT_OPTS at invocation and fish has no cheap hook to refresh
# it, so only NEW shells pick up a flip. fzf inside nvim is unaffected — it
# derives its colors from live highlight groups (see lua/plugins.lua).
#
# NOTE: this is deliberately -gx, not -U. A leftover universal FZF_DEFAULT_OPTS
# would shadow it; clear one with `set -Ue FZF_DEFAULT_OPTS`.
if test (theme-mode) = dark
    # solarized dark
    set -gx FZF_DEFAULT_OPTS "
      --color=bg+:#073642,fg:#839496,hl:#268bd2
      --color=fg+:#839496,pointer:#b58900,info:#268bd2
      --color=marker:#b58900,spinner:#859900,prompt:#2aa198
      --color=hl+:#b58900
    "
else
    # solarized light
    set -gx FZF_DEFAULT_OPTS "
      --color=bg+:#eee8d5,fg:#657b83,hl:#b58900
      --color=fg+:#586e75,pointer:#859900,info:#268bd2
      --color=marker:#859900,spinner:#2aa198,prompt:#b58900
      --color=hl+:#cb4b16
    "
end
