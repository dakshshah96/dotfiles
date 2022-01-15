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

## Theme

Taking inspiration from [Sindre Sorhus](https://github.com/sindresorhus), I've paired the [Pure ZSH prompt](https://github.com/sindresorhus/pure) with the [Snazzy iTerm2 theme](https://github.com/sindresorhus/iterm2-snazzy). Use the "Git clone" method while installing the Pure prompt. Our `~/.zshrc` file already contains the necessary config assuming you've cloned Pure at `$HOME/.zsh/pure`.

Change the font to [Operator Mono](https://www.typography.com/fonts/operator/overview) in the iTerm2 preferences to get the perfect look for your terminal.

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

# JavaScript tooling

We use [Volta](https://volta.sh/) to manage all our JavaScript tooling. Volta’s job is to get out of your way. With Volta, you can select a Node engine once and then stop worrying about it. You can switch between projects and stop having to manually switch between Nodes. You can install npm package binaries in your toolchain without having to periodically reinstall them or figure out why they’ve stopped working.

## Install

We'll skip updating our shell files during installation since we already have `VOLTA_HOME` set and `$VOLTA_HOME/bin` added to path:

```
curl https://get.volta.sh | bash -s -- --skip-setup
```

That's it. [Learn more](https://docs.volta.sh/guide/understanding) about using Volta in their documentation.

# Git

The first thing you should do with Git is set your global configuration. If you've cloned this repo, the `~/.gitconfig` should already be set up correctly.

## Set up GPG signing for commits

* Install the `gpg-suite-no-mail` Homebrew cask:
```
brew install --cask gpg-suite-no-mail
```
* [Generate a new GPG key](https://help.github.com/en/github/authenticating-to-github/generating-a-new-gpg-key)
* [Add the new GPG key to your GitHub account](https://help.github.com/en/github/authenticating-to-github/adding-a-new-gpg-key-to-your-github-account)
* Update the GPG `signingKey` in `.gitconfig`
* Export `GPG_TTY` in `~/.zshrc`:
```sh
export GPG_TTY=$(tty)
```
* Run the following test command to check if everything works fine and your key is printed. Select the "Add to keychain" option in the passphrase prompt if you don't want to enter it repeatedly.
```
echo "test" | gpg --clearsign
```

# Generate SSH key

⚠️ You could just transfer the SSH key from an older machine, but it's always recommended to generate a new SSH key for each location.

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

# Install apps

A huge list of useful CLI tools and apps (not in any particular order/may not be up to date):

<details>
<summary>Click to expand!</summary>

- [1Password](https://1password.com/)
- [AdGuard](https://adguard.com)
- [Altair GraphQL Client](https://github.com/altair-graphql/altair)
- [balenaEtcher](https://www.balena.io/etcher/)
- [Brave Browser](https://brave.com/)
- [DaisyDisk](https://apps.apple.com/us/app/daisydisk/id411643860)
- [Fig](https://fig.io/)
- [Gifski](https://github.com/sindresorhus/Gifski)
- [ImageOptim](https://imageoptim.com/mac)
- [Infuse](https://firecore.com/infuse)
- [Kap](https://github.com/wulkano/Kap)
- [Linear](https://linear.app/)
- Microsoft Excel
- Microsoft Powerpoint
- Microsoft Word
- [MonitorControl](https://github.com/MonitorControl/MonitorControl)
- [Notion](https://www.notion.so/)
- Numbers
- Pages
- [PDF Expert](https://pdfexpert.com/)
- [Pixelmator Pro](https://www.pixelmator.com/pro/)
- [Raycast](https://www.raycast.com/)
- [Rectangle](https://github.com/rxhanson/Rectangle)
- [Setapp](https://setapp.com/)
- [Silicon](https://github.com/DigiDNA/Silicon)
- [Slack](https://slack.com/intl/en-in/)
- [Spotify](https://www.spotify.com/in-en/)
- [Telegram](https://telegram.org/)
- [Todoist](https://todoist.com/)
- [Transmission](https://transmissionbt.com/)
- [Visual Studio Code](https://code.visualstudio.com/)
- [WhatsApp](https://www.whatsapp.com/download)
- [Wondershare PDFelement](https://pdf.wondershare.com/)
- [Zoom](https://zoom.us/download)
	
- [Doppler](https://docs.doppler.com/docs/cli)
- [fzf](https://github.com/junegunn/fzf)
- [mkcert](https://github.com/FiloSottile/mkcert)
- [subliminal](https://github.com/Diaoul/subliminal)

</details>

# VS Code

Turn on VS Code's [Settings Sync](https://code.visualstudio.com/docs/editor/settings-sync), and sign in with GitHub. No other setup needed. Period.

# Miscellaneous

## Automator: make PDF look like scanned

Printing, stamping and signing documents all day isn't fun. Here's a quick Automator Quick Action to make any PDF document look like it was scanned. Make sure you have both `imagemagick` and `ghostscript` installed via Homebrew first.

```sh
# Workflow receives current "PDF files" in "any application"
# Action: Run Shell Script
# Shell: /bin/zsh
# Pass input: "as arguments"
export PATH="/opt/homebrew/bin:$PATH"
for f in "$@"
do

	base=${f%.pdf}
	base=$base"_scanned.pdf"
	convert -density 150 "$f" -rotate "$([ $((RANDOM % 2)) -eq 1 ] && echo -)0.$(($RANDOM % 4 + 5))" -colorspace Gray "$base"

done
```
