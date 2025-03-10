# Dev environment setup instructions
`sudo apt install ruby ruby-dev`
For building some gems
`sudo apt install build-essential libssl-dev zlib1g-dev`
Install bundler as a user
`gem install --user-install bundler`
Make the bundle path local
```
export GEM_HOME="$(ruby -e 'puts Gem.user_dir')"
export PATH="$PATH:$GEM_HOME/bin"
export BUNDLE_PATH="$HOME/.bundle"
```
