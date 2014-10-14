require 'formula'

class Pplatex < Formula
  head 'https://github.com/stefanhepp/pplatex.git', :using => :git
  homepage 'https://github.com/stefanhepp/pplatex'
  def install
    system "scons"
    bin.install 'bin/pplatex'
    bin.install 'bin/ppdflatex'
  end
end
