class Startship < Formula
  desc "Automate releasing of staged artifacts on Sonatype Nexus"
  homepage "https://github.com/saket/startship"
  url "https://github.com/saket/startship/releases/download/1.3.0/startship.zip"
  version "1.3.0"
  sha256 "295f821eb56a191c8d14287721ceb945b5cef7a678243359a1efa91beafdadb8"

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
