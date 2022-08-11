class Unfurl < Formula
  desc "Generate preview of links, inspired by Slack"
  homepage "https://github.com/saket/unfurl"
  url "https://github.com/saket/unfurl/releases/download/1.7.0/unfurl-cli.zip"
  version "1.7.0"
  sha256 "a78f873ce3c261695bdae37caac9b5a49b52b3366111b7d35411eebd4b17b397"

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
