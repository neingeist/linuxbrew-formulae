require 'formula'

class InotifyTools < Formula
  homepage 'http://opencv.org/'
  head 'https://github.com/rvoicilas/inotify-tools.git'


  def install
    system "./autogen.sh"

    args = %W[
      --prefix=#{prefix}
    ]
    system "./configure", *args

    system "make"
    system "make install"
  end
end
