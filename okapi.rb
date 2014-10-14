require 'formula'

class Okapi < Formula
  head 'luffa:git/okapi.git',
    :using => :git,
    :branch => "devel"

  depends_on "cmake"      => :build
  depends_on "jpeg"
  depends_on "boost"
  depends_on "libpng"
  depends_on :python
  #depends_on "apr"

  depends_on 'ffmpeg' => :optional

  def install
    args = std_cmake_args + %W(
      -DBoost_NO_SYSTEM_PATHS=ON
      -DOKAPI_WITH_1394=OFF
      -DOKAPI_WITH_EXT_LIBPNG=ON
      -DOKAPI_WITH_OPENCL=ON
    )

    args << "-DCMAKE_BUILD_TYPE=RELEASE"

    mkdir "brewbuild" do
      # libokapi.so is broken with brew's default C/CXXFLAGS?
      ENV['CFLAGS'] = ''
      ENV['CXXFLAGS'] = ''

      system "cmake", "..", *args
      system "make"
      system "make install"
    end
  end
end
