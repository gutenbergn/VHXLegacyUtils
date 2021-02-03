#
# Be sure to run `pod lib lint VHXLegacyUtils.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VHXLegacyUtils'
  s.version          = '0.1.0'
  s.summary          = 'Older helper classes.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
Older helper classes.
                       DESC

  s.homepage         = 'https://github.com/gutenbergn/VHXLegacyUtils'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'gutenbergn' => 'gutenbergn@gmail.com' }
  s.source           = { :git => 'https://github.com/gutenbergn/VHXLegacyUtils.git', :tag => s.version.to_s }

  s.ios.deployment_target = '9.0'

  s.source_files = 'VHXLegacyUtils/Classes/**/*'

end
