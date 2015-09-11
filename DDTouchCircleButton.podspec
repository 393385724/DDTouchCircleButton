Pod::Spec.new do |s|  
  s.name             = "DDTouchCircleButton"  
  s.version          = "0.0.1"  
  s.summary          = "a view that long press show progress bar outside."  
  s.homepage         = "https://github.com/393385724/DDTouchCircleButton"  
  # s.screenshots      = "www.example.com/screenshots_1", "www.example.com/screenshots_2"  
  s.license          = 'MIT'  
  s.author           = { "llg" => "393385724@qq.com" }  
  s.source           = { :git => "https://github.com/393385724/DDTouchCircleButton.git", :tag => s.version.to_s }  
  # s.social_media_url = ''  
  
  s.platform     = :ios, '7.0'  
  s.ios.deployment_target = '7.0'  
  # s.osx.deployment_target = '10.7'  
  s.requires_arc = true  
  
  s.source_files = 'DDTouchCircleButton/*.{h,m}'  
  # s.resources = 'Assets'  
  
  # s.ios.exclude_files = 'Classes/osx'  
  # s.osx.exclude_files = 'Classes/ios'  
  # s.public_header_files = 'Classes/**/*.{h,m}'  
  s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit' 
end  
