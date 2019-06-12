# homebrew-homebrew

## Usage

    brew tap robertjlooby/homebrew
    brew install <formula>

## Development

### Testing formula

You can push up the formula to a brach and build by referencing the raw content of the formula directly like:

    brew install -s https://raw.githubusercontent.com/robertjlooby/homebrew-homebrew/add-message/Formula/dhall-to-ssh-config.rb

### Creating bottles

    brew uninstall <name>
    brew install --build-bottle <name>
    brew bottle <name>
