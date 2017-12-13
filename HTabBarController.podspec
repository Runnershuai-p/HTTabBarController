Pod::Spec.new do |s|
  s.name         = "HTabBarController"
  s.version      = "1.0.0"
  s.summary      = "A iOS LaunchAd show of UITabBarController."
  s.homepage     = "https://github.com/PureRunner/HTabBarController"
  s.license      = "MIT"
  s.author             = { "Carlos" => "1844100914@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/PureRunner/HTabBarController.git", :tag => "1.0.0" }
  s.source_files  = "HTabBarController/HTabBarController/Class/*"
  #s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
  s.xcconfig = { "HEADER_SEARCH_PATHS" => "$(SDKROOT)/usr/include/libxml2" }
end
