class Unfurl < Formula
  desc "Generate rich preview of links, inspired by Slack"
  homepage "https://github.com/saket/unfurl"
  url "https://github.com/saket/unfurl/releases/download/2.3.0/unfurl-cli.zip"
  version "2.3.0"
  sha256 "d68a6c4da7d5e2a6941020d1cc7fb15cf03884c5997f56421d63193db079c9c5"

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
