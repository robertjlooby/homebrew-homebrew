class ChewiePics < Formula
  desc "Pictures of my dog, Chewie"
  homepage "https://github.com/robertjlooby/chewie-pics"
  url "https://github.com/robertjlooby/chewie-pics/archive/v1.1.1.tar.gz"
  sha256 "29b48279b46f1f6caad3c425bf09747a684e2694d7d9f37277b556dec18bce1c"

  def install
    inreplace "chewie", "CHEWIE_HOME='.'", "CHEWIE_HOME=#{libexec}"
    libexec.install Dir["*"]
    bin.write_exec_script (libexec/"chewie")
  end

  test do
    system "chewie"
  end
end
