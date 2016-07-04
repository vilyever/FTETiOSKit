Pod::Spec.new do |s|
    s.name             = "VDKit"
    s.version          = "9.9.9"
    s.summary          = "Some uesful utils for iOS."
    s.description      = <<-DESC
                       It is some utils used on iOS, which implement by Objective-C.
                       DESC
    s.homepage         = "https://github.com/vilyever/VDKits"
    s.license          = 'MIT'
    s.author           = { "Vilyever" => "vilyever@gmail.com" }
    s.source           = { :git => "https://github.com/vilyever/objcTemp.git", :tag => s.version.to_s }

    s.platform     = :ios, '5.0'
    s.requires_arc = true

    s.public_header_files = ['VDKit/pods/**/*.{h}']
    s.source_files = ['VDKit/pods/Classes/**/*.{h,m}']
    s.resources    = ['VDKit/pods/Resources/*', 'VDKit/pods/Classes/**/*.{xib}']

    s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore', 'MediaPlayer'


end
