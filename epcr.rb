class Epcr < Formula
  desc "In-silico PCR from NCBI"
  homepage "https://sourceforge.net/projects/simulatepcr/"

  # tag "bioinformatics"

  url "ftp://ftp.ncbi.nlm.nih.gov/pub/schuler/e-PCR/e-PCR-2.3.12-1-src.tar.gz"
  sha256 "92613a09cbba3eab66916488063b56e2a3b50a82e5308b1731b6b90d232b8275"

  env :std

  def install
    ENV.deparallelize
    ENV.delete('CFLAGS')
    ENV.delete('CXXFLAGS')
    ENV.delete('LDFLAGS')
    system 'make links depend all OPTIMIZE=6'
    bin.install %w(e-PCR re-PCR famap fahash)
  end

  test do
    assert_match "amplicon", shell_output("#{bin}/simulate_PCR 2>&1", 255)
  end
end
