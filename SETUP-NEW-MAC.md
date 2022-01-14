# Getting started

The setup assistant will launch once you turn the computer on. Enter your language, time zone, Apple ID, and so on. The first thing you should do is update macOS to get the latest security updates and patches.

# Shell

Catalina comes with zsh as the default shell. Install Oh My Zsh for sensible defaults.

```
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

# Install dotfiles

Prior to the installation make sure you have committed the alias to your `.bashrc` or `.zsh`:

```
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
```

And that your source repository ignores the folder where you'll clone it, so that you don't create weird recursion problems:

```
echo ".cfg" >> .gitignore
```

Now clone the dotfiles into a bare repository in a "dot" folder of your $HOME:

```
git clone --bare https://github.com/dakshshah96/dotfiles.git $HOME/.cfg
```

Checkout the actual content from the bare repository to your `$HOME`:

```
config checkout
```

The step above might fail with a message might fail due to a conflict with existing files. The solution is simple: back up the files if you care about them, remove them if you don't care.

Set the flag `showUntrackedFiles` to no on this specific (local) repository:

```
config config --local status.showUntrackedFiles no
```

You're done, from now on you can now type config commands to add and update your dotfiles:

```
config status
config add .vimrc
config commit -m "Add vimrc"
config add .bashrc
config commit -m "Add bashrc"
config push
```

# Shell Extras

## Plugins

Oh My Zsh supports a ton of plugins. Here are a few I like to use:

* [brew](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/brew) 
* [fzf](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/fzf)
  * Install [fzf using Homebrew](https://github.com/junegunn/fzf#using-homebrew)
  * `FZF_BASE` has already been added to path in `~/.zshrc`
* [z](https://github.com/ohmyzsh/ohmyzsh/tree/master/plugins/z)
* [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
  * [Install on Oh My Zsh](https://github.com/zsh-users/zsh-autosuggestions/blob/master/INSTALL.md#oh-my-zsh)
* [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
  * [Install on Oh My Zsh](https://github.com/zsh-users/zsh-syntax-highlighting/blob/master/INSTALL.md#oh-my-zsh)
* [diff-so-fancy](https://github.com/so-fancy/diff-so-fancy)
  * [Install using Homebrew](https://formulae.brew.sh/formula/diff-so-fancy)
  * Config has already been set up in `~/.zshrc`

## Aliases

I’m a big fan of aliases. The steps to adding aliases for oh-my-zsh are as follows:

* Go to the folder `cd ~/.oh-my-zsh/custom`
* Create a new `aliases.zsh` file. You can name it what ever you’d like
* Copy the contents of the `aliases.zsh` file in this repository to the newly created file
* Save and quit the editor
* Restart your terminal or use `source ~/.zshrc`

# Homebrew

Install the Homebrew package manager. This will allow you to install almost any app from the command line.

```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

Make sure everything is up to date.

```
brew update
```

Install some basic CLI tools first:

```
brew install git yarn
```

# Quick Look Extensions

* [SourceCodeSyntaxHighlight](https://github.com/sbarex/SourceCodeSyntaxHighlight): Previewing source files with syntax highlighting
* [QLMarkdown](https://github.com/sbarex/QLMarkdown): Previewing Markdown files

# Simple Python Version Management: pyenv

pyenv lets you easily switch between multiple versions of Python. It's simple, unobtrusive, and follows the UNIX tradition of single-purpose tools that do one thing well.

pyenv can usually be installed using Homebrew but there might be a few extra steps involved. Check out their [official documentation](https://github.com/pyenv/pyenv) for the latest installation instructions.

# Install apps

Try to install as much stuff as possible using the command line.

## Command line apps

### Homebrew

```
brew tap clementtsang/bottom

brew install \
  git \
  yarn \
  mas \
  ffmpeg \
  aria2 \
  youtube-dl \
  mkcert \
  subliminal \
  exa \
  xh \
  dog \
  duf \
  bottom
```

### Python

* [ffsubsync](https://github.com/smacke/ffsubsync)

```
pip install \
  ffsubsync \
  glances
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
  macs-fan-control \
  microsoft-edge \
  mongodb-compass \
  monitorcontrol \
  netnewswire \
  nordvpn \
  opera \
  postman \
  qmoji \
  rectangle \
  robo-3t \
  slack \
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
- ToothFairy
- Name Mangler
- PDF Expert
- Paragon NTFS
- Microsoft Excel
- Microsoft Powerpoint
- Microsoft Word

## Theme

Taking inspiration from [Sindre Sorhus](https://github.com/sindresorhus), I've paired the [Pure ZSH prompt](https://github.com/sindresorhus/pure) with the [Snazzy iTerm2 theme](https://github.com/sindresorhus/iterm2-snazzy). Use the "Git clone" method while installing the Pure prompt. Our `~/.zshrc` file already contains the necessary config assuming you've cloned Pure at `$HOME/.zsh/pure`.

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

The first thing you should do with Git is set your global configuration. If you've cloned this repo, the `~/.gitconfig` should already be set up correctly.

## Set up GPG signing for commits

* Install the `gpg-suite-no-mail` Homebrew cask:
```
brew install --cask gpg-suite-no-mail
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

Turn on VS Code's [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync), and sign in with GitHub. No other setup needed. Period.

# Miscellaneous

## Automator: make PDF look like scanned

Printing, stamping and signing documents all day isn't fun. Here's a quick Automator workflow to make any PDF document look like it was scanned. Make sure you have both `imagemagick` and `ghostscript` installed via Homebrew first.

```sh
# Workflow receives current "PDF files" in "any application"
# Shell: /bin/zsh
# Pass input: "as arguments"
export PATH=/usr/local/bin:$PATH
for f in "$@"
do

	base=${f%.pdf}
	base=$base"_scanned.pdf"
	convert -density 150 "$f" -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -colorspace Gray "$base"

done
```
