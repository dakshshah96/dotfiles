# Getting started

The setup assistant will launch once you turn the computer on. Enter your language, time zone, Apple ID, and so on. The first thing you should do is update macOS to get the latest security updates and patches.

# Homebrew

Install the Homebrew package manager. This will allow you to install almost any app from the command line.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Make sure everything is up to date.

```
brew update
```

# Install apps

Try to install as much stuff as possible using the command line.

## Command line apps

```
brew install \
  git \
  yarn \
  mas \
  aria2 \
  youtube-dl
```

## GUI apps

### Brew casks

```
brew cask install \
  1password \
  appcleaner \
  google-backup-and-sync \
  balenaetcher \
  bitbar \
  calibre \
  disk-inventory-x \
  dropbox \
  firefox \
  gimp \
  google-chrome \
  google-drive-file-stream \
  imageoptim \
  inkscape \
  iterm2 \
  kap \
  microsoft-edge \
  netnewswire \
  nordvpn \
  opera \
  postman \
  qmoji \
  rectangle \
  slack \
  studio-3t \
  the-unarchiver \
  visual-studio-code \
  vlc \
  webtorrent \
  whatsapp \
  zoomus
```

### Mac App Store

```sh
mas install 409183694 # Keynote
mas install 409201541 # Pages
mas install 1351639930 # Gifski
```

### Paid apps

- Alfred
- Bartender
- Name Mangler
- PDF Expert
- Paragon NTFS
- Microsoft Excel
- Microsoft Powerpoint
- Microsoft Word

# Shell

Catalina comes with zsh as the default shell. Install Oh My Zsh for sensible defaults.

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

## Aliases

I’m a big fan of aliases. The steps to adding aliases for oh-my-zsh are as follows:

* Go to the folder `cd ~/.oh-my-zsh/custom`
* Create a new `aliases.zsh` file. You can name it what ever you’d like
* Copy the contents of the `aliases.zsh` file in this repository to the newly created file
* Save and quit the editor
* Restart your terminal or use `source ~/.zshrc`

## Plugins

Oh My Zsh supports a ton of plugins. Here are a few I like to use:

* [brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew)
* [fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf)
* [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)

## Theme

Taking inspiration from [Sindre Sorhus](https://github.com/sindresorhus), I've paired the [Pure ZSH prompt](https://github.com/sindresorhus/pure) with the [Snazzy iTerm2 theme](https://github.com/sindresorhus/iterm2-snazzy).

Change the font to Operator Mono in the iTerm2 preferences to get the perfect look for your terminal.

# Node.js

We'll install and use [n](https://github.com/tj/n) to manage Node. This allows you to easily switch between Node versions, which is essential.

```
brew install n
```

## Install

Install the latest LTS version.

```
n lts
```

Install a specific version.

```
n 10.16.0
```

Execute n on its own to view your downloaded versions, and install the selected version.

```
n
```

Confirm that you are using the right version of Node and npm.

```
node -v
npm -v
```

# Git

The first thing you should do with Git is set your global configuration.

```
touch ~/.gitconfig
```

Paste the contents of the `.gitconfig` file in this repository in the newly created file.

## Set up GPG signing for commits

* Install the `gpg-suite-no-mail` Homebrew cask:
```
brew cask install gpg-suite-no-mail
```
* [Generate a new GPG key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)
* [Add the new GPG key to your GitHub account](https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account)
* Configure GPG signing in `.gitconfig`:
```
[user]

  name        =   Daksh Shah
  email       =   dakshshah96@gmail.com
  signingkey  =   F111A753041D81AD

[github]

  user        =   dakshshah96

[gpg]

  program     =   gpg
```
* Export `GPG_TTY` in `~/.zshrc`:
```sh
export GPG_TTY=$(tty)
```
* Run the following test command to check if everything works fine and your key is printed. Select the "Add to keychain" option in the passphrase prompt if you don't want to enter it repeatedly.
```
echo "test" | gpg --clearsign
```

# Generate SSH key

You can generate an SSH key to distribute.

```
ssh-keygen -t rsa -b 4096 -C "dakshshah96@gmail.com"
```

Add key.

```
ssh-add -K ~/.ssh/id_rsa
```

View your public key. You can also [add this key to GitHub](https://help.github.com/en/github/authenticating-to-github/adding-a-new-ssh-key-to-your-github-account).

```
cat ~/.ssh/id_rsa.pub
```

# VS Code

I use the awesome [Settings Sync](https://github.com/shanalikhan/code-settings-sync) extension to keep an up-to-date list of all settings, snippets, themes, file icons, launch, keybindings, workspaces and extensions on [this GitHub Gist](https://gist.github.com/dakshshah96/3eb77547e2f8c35ea8860d0d4b134446).

## Extensions

This is a list of few must-have extensions. This might not be up-to-date. Check the synced settings Gist for the latest list.

```
aaron-bond.better-comments
ban.spellright
bradlc.vscode-tailwindcss
bungcip.better-toml
ChakrounAnas.turbo-console-log
christian-kohler.npm-intellisense
christian-kohler.path-intellisense
CoenraadS.bracket-pair-colorizer
dbaeumer.vscode-eslint
firsttris.vscode-jest-runner
heybourn.headwind
octref.vetur
oderwat.indent-rainbow
redhat.vscode-yaml
shardulm94.trailing-spaces
wix.vscode-import-cost
```

## Theme

I currently use the [Night Owl theme by Sarah Drasner](https://github.com/sdras/night-owl-vscode-theme) with a few customized font settings which can be found in the synced settings Gist.