class Flint < Formula
    desc "Generate projects and files from template."
    homepage "https://github.com/flintbox/Flint"
    url "https://github.com/flintbox/Flint/archive/0.1.9.tar.gz"
    sha256 "d375750ba830f944c8777ea58d18ef3f7aecc521e172271321b3f434657fd48b"

    def install
        # fixes an issue an issue in homebrew when both Xcode 9.3+ and command line tools are installed
        # see more details here https://github.com/Homebrew/brew/pull/4147
        # remove this once homebrew is patched
        ENV["CC"] = Utils.popen_read("xcrun -find clang").chomp
        system "make", "release"
        bin.install ".build/release/flint"
    end
end
