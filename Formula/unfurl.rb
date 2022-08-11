class Unfurl < Formula
  desc "Generate preview of links, inspired by Slack"
  homepage "https://github.com/saket/unfurl"
  url "https://github.com/saket/unfurl/releases/download/1.7.0/unfurl-cli.zip"
  version "1.7.0"
  sha256 "1f98ee695912fd2e40a99ed14310fc51ec250d4c201bcfe5b7b7d1f27b4995c5"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"unfurl").write_env_script libexec/"bin/cli",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/unfurl --help")
    assert_includes output, "Usage: unfurl"
  end
end
