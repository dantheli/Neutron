Pod::Spec.new do |s|
  s.name             = 'Neutron'
  s.version          = '0.4.0'
  s.summary          = 'Promise-based, protocol-oriented network requests in Swift'
  s.homepage         = 'https://github.com/dantheli/Neutron'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Li' => 'dl743@cornell.edu' }
  s.source           = { :git => 'https://github.com/dantheli/Neutron.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.osx.deployment_target = '10.11'
  s.watchos.deployment_target = '2.0'
  s.tvos.deployment_target = '9.0'

  s.source_files = 'Sources/**/*'
  s.dependency 'Alamofire'
  s.dependency 'SwiftyJSON'
  s.dependency 'PromiseKit/Alamofire'
end
