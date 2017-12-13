Pod::Spec.new do |s|
  s.name         = "HTUITabBarController"
  s.version      = "1.0.4"
  s.summary      = "A iOS like UITabBarController."
  s.homepage     = "https://github.com/PureRunner/HTTabBarController"
  s.license      = "MIT"
  s.author             = { "PureRunner" => "teemofaster@163.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/PureRunner/HTTabBarController.git", :tag => "1.0.4" }
  s.source_files  = "HTTabBarController/HTUITabBarController/*"
  s.frameworks = "UIKit", "Foundation"
  s.requires_arc = true
end
