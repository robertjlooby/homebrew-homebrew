class JsonToCsv < Formula
  desc "A tool for converting JSON values to comma-separated values (CSVs)"
  homepage "https://github.com/robertjlooby/json-to-csv"
  url "https://github.com/robertjlooby/json-to-csv/archive/1.0.0.0.tar.gz"
  sha256 "55d4ff2cfc10d8fbefba764f70492e85a9b63a21d7a7d398f3620e087912fab4"

  head do
    url "https://github.com/robertjlooby/json-to-csv.git"
  end

  bottle do
    cellar :any_skip_relocation
    root_url "https://github.com/robertjlooby/json-to-csv/releases/download/1.0.0.0"
    sha256 "39516e0d5557057215b561c900b61685863d551f15a2d44f4f35e89d8d9be902" => :mojave
  end

  depends_on "haskell-stack" => :build

  def install
    opoo "Building from source. This could take a while..."
    system "stack", "setup"
    system "stack", "install", "json-to-csv", "--local-bin-path", bin
  end

  test do
    expected = "test\r\nvalue"
    actual = `echo '{"test": "value"}' | json-to-csv`
    raise "Expected:\n#{expected} Actual:\n#{actual}" unless actual == expected
  end
end
