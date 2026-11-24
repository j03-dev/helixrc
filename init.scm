(require "system-theme-hx/system-theme.scm")
(auto-theme "github_dark_dimmed" "nord_light")

(require "oil/oil.scm")
(oil-configure! #false #false)

(require "helix/keymaps.scm")
(keymap (global)
  (normal
    (- ":oil")))

(define oil-keymaps
  (hash
    "normal"
    (hash
      "backspace"
      ":oil-up"
      "I"
      ":oil-toggle-git-ignored"
      "X"
      ":oil-cut"
      "c"
      ":oil-clipboard-clear"
      "h"
      ":oil-toggle-hidden"
      "p"
      ":oil-paste"
      "q"
      ":oil-close"
      "ret"
      ":oil-enter"
      "C-s"
      ":oil-save"
      "y"
      ":oil-yank")))

(define oil-keybindings (deep-copy-global-keybindings))
(merge-keybindings oil-keybindings oil-keymaps)
(set-global-buffer-or-extension-keymap
  (hash OIL-BUFFER-NAME oil-keybindings))

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
