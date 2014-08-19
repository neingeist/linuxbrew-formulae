# From https://github.com/Homebrew/homebrew/pull/10468/files
require 'formula'

class Cpplint < Formula
  head 'http://google-styleguide.googlecode.com/svn/trunk/cpplint', :using => :svn
  homepage 'http://google-styleguide.googlecode.com/svn/trunk/cpplint/README'
  def install
    bin.install 'cpplint.py'
    bin.install_symlink 'cpplint.py' => 'cpplint'
  end
end
