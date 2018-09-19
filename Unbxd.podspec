#
#  Be sure to run `pod spec lint Unbxd.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  s.name         = "Unbxd"
  s.version      = "1.0.6"
  s.summary      = "iOS framework which provides APIs to query Unbxd platform."
  
  s.homepage     = "http://unbxd.com"

  s.license           = { :type => 'Unbxd', :text => <<-LICENSE
                                © 2018 Unbxd Inc, All Rights Reserved.
                                LICENSE
                            }

  s.author    = "tilak kumar"

  s.platform     = :ios

  s.ios.deployment_target = "9.0"


  s.source       = { :git => "https://github.com/unbxd/Unbxd_iOS_Framework.git", :tag => "#{s.version}" }

  s.vendored_frameworks = 'Unbxd.framework'

  s.dependency "Alamofire"
  s.dependency "CocoaLumberjack/Swift"

  s.swift_version = "4.0"

end
