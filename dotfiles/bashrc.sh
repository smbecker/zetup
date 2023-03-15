export DOTDIR="$HOME/zetup/dotfiles"
export OVERRIDEDIR="$HOME/zetup/override"
export CUSTOMDIR="$HOME/secrets/dotfiles"
for dotfile in "bashrc.sh" "aliases.sh" "fns.sh" ;
  do
    if [ -f "$OVERRIDEDIR/$dotfile" ] ;
      then source "$OVERRIDEDIR/$dotfile" ;
      else source "$DOTDIR/_$dotfile" ;
    fi
    if [ -f "$CUSTOMDIR/$dotfile" ] ; then source "$CUSTOMDIR/$dotfile" ; fi
  done

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/usr/lib/jvm/jdk-19

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/gradle/gradle-8.0.2/bin:$PATH"
