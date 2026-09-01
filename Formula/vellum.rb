class Vellum < Formula
  desc "CLI for Vellum NBC channels"
  homepage "https://github.com/khoralabs/vellum"
  version "0.1.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/khoralabs/vellum/releases/download/vellum-cli-v0.1.1/vellum-darwin-arm64.tar.gz"
      sha256 "87df1e041fdd57212be74e55702cbfc05ca33cdc2aecc5cd605c5e5cb3e99517"
    end
  end

  def install
    bin.install "vellum"
    bin.install "vellum-daemon"
    pkgshare.install "configs"
    pkgshare.install "vellum-config.schema.json"
  end

  def post_install
    ENV["VELLUM_CLI_ASSETS_DIR"] = pkgshare.to_s
    system bin/"vellum", "setup"
  end

  test do
    assert_match "vellum", shell_output("#{bin}/vellum", 2)
  end
end
