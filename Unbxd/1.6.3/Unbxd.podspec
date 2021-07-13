
Pod::Spec.new do |s|

  s.name         = "Unbxd"
  s.version      = "1.6.3"
  s.summary      = "iOS framework which provides APIs to query Unbxd platform."

  s.homepage     = "http://unbxd.com"

  s.license           = { :type => 'Unbxd', :text => <<-LICENSE
                                © 2021 Unbxd Inc, All Rights Reserved.
                                LICENSE
                            }

  s.author    = "kiran.peddikuppa@unbxd.com"

  s.platform     = :ios

  s.ios.deployment_target = "10.0"


  s.source       = { :git => "https://github.com/unbxd/iOS-SDK-Pod.git", :tag => "#{s.version}" }

  s.vendored_frameworks = 'Framework/Unbxd.framework'

  s.swift_version = "5.3"

end
