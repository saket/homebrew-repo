class Startship < Formula
  desc "Automate releasing of staged artifacts on Sonatype Nexus"
  homepage "https://github.com/saket/startship"
  url "https://github.com/saket/startship/releases/download/1.1.1/startship.zip"
  version "1.1.1"
  sha256 "be4cd615ee5f4c0792ffea45baed2a7894fd79c5b4b91b05a1c895b4ef27359d"

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
