class DhallToSshConfig < Formula
  desc "Tool for generating an ssh config from Dhall"
  homepage "https://github.com/robertjlooby/dhall-ssh-config"
  url "https://github.com/robertjlooby/dhall-ssh-config/archive/0.2.0.0.tar.gz"
  sha256 "c2e6297f8c229df0326a635205b65ca1082a8e3d881870c2b4c0ae5c3d154cdb"

  head do
    url "https://github.com/robertjlooby/dhall-ssh-config.git"
  end

  bottle do
    root_url "https://github.com/robertjlooby/dhall-ssh-config/releases/download/0.2.0.0"
    sha256 "57d993a129f370bb8e7c8c2836c75d3ba497b6c9ec5128ea73b30692dadcd7d2" => :mojave
  end

  depends_on "haskell-stack" => :build

  def install
    system "stack", "install", "dhall-ssh-config", "--local-bin-path", bin
  end

  test do
    expected = "Host example\n     User test\n"
    actual = `echo '[{host = "example", user = Some "test"}]' | dhall-to-ssh-config`
    raise "Expected:\n#{expected} Actual:\n#{actual}" unless actual == expected
  end
end
