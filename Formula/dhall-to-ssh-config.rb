class DhallToSshConfig < Formula
  desc "Tool for generating an ssh config from Dhall"
  homepage "https://github.com/robertjlooby/dhall-ssh-config"
  url "https://github.com/robertjlooby/dhall-ssh-config/archive/1.0.0.0.tar.gz"
  sha256 "55d4ff2cfc10d8fbefba764f70492e85a9b63a21d7a7d398f3620e087912fab4"

  head do
    url "https://github.com/robertjlooby/dhall-ssh-config.git"
  end

  bottle do
    root_url "https://github.com/robertjlooby/dhall-ssh-config/releases/download/1.0.0.0"
    sha256 "39516e0d5557057215b561c900b61685863d551f15a2d44f4f35e89d8d9be902" => :mojave
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
