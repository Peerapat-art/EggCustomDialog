#
# Be sure to run `pod lib lint EggCustomDialog.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
    s.name             = 'EggCustomDialog'
    s.version          = '0.1.3'
    s.swift_version    = '5.0'
    s.summary          = 'EggDital Custom Dialog'
    s.description      = "Create Custom Dialog for using in project"
    
    s.homepage         = 'https://github.com/Peerapat-art/EggCustomDialog'
    s.license          = { :type => 'MIT', :file => 'LICENSE' }
    s.author           = { 'Peerapat.Pro' => 'peerapat.pro@ascendcorp.com' }
    s.source           = { :git => 'https://github.com/Peerapat-art/EggDigitalCustomDialog.git', :tag => s.version.to_s }
    
    s.ios.deployment_target = '10.0'
    
    s.source_files = 'EggCustomDialog/Classes/**/*'
      
    s.frameworks  = "Foundation", "UIKit"
    
    s.dependency 'EggDeviceExt'
end
