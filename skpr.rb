# This file was generated by GoReleaser. DO NOT EDIT.
class Skpr < Formula
  desc "CLI for the Skpr Hosting Platform"
  homepage "https://www.skpr.io"
  version "0.11.2"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/skpr/cli/releases/download/v0.11.2/skpr_0.11.2_macOS_amd64.tar.gz"
    sha256 "4c9cca12d1914e918f318d39e91153bd0893f4464f288b4c88e19e040b6a3faf"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/skpr/cli/releases/download/v0.11.2/skpr_0.11.2_linux_amd64.tar.gz"
      sha256 "429e0e3aea3f451aa260584137671a415510019ef93614a427578f37e2e06b83"
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
