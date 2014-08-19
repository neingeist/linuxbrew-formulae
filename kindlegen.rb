require 'formula'

class Kindlegen < Formula
  homepage 'http://www.amazon.com/gp/feature.html?docId=1000765211'
  #url 'http://kindlegen.s3.amazonaws.com/KindleGen_Mac_i386_v2_9.zip'
  #sha1 '851064ef18687edaf93abd781f9711a2cb293f7d'

  url 'http://kindlegen.s3.amazonaws.com/kindlegen_linux_2.6_i386_v2_9.tar.gz'
  sha1 '2f0a7f7850906b3d458e821f4a53ac75dd02e4b9'

  def install
    bin.install 'kindlegen'
  end

  test do
    system "#{bin}/kindlegen"
  end

  def caveats
    <<-EOS.undent
      We agreed to the KindleGen License Agreement for you by downloading KindleGen.
      If this is unacceptable you should uninstall.

      License information at:
      #{homepage}
    EOS
  end
end
