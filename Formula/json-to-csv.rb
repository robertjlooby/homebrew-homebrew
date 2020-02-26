class JsonToCsv < Formula
  desc "A tool for converting JSON values to comma-separated values (CSVs)"
  homepage "https://github.com/robertjlooby/json-to-csv"
  url "https://github.com/robertjlooby/json-to-csv/archive/1.2.0.1.tar.gz"
  sha256 "cc8f413708afd1b5f53958bd9d6e83f51815304d0e92d1403cab2c3bf24efbcd"

  head do
    url "https://github.com/robertjlooby/json-to-csv.git"
  end

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/robertjlooby/json-to-csv/releases/download/1.2.0.1"
    sha256 "cd81267f23cf7c3cc0c57c3ca10cfaab3b50d0a48c9b429f8e2615bd0bfbb64b" => :mojave
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
