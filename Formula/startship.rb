class Startship < Formula
  desc "Automate releasing of staged artifacts on Sonatype Nexus"
  homepage "https://github.com/saket/startship"
  url "https://github.com/saket/startship/releases/download/v1.0.0/startship.zip"
  sha256 "3042b101e6ffeea838af0a0ba983474fbfd2320e13af31c38ebeda40cebef5ec"

  bottle :unneeded

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"startship").write_env_script libexec/"bin/startship",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/startship --help")
    assert_includes output, "Usage: startship"
  end
end
