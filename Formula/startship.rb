class Startship < Formula
  desc "Automate releasing of staged artifacts on Sonatype Nexus"
  homepage "https://github.com/saket/startship"
  url "https://github.com/saket/startship/releases/download/1.1.0/startship.zip"
  version "1.1.0"
  sha256 "9849b9ef8b2c303bee20750650d911f2aec21cfff5a2e35f9840ea2cc1503463"

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
