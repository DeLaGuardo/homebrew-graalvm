cask 'graalvm-ce-java11@19.3.0' do
  version '19.3.0'
  sha256 '5a7eaead66971e25bef2c21d94d0760b54bda13761908545be8c0323df17da4a'

  JVMS_DIR = '/Library/Java/JavaVirtualMachines'.freeze
  MODIFIER = 'java11'.freeze
  TARGET_DIR = "#{JVMS_DIR}/graalvm-ce-#{MODIFIER}-#{version}".freeze

  # github.com/graalvm/graalvm-ce-builds was verified as official when first introduced to the cask
  url "https://github.com/graalvm/graalvm-ce-builds/releases/download/vm-#{version.downcase}/graalvm-ce-#{MODIFIER}-darwin-amd64-#{version.downcase}.tar.gz"
  appcast 'https://github.com/graalvm/graalvm-ce-builds/releases.atom'
  name 'GraalVM Community Edition'
  homepage 'https://www.graalvm.org/'

  artifact "graalvm-ce-#{MODIFIER}-#{version}", target: TARGET_DIR

  caveats <<~EOS
    Installing GraalVM CE in #{JVMS_DIR} requires root permissions.
    You may be asked to enter your password to proceed.

    To use GraalVM CE, you may want to change your `JAVA_HOME`:
      export JAVA_HOME=#{TARGET_DIR}/Contents/Home

    or you may want to add its `bin` directory to your `PATH`:
      export PATH=#{TARGET_DIR}/Contents/Home/bin:"$PATH"

    GraalVM CE is licensed under the GPL 2 with Classpath exception:
      https://github.com/oracle/graal/blob/master/LICENSE

  EOS
end
