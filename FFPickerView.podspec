#
# Be sure to run `pod lib lint FFPickerView.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'FFPickerView'
  s.version          = '0.1.0'
  s.summary          = 'custom pickerView'

  s.description      = <<-DESC
a custom pickerView
                       DESC
  s.homepage         = 'https://github.com/fanxiaoApple/FFPickerView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'fanxiaoApple' => 'XF_MBP@qq.com' }
  s.source           = { :git => 'https://github.com/fanxiaoApple/FFPickerView.git', :tag => s.version.to_s }
  s.requires_arc = true
  s.ios.deployment_target = '8.0'
  s.source_files = 'FFPickerView/Classes/**/*'

end
