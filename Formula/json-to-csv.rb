class JsonToCsv < Formula
  desc "A tool for converting JSON values to comma-separated values (CSVs)"
  homepage "https://github.com/robertjlooby/json-to-csv"
  url "https://github.com/robertjlooby/json-to-csv/archive/1.0.0.0.tar.gz"
  sha256 "547b6c320eec9590470fd67b219309ec3164e25b58112f413bd88db3b2af2869"

  head do
    url "https://github.com/robertjlooby/json-to-csv.git"
  end

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/robertjlooby/json-to-csv/releases/download/1.0.0.0"
    sha256 "69b83cc8f818f10465009365d11c9fc59b507466b65e80ce4c0549048f5b3fbc" => :mojave
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
