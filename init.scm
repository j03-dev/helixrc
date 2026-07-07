(require "system-theme-hx/system-theme.scm")
(auto-theme "catppuccin_macchiato" "gruvbox_light_hard")

(require "oil/oil.scm")
(require "helix/keymaps.scm")

(oil-configure! #false #false)

(keymap (global)
  (normal
    (backspace ":oil-up")
    (C-h ":oil-toggle-hidden")
    (C-i ":oil-toggle-git-ignored")
    (- ":oil")
    (C-p ":oil-paste")
    (C-q ":oil-close")
    (C-r ":oil-refresh")
    (C-s ":oil-save")
    (C-x ":oil-cut")
    (C-y ":oil-yank")
    (ret ":oil-enter")))
