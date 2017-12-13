Pod::Spec.new do |s|
  s.name         = "HTUITabBarController"
  s.version      = "1.0.0"
  s.summary      = "A iOS LaunchAd show of UITabBarController."
  s.homepage     = "https://github.com/PureRunner/HTTabBarController"
  s.license      = "MIT"
  s.author             = { "Carlos" => "1844100914@qq.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/PureRunner/HTTabBarController.git", :tag => "1.0.0" }
  s.source_files  = "HTTabBarController/HTUITabBarController/*"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
