class JsonToCsv < Formula
  desc "A tool for converting JSON values to comma-separated values (CSVs)"
  homepage "https://github.com/robertjlooby/json-to-csv"
  url "https://github.com/robertjlooby/json-to-csv/archive/1.2.0.0.tar.gz"
  sha256 "492bab2f5d5b82e643a2f421b351730a95e8cac01f59373a2deaa6a3c110f0e9"

  head do
    url "https://github.com/robertjlooby/json-to-csv.git"
  end

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/robertjlooby/json-to-csv/releases/download/1.2.0.0"
    sha256 "c751019d2720efae20e85f6418f00f91a5db886593c5867c6e1953d18c1cd983" => :mojave
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
