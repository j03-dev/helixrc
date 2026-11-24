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
      (g
        (g ":Git") ;; <space>gg -> Open Git UI buffer
        (c ":Git commit") ;; <space>gc -> Open commit buffer
        (d ":git-diff") ;; <space>gd -> View diff
        (D ":git-diff-split") ;; <space>gD -> View diff in vertical split
        (s ":git-stage") ;; <space>gs -> Stage file under cursor
        (u ":git-unstage") ;; <space>gu -> Unstage file under cursor
        (x ":git-discard") ;; <space>gx -> Discard modifications / delete
        (O ":git-resolve-ours") ;; <space>gO -> Resolve conflict with OURS
        (T ":git-resolve-theirs") ;; <space>gT -> Resolve conflict with THEIRS
        (p ":git-push") ;; <space>gp -> Git push
        (f ":git-pull") ;; <space>gf -> Git pull
        (r ":git-refresh") ;; <space>gr -> Refresh status
        (q ":git-close")))))
