cask 'graalvm-ce-prerelease' do
  version '19.2.0-dev-b01'
  sha256 'c6ad3e3d193edb539321a0847602985e829728cc7a050adb09a37544693749af'

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
