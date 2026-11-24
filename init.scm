(require "system-theme-hx/system-theme.scm")
(auto-theme "github_dark_dimmed" "nord_light")

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
    (moka-section (list (moka-segment 'mode) (moka-segment 'diagnostics)) #:align 'left)
    (moka-section (list (moka-segment 'file)) #:align 'center)
    (moka-section (list (moka-segment 'git-branch)) #:align 'right)))

(moka-enable!)

(require "helix-git/helix-git.scm")

(require "xit/xit.scm")

(keymap (global)
  (normal
    (space
      (g ":Git"))))
