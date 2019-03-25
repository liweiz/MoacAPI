Pod::Spec.new do |s|
  s.name         = 'MoacAPI'
  s.version      = '0.0.1'
  s.summary      = 'Moac API.'
  s.homepage     = 'https://github.com/TrustWallet/TrustSDK-iOS'
  s.authors      = { 'Liwei Zhang' => 'matt.z.lw@gmail.com' }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'

  s.source       = { git: 'https://github.com/TrustWallet/TrustSDK-iOS.git', tag: s.version }
  s.source_files = 'Sources/TrustWalletSDK/**/*.{swift}', 'Sources/Shared/*.{swift}'

  s.dependency 'Moya'
end
