# Dev environment setup instructions
`sudo apt install ruby ruby-dev`
For building some gems
`sudo apt install build-essential libssl-dev zlib1g-dev`
Install bundle as a user
`gem install --user-install bundle`
Make the bundle path local
`echo 'export BUNDLE_PATH="$HOME/.bundle"' >> ~/.bashrc`
