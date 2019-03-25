Pod::Spec.new do |s|
  s.name         = 'MoacAPI'
  s.version      = '0.0.1'
  s.summary      = 'Moac API.'
  s.homepage     = 'https://github.com/liweiz/MoacAPI'
  s.authors      = { 'Liwei Zhang' => 'matt.z.lw@gmail.com' }

  s.ios.deployment_target = '10.0'
  s.swift_version = '4.0'

  s.source       = { git: 'https://github.com/liweiz/MoacAPI.git', tag: s.version }
  s.source_files = 'MoacAPI/**/*.swift'

  s.dependency 'BigInt', '~> 3.1.0'
  s.dependency 'Moya', '~> 12.0.1'
  s.dependency 'PromiseKit', '~> 6.8.2'
  s.dependency 'SwiftyJSON', '~> 4.2.0'
  s.dependency 'SwiftLint', '0.30.1'
end
