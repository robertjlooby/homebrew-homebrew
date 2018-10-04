class ChewiePics < Formula
  desc "Pictures of my dog, Chewie"
  homepage "https://github.com/robertjlooby/chewie-pics"
  url "https://github.com/robertjlooby/chewie-pics/archive/v1.1.0.tar.gz"
  sha256 "8f20ae298f3d3fc66fe094ab5d2d7786e8b5088bb667e18cd26a01421e8279bd"

  def install
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"chewie")
  end

  test do
    system "chewie"
  end
end
