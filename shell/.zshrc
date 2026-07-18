source /opt/homebrew/share/zsh-autocomplete/zsh-autocomplete.plugin.zsh

# Auto-fix permissions after Homebrew updates
function brew_with_fixed_permissions() {
  command brew "$@"
  if [[ "$1" == "update" || "$1" == "upgrade" || "$1" == "install" || "$1" == "link" ]]; then
    chmod 755 /opt/homebrew/share/zsh/site-functions/_*
  fi
}
alias brew=brew_with_fixed_permissions
