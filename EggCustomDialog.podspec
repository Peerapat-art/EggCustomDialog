#
# Be sure to run `pod lib lint EggCustomDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'EggCustomDialog'
    s.version          = '0.1.0'
    s.swift_version    = '5.0'
    s.summary          = 'EggDital Custom Dialog'
    s.description      = "Create Custom Dialog for using in project"
    
    s.homepage         = 'https://github.com/Peerapat-art/EggCustomDialog'
    # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Peerapat.Pro' => 'peerapat.pro@ascendcorp.com' }
    s.source           = { :git => 'https://github.com/Peerapat-art/EggCustomDialog.git', :tag => s.version.to_s }
    # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'
    
    s.ios.deployment_target = '8.0'
    
    s.source_files = 'EggCustomDialog/Classes/**/*'
    
    # s.resource_bundles = {
    #   'EggCustomDialog' => ['EggCustomDialog/Assets/*.png']
    # }
    
    # s.public_header_files = 'Pod/Classes/**/*.h'
    # s.frameworks = 'UIKit', 'MapKit'
    # s.dependency 'AFNetworking', '~> 2.3'
end
