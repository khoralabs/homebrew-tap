class Khora < Formula
  desc "CLI for the Khora agent host"
  homepage "https://github.com/khoralabs/homebrew-tap"
  version "0.1.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/khoralabs/homebrew-tap/releases/download/khora-cli-v0.1.7/khora-darwin-arm64.tar.gz"
      sha256 "10df10ce5d859fb4a57fc540a6dacf63d3daf50f5a7dcf940d5e692e7840c963"
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
