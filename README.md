# dotfiles

Personal config backup for editor, terminal, and shell settings.

## Backup

Pull live configs into this repo:

```sh
./scripts/backup.sh
```

Then review, commit, and push:

```sh
git status
git add -A
git commit -m "chore: sync configs"
git push
```

## Restore

Copy files back to their system locations, or symlink them. Examples:

```sh
# Shell
cp Zsh/zshrc ~/.zshrc
cp Starship/starship.toml ~/.config/starship.toml

# Editors
cp "Visual Studio Code/settings.json" ~/Library/Application\ Support/Code/User/settings.json
cp Cursor/settings.json ~/Library/Application\ Support/Cursor/User/settings.json
```

Install extensions from the saved lists:

```sh
cat "Visual Studio Code/extensions.txt" | xargs -L 1 code --install-extension
cat Cursor/extensions.txt | xargs -L 1 cursor --install-extension
```

## Contents


| Path                  | What it backs up                       |
| --------------------- | -------------------------------------- |
| `Visual Studio Code/` | VS Code settings and extensions        |
| `Cursor/`             | Cursor settings and extensions         |
| `Starship/`           | Starship prompt config                 |
| `Zsh/`                | Zsh shell config                       |
| `Oh-my-posh/`         | Oh My Posh theme files                 |
| `Ghostty/`            | Ghostty terminal config (if installed) |
| `Hyper/`              | Hyper terminal config (if installed)   |
| `JavaScript/`         | Shared JS/ESLint config                |
| `TypeScript/`         | TypeScript setup notes                 |
| `scripts/backup.sh`   | Backup script                          |


