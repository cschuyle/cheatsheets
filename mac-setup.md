### Settings / Keyboard
    - Repeat speed and delay all the way to the right
    - Shortcuts / Services - remove cmd-shift-A for man page

### Finder config
- Add home directory to Finder sidebar
    - `open $HOME/..`
    - Drag home folder into the sidebar

- Remove iCloud Drive, All my Files and other crap from Finder sidebar

- Finder preferences / Advanced / Show all filename extensions

### Misc

- Settings / Don't update OS automatically

- Settings / Don't update App Store apps automatically

- Settings / Date Time - 24 hour, show date

### Chrome

### Flycut

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

###  `ssh-keygen -t ecdsa -b 521`

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

### Homebrew
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
```
I like these:

```
brew install emacs
brew install git
brew install gradle
brew install maven
brew install the_silver_searcher
brew install libidn2
brew install xmlstarlet
brew install findutils
brew install tree
brew install jq
brew install gnu-sed
brew install libdvdcss
brew install csvkit
brew install python
brew install wget
brew install httpie
brew install jenv
brew install node
brew install watch
brew install tre # for agrep. https://github.com/laurikari/tre
brew install minikube
brew install kubernetes-cli
brew tap heroku/brew && brew install heroku
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

### Spotify

### Log into <https://pinboard.in>, get API key, set it in Chrome plugin

### Command-K in Finder and connect to `afp://192.168.1.wherever-the-synology-is-DHCPd-today`

### ExpressVPN

### GlobalProtect
You'll need to allow it in System Settings / Security or else it'll hang seemingly inexplicably forever when connectin

```
cat >> ~/.profile <<'EOF'
# I Like Emacs I cannot Lie
export EDITOR=emacs

EOF
```

### Clojure

```
brew install clojure/tools/clojure
brew install leiningen
```

- IntelliJ
    - Plugins
        - Cursive (clojure plugin) (must be done through website because, agreement - search the googles)

### oh-my-bash

1.  Upgrade `bash`

```
brew install bash
```

2.  Edit `/private/etc/shells` and add `/usr/local/bin/bash` at the bottom of the list

    ```
    sudo chpass -s /usr/local/bin/bash $(whoami)
    ```
3.  Install `oh-my-bash`, but the web page says to use sh to execute the `curl`-ed script,
    but that will probably not work, so use bash instead:

    ```
    sh -c "$(curl -fsSL https://raw.github.com/ohmybash/oh-my-bash/master/tools/install.sh)"
    ```
4.  Make sure it gets loaded for new terminals
    ```aidl
    cat >>~/.bash_profile <<'EOF'
    [[ -s ~/.bashrc ]] && source ~/.bashrc
    EOF
    ```
    
5.  All that crap you put in `.profile` - make sure it is neither forgotten nor stale

    ```
    cat >> ~/.oh-my-bash/custom/extras.sh <<'EOF'
    [[ -s ~/.profile ]] && source ~/.profile
    ```
