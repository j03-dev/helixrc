(require "system-theme-hx/system-theme.scm")
(auto-theme "ttox_soft" "ayu_light")

(require "oil/oil.scm")
(oil-configure! #false #false)

(require "helix/keymaps.scm")
(keymap (global)
  (normal
    (backspace ":oil-up")
    (C-h ":oil-toggle-hidden")
    (C-i ":oil-toggle-git-ignored")
    (- ":oil")
    (C-p ":oil-paste")
    (C-q ":oil-close")
    (C-R ":oil-refresh")
    (C-s ":oil-save")
    (C-x ":oil-cut")
    (C-y ":oil-yank")
    (ret ":oil-enter")))

(require "fake-warp/fake-warp.scm")
(install-fake-warp!)

(require "moka/moka.scm")

(moka-configure!
  #:sections
  (list
    (moka-section (list (moka-segment 'mode) (moka-segment 'file)) #:align 'left)
    (moka-section (list (moka-segment 'lsp) (moka-segment 'git-branch) (moka-segment 'position)) #:align 'right)))

(moka-enable!)
