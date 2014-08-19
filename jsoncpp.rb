require 'formula'

class Jsoncpp < Formula
  homepage 'http://jsoncpp.sourceforge.net'
  url 'http://downloads.sourceforge.net/project/jsoncpp/jsoncpp/0.6.0-rc2/jsoncpp-src-0.6.0-rc2.tar.gz'
  sha1 'a14eb501c44e610b8aaa2962bd1cc1775ed4fde2'

  depends_on 'scons' => :build

  def install
    # this is how the SConstruct build system creates file paths
    gccversion = `g++ -dumpversion`
    gccversion = gccversion.delete("\n");
    # run the build
    system "scons platform=linux-gcc"
    #install the libs
    lib.install "libs/linux-gcc-#{gccversion}/libjson_linux-gcc-#{gccversion}_libmt.a" => "libjsoncpp.a", 
    "libs/linux-gcc-#{gccversion}/libjson_linux-gcc-#{gccversion}_libmt.so" => "libjsoncpp.so"
    # install the headers
    include.install "include/json" => "json"
  end

  test do
    system "false"
  end
end
