Pod::Spec.new do |s|
  s.name             = 'AIImageResize'
  s.version          = '1.3.0'
  s.summary          = 'Simple iOS image resize.'
  s.description      = <<-DESC
AIImageResize is a category for UIImage that adds the capability to resize by width / height and perform image cropping.
It is especially useful when dealing with images that are downloaded at runtime.
                       DESC
  s.homepage         = 'https://github.com/adrianilie9/AIImageResize'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Adrian Ilie' => 'adrian.ilie.x64@gmail.com' }
  s.social_media_url = 'https://twitter.com/iadi64'
  
  s.source                  = { :git => 'https://github.com/adrianilie9/AIImageResize.git', :tag => 'V.1.3.0' }
  s.ios.deployment_target   = '10.0'
  s.swift_versions          = '5.0'
  s.frameworks              = 'UIKit'
  s.source_files            = 'AIImageResize/Classes/**/*'
end
