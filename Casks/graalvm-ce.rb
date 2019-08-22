cask 'graalvm-ce' do
  version '19.2.0'
  sha256 '54bd7f7398ee0fb2d1c9eb8a939a5ccb05166cb9c544bc700020fc37dc661483'

  # github.com/oracle/graal was verified as official when first introduced to the cask
  url "https://github.com/oracle/graal/releases/download/vm-#{version.downcase}/graalvm-ce-darwin-amd64-#{version.downcase}.tar.gz"
  appcast 'https://github.com/oracle/graal/releases.atom'
  name 'GraalVM Community Edition'
  homepage 'https://www.graalvm.org/'

  postflight do
    system_command '/bin/mv',
                   args: [
                           '-f', '--',
                           "#{staged_path}/graalvm-ce-#{version.downcase}",
                           "/Library/Java/JavaVirtualMachines/graalvm-ce-#{version.downcase}"
                         ],
                   sudo: true
  end

  uninstall delete: "/Library/Java/JavaVirtualMachines/graalvm-ce-#{version.downcase}"
end
