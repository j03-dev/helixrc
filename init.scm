(require "system-theme-hx/system-theme.scm")
(auto-theme "monokai_aqua" "gruvbox_light_hard")

(require "helix/keymaps.scm")
(require "file-tree-hx/file-tree.scm")

(keymap (buffer FILE-TREE) (with-map FILE-TREE-KEYBINDINGS))
