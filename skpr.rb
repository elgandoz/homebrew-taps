# This file was generated by GoReleaser. DO NOT EDIT.
class Skpr < Formula
  desc "CLI for the Skpr Hosting Platform"
  homepage "https://www.skpr.io"
  version "0.9.5"
  bottle :unneeded

  if OS.mac?
    url "https://github.com/skpr/cli/releases/download/v0.9.5/skpr_0.9.5_macOS_amd64.tar.gz"
    sha256 "256b62950dba3d18cfa616e7e2475751f494646ba7aa2fd0f2c746846ea3baae"
  elsif OS.linux?
    if Hardware::CPU.intel?
      url "https://github.com/skpr/cli/releases/download/v0.9.5/skpr_0.9.5_linux_amd64.tar.gz"
      sha256 "5b1854d02447a8f78d34f3c3333ee361ce08387fa978ec36b8323c195bd7d8d1"
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
