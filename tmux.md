# Tmux

```
➜ cat ~/.tmux.conf
bind-key X set-window-option synchronize-panes\; display-message "synchronize-panes is now #{?pane_synchronized,on,off}"
```

## To do the multiple-commands tmux thing (synchronize panes):

- Set up as many sessions as you need by Ctrl-b `"` or `%`
- Using the binding in .tmux.conf above, Ctrl-b `X` - this toggles the synchronize-panes mode.
- Issue your commands
- Ctrl-b `o` to go to the next pane if you need to edit the command in some way

