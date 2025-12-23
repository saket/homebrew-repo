class Unfurl < Formula
  desc "Generate rich preview of links, inspired by Slack"
  homepage "https://github.com/saket/unfurl"
  url "https://github.com/saket/unfurl/releases/download/2.3.0/unfurl-cli-2.3.1.zip"
  version "2.3.1"
  sha256 "0c41c270cf3f80fe83133e7ed2e9df6bc985a79be1d8366bb43d6d746777cb95"

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
