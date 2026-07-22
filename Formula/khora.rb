class Khora < Formula
  desc "CLI for the Khora agent host"
  homepage "https://github.com/khoralabs/homebrew-tap"
  version "0.1.14"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/khoralabs/homebrew-tap/releases/download/khora-cli-v0.1.14/khora-darwin-arm64.tar.gz"
      sha256 "426c1a58888f3720a700424b866f26844059a62cbd8997d97551055333fef373"
    end
  end

  def install
    bin.install "khora"
    bin.install "khora-daemon"
    pkgshare.install "configs"
    pkgshare.install "khora-config.schema.json"
  end

  def post_install
    ENV["KHORA_CLI_ASSETS_DIR"] = pkgshare.to_s
    system bin/"khora", "setup"
  end

  test do
    assert_match "khora", shell_output("#{bin}/khora", 2)
  end
end
