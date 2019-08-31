# homebrew-homebrew

## Usage

    brew tap robertjlooby/homebrew
    brew install <formula>

## Development

To compute the sha256 of a file: `openssl dgst -sha256 <file>`

### Creating bottles

    brew uninstall <name>
    brew install --build-bottle <name>
    brew bottle <name>
