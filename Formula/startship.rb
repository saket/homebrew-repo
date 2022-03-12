class Startship < Formula
  desc "Automate releasing of staged artifacts on Sonatype Nexus"
  homepage "https://github.com/saket/startship"
  url "https://github.com/saket/startship/releases/download/1.2.0/startship.zip"
  version "1.2.0"
  sha256 "948cb696a799d0b29d4e6ac4dad0c9f5430210652c2224127ef8e0428a70ea90"

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
