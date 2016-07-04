Pod::Spec.new do |s|
    s.name             = "VDKit"
    s.version          = "0.0.1"
    s.summary          = "Some uesful utils for iOS."
    s.description      = <<-DESC
                       It is some utils used on iOS, which implement by Objective-C.
                       DESC
    s.homepage         = "https://github.com/vilyever/VDKits"
    s.license          = 'MIT'
    s.author           = { "Vilyever" => "vilyever@gmail.com" }
    s.source           = { :path => '~/ResourceXcode/Vilyever/1.1.0/VDKit' }

    s.platform     = :ios, '5.0'
    s.requires_arc = true

    s.public_header_files = ['VDKit/pods/**/*.{h}']
    s.source_files = ['VDKit/pods/Classes/*.{h,m}']
    s.resources    = ['VDKit/pods/Resources/*']

    s.frameworks = 'Foundation', 'CoreGraphics', 'UIKit', 'QuartzCore', 'MediaPlayer'

    s.subspec 'Log' do |ss|

        ss.source_files = ['VDKit/pods/Classes/Log/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/Log/*.{xib}']

    end

    s.subspec 'NSDictionary' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSDictionary/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSDictionary/*.{xib}']

    end

    s.subspec 'NSObject' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSObject/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSObject/*.{xib}']

    end

    s.subspec 'Math' do |ss|

        ss.source_files = ['VDKit/pods/Classes/Math/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/Math/*.{xib}']

    end

    s.subspec 'NSString' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSString/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSString/*.{xib}']

    end

    s.subspec 'NSUserDefaults' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSUserDefaults/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSUserDefaults/*.{xib}']

    end

    s.subspec 'UIApplication' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIApplication/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIApplication/*.{xib}']

    end

    s.subspec 'UIColor' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIColor/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIColor/*.{xib}']

    end

    s.subspec 'UIDevice' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIDevice/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIDevice/*.{xib}']

    end

    s.subspec 'UIImage' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIImage/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIImage/*.{xib}']

    end

    s.subspec 'UILabel' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UILabel/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UILabel/*.{xib}']

    end

    s.subspec 'UINavigationBar' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UINavigationBar/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UINavigationBar/*.{xib}']

    end

    s.subspec 'UIScreen' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIScreen/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIScreen/*.{xib}']

    end

    s.subspec 'UITableView' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UITableView/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UITableView/*.{xib}']

    end

    s.subspec 'UITableViewCell' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UITableViewCell/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UITableViewCell/*.{xib}']

    end

    s.subspec 'UIView' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIView/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIView/*.{xib}']

    end

    s.subspec 'UIViewController' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIViewController/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIViewController/*.{xib}']

    end

    s.subspec 'UIWindow' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIWindow/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIWindow/*.{xib}']

    end

    s.subspec 'NSNumber' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSNumber/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSNumber/*.{xib}']

    end

    s.subspec 'CALayer' do |ss|

        ss.source_files = ['VDKit/pods/Classes/CALayer/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/CALayer/*.{xib}']

    end

    s.subspec 'UIGestureRecognizer' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIGestureRecognizer/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIGestureRecognizer/*.{xib}']

    end

    s.subspec 'UICollectionView' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UICollectionView/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UICollectionView/*.{xib}']

    end

    s.subspec 'UICollectionViewCell' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UICollectionViewCell/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UICollectionViewCell/*.{xib}']

    end

    s.subspec 'UICollectionViewLayout' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UICollectionViewLayout/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UICollectionViewLayout/*.{xib}']

    end

    s.subspec 'UITextView' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UITextView/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UITextView/*.{xib}']

    end

    s.subspec 'UIButton' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIButton/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIButton/*.{xib}']

    end

    s.subspec 'MediaPlayer' do |ss|

        ss.source_files = ['VDKit/pods/Classes/MediaPlayer/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/MediaPlayer/*.{xib}']

    end

    s.subspec 'UISearchBar' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UISearchBar/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UISearchBar/*.{xib}']

    end

    s.subspec 'UIScrollView' do |ss|

        ss.source_files = ['VDKit/pods/Classes/UIScrollView/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/UIScrollView/*.{xib}']

    end

    s.subspec 'NSOperation' do |ss|

        ss.source_files = ['VDKit/pods/Classes/NSOperation/*.{h,m}']
        ss.resources    = ['VDKit/pods/Classes/NSOperation/*.{xib}']

    end

end
