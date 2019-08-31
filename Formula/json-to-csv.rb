class JsonToCsv < Formula
  desc "A tool for converting JSON values to comma-separated values (CSVs)"
  homepage "https://github.com/robertjlooby/json-to-csv"
  url "https://github.com/robertjlooby/json-to-csv/archive/1.1.0.0.tar.gz"
  sha256 "5ef9a9ec9fee994f9e516b0d8829fa60e322250587a689a666c9b2c385a852d7"

  head do
    url "https://github.com/robertjlooby/json-to-csv.git"
  end

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/robertjlooby/json-to-csv/releases/download/1.1.0.0"
    sha256 "8030f1eb9f89118089e8ef7109ac9b6afbcbabb261a1454c6ca86ddf0e41392c" => :mojave
  end

  depends_on "haskell-stack" => :build

  def install
    opoo "Building from source. This could take a while..."
    system "stack", "setup"
    system "stack", "install", "json-to-csv", "--local-bin-path", bin
  end

  test do
    expected = "test\r\nvalue\r\n"
    actual = `echo '{"test": "value"}' | json-to-csv`
    raise "Expected:\n#{expected} Actual:\n#{actual}" unless actual == expected
  end
end
