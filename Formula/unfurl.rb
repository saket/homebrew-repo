class Unfurl < Formula
  desc "Generate preview of links, inspired by Slack"
  homepage "https://github.com/saket/unfurl"
  url "https://github.com/saket/unfurl/releases/download/1.5.0/unfurl-cli.zip"
  version "1.5.0"
  sha256 "0920dd8736f578b3120b7824bb86fc2bd10db6d3d1418f4c674e3f5c5e1d1ee5"

  depends_on "openjdk"

  def install
    rm_f Dir["bin/*.bat"]
    libexec.install %w[bin lib]
    (bin/"unfurl").write_env_script libexec/"bin/unfurl",
      :JAVA_HOME => "${JAVA_HOME:-#{Formula["openjdk"].opt_prefix}}"
  end

  test do
    output = shell_output("#{bin}/unfurl --help")
    assert_includes output, "Usage: unfurl"
  end
end
