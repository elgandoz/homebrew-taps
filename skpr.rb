# typed: false
# frozen_string_literal: true

# This file was generated by GoReleaser. DO NOT EDIT.
class Skpr < Formula
  desc "CLI for the Skpr Hosting Platform"
  homepage "https://www.skpr.io"
  version "0.12.2"
  bottle :unneeded

  on_macos do
    if Hardware::CPU.intel?
      url "https://github.com/skpr/cli/releases/download/v0.12.2/skpr_0.12.2_macOS_amd64.tar.gz"
      sha256 "9a8ae7921df55d11b61947ecde05e82aff553e6ff5963242855c2c2a3880b108"
    end
  end

  on_linux do
    if Hardware::CPU.intel?
      url "https://github.com/skpr/cli/releases/download/v0.12.2/skpr_0.12.2_linux_amd64.tar.gz"
      sha256 "c55b03c0012fe0938a453977771e537a5d8c95e1607e504601368ac5d303f9f4"
    end
  end

  depends_on "rsync" => :optional
  depends_on "docker" => :optional

  def install
    bin.install "skpr"
    bin.install "skpr-rsh"

    man1.install "share/man/man1/skpr.1"

    # Install bash completion
    output = Utils.safe_popen_read("#{bin}/skpr", "--completion-script-bash")
    (bash_completion/"skpr").write output

    # Install zsh completion
    output = Utils.safe_popen_read("#{bin}/skpr", "--completion-script-zsh")
    (zsh_completion/"_skpr").write output
  end
end
