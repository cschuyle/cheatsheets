# Ooooh I got a new Mac

Now I get to set all the stuff up!
It's _way_ better than Christmas

### Settings / Keyboard

- Repeat speed and delay all the way to the right
- Shortcuts / Services - remove cmd-shift-A for man page
- System Preferences > Keyboard. Click the Modifier Keys..., maps caps lock to Esc.
  Do it for each separate keyboard (external, built-in)
  
### Finder config
-   Add home directory to Finder sidebar
    -   `open $HOME/..`
    -   Drag home folder into the sidebar

-   Remove iCloud Drive, All my Files and other crap from Finder sidebar

-   Finder Preferences 
    -   Advanced / Show all filename extensions
    -   Advanced / When performing a search / Search the current folder
    
-   Open Finder, select Gallery view (the one with pictures), View / Show view options / Thumbnail size: select largest.
    Also, select Show filename
    
-   Click `Use as Defaults` button

```
sudo chflags nohidden /
write com.apple.finder AppleShowAllFiles TRUE
```

You need to logout and back in for that last one to take effect

### Misc System Settings

- Settings / Don't update OS automatically

- Settings / Don't update App Store apps automatically

- Settings / Date Time - 24 hour, show date

- Apple Music
    - Do not copy files when importing
    - Import using Custom / MP3 / VBR / 320Kbps
    
### Chrome

### Flycut
Also System Settings / Login Items, add Flycut to the apps that startup at login time

### VNC

### iTerm2
- Config:
    - Preferences / Profiles
        - Enable pixel sub-aliasing
        - 20,000 line scrollback
        - About 10% transparent
    - Preferences / Appearance
        - Show border around windows

### IntelliJ
    - Plugins
        - Kubernetes
        - Go Template
        - Key Promoter X
        - Logtalk
        - Perl
        - Scala

### `ssh-keygen -t ecdsa -b 521`

### Slack

### Zoom

### Xcode
Just in case there's an xcode, blow it away and reinstall it, because often it's effd up

```
xcode-select -p
(output:) /Library/Developer/CommandLineTools
```

That was just to see where the existing xcode is, to now remove it:

```
sudo rm -rf /Library/Developer/CommandLineTools
xcode-select --install
```

### SourceTree

<https://www.sourcetreeapp.com/>

### Because sometimes you need to suck it and use JDK 6
<https://support.apple.com/kb/DL1572?locale=en_US>

### Java 14

```
curl https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_osx-x64_bin.tar.gz > openjdk-14.0.1_osx-x64_bin.tar.gz

tar xzf openjdk-14.0.1_osx-x64_bin.tar.gz

mv jdk-14.0.1.jdk/ ~

cat >> ~/.profile <<'EOF'
# Java 14
export JAVA_HOME="$HOME/jdk-14.0.1.jdk/Contents/Home"

EOF
```

### Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```

### jenv

```
brew install jenv

jenv add jdk-14.0.1.jdk/Contents/Home

cat >> ~/.profile <<'EOF'
# Let's use Java 14 by default shall we
eval "$(jenv init -)"
jenv global 14

EOF
```

### Lots of Homebrew stuff

```
brew install openssl readline sqlite3 xz zlib # Yeah the follwing ones will transitively install all that xcept zlib, but it makes me feel good to install the libs first
brew install perl
brew install python
brew install emacs
brew install gnu-sed
brew install findutils
brew install git
brew install gradle
brew install maven
brew install the_silver_searcher
brew install libidn2
brew install xmlstarlet
brew install tree
brew install jq
brew install libdvdcss
brew install csvkit
brew install wget
brew install httpie
brew install jenv
brew install node
brew install watch
brew install tre # for agrep. https://github.com/laurikari/tre
brew install kubernetes-cli
brew tap heroku/brew && brew install heroku
brew install gdub
brew install coreutils
brew install bcrypt
brew install gnu-tar
```

```bash
brew cask install WebPQuickLook
# Then allow it in System Setting / Security, or from the command line:
xattr -d com.apple.quarantine ~/Library/QuickLook/WebpQuickLook.qlgenerator
```

```
brew install minikube
minikube start # This takes a while to bootstrap - get it out of the way now
```

### Some aliases

```
cat >> ~/.profile <<'EOF'
# The Cool Kids all do it with a k solo
alias k=kubectl

# Also makes it nice to not launch GhostScript in case it's installed
alias gs='git status'

EOF
```

### Configure `git`

```
git config --global user.name "Jabba the Hutt"
git config --global user.email jabba@thehutt.nalhutta
git config --global branch.autoSetupRebase always
git config --global pull.rebase true
```

#### `git lola`

```
cat >> ~/.gitconfig <<'EOF'
[alias]
        lol = log --graph --decorate --pretty=oneline --abbrev-commit
        lola = log --graph --decorate --pretty=oneline --abbrev-commit --all
[color]
        branch = auto
        diff = auto
        interactive = auto
        status = auto
EOF
```

```
cat >> ~/.profile <<'EOF'
# Because, Catalina wants to force zsh on me
export BASH_SILENCE_DEPRECATION_WARNING=1

EOF
```

## Maybe not everyone's cuppa tea:

### WhatsApp

### Handbrake
Set new default preset:
- All subtitles
- All audio

### Spotify

Setup local files

Because the Music app on Catalina is all kinds of broken for me
- Doesn't allow me to download artwork even though I'm logged in to my Aple account
- Doesn't sync when I change the music folder location

Still can't get artwork like I want, esp for the screensaver.

Tried Vox and Musique.   But Spotify won so far.

### Log into <https://pinboard.in>, get API key, set it in Chrome plugin

### Command-K in Finder and connect to `afp://192.168.1.wherever-the-synology-is-DHCPd-today`

### ExpressVPN

### StockSpy realtime stock quotes

### Discord

### Moom or Divvy

### GlobalProtect
You'll need to allow it in System Settings / Security or else it'll hang seemingly inexplicably forever when connectin

```
cat >> ~/.profile <<'EOF'
# I Like Emacs I cannot Lie
export EDITOR=emacs

EOF
```

### Twitter

### Kindle reader 

### <https://krisp.ai/>


### Clojure

```
brew install clojure/tools/clojure
brew install leiningen
```

- IntelliJ
    - Plugins
        - Cursive (clojure plugin) (must be done through website because, agreement - search the googles)
        - Elm
        
### python

I like `pyenv`

```bash
brew install pyenv
pyenv install 2.7.18
pyenv install 3.8.3 
```

*BUT* it conflicts with `brew`, so add this to `.bashrc` or wherever you put your aliases:
```
alias brew="env PATH=${PATH//$(pyenv root)\/shims:/} brew" # from https://github.com/pyenv/pyenv/issues/106
```

### oh-my-bash

1.  Upgrade `bash`

    ```
    brew install bash
    ```

1.  Set remote to my fork
    ```bash
    git remote remove origin
    git remote add origin git@github.com:cschuyle/oh-my-bash.git
    ```
    
1.  Edit `/private/etc/shells` and add `/usr/local/bin/bash` at the bottom of the list

1.  Set your shell to the new `bash`    
    ```
    sudo chpass -s /usr/local/bin/bash $(whoami)
    ```

1.  Install `oh-my-bash`, but the web page says to use sh to execute the `curl`-ed script,
    but that will probably not work, so use bash instead (copied from the install webpage, but change the first command from `sh` to `bash`):

    ```
    bash -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    ```

1.  Make sure it gets loaded for new terminals
    ```
    cat >>~/.bash_profile <<'EOF'
    [[ -s ~/.bashrc ]] && source ~/.bashrc
    EOF
    ```
    
1.  All that crap you put in `.profile` - make sure it is neither forgotten nor stale

    ```
    cat >> ~/.oh-my-bash/custom/extras.sh <<'EOF'
    [[ -s ~/.profile ]] && source ~/.profile
    EOF
    ```
    
### Elm

[Mac Elm installer](https://github.com/elm/compiler/releases/download/0.19.0/installer-for-mac.pkg)
```bash
brew install elm-format
npm install -g elm-test
```

# Day 2

Why does this not work to mount an AFP directory from my Synology?
```
sudo mkdir -p /Volumes/$DIR && sudo chown $(whoami) /Volumes/$DIR  && sudo mount_afp afp://"'$USER'":"'$PASS'"@$IP/$DIR /Volumes/$DIR
```
This mounts the directory, but trying to access it results in `Permission Denied`.

The problem appears to be that the owner of the `/Volumes/$DIR` directory is root,
and it's impossible to chown or chmod it.

When you do the mount using Cmd-K from Finder, the owner is me (not root) and everything is hunky dory.