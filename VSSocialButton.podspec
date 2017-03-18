#
# Be sure to run `pod lib lint VSSocialButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'VSSocialButton'
  s.version          = '1.0'
  s.summary          = 'VSSocialButton - button with left icon image and centered label.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                   Easily create social buttons in storyboards or with code.
				   Included incpectables:
                   * Network image - set social network image (Facebook, Twitter etc.);
                   * Button title - set button title;
                   * Button background color - set button background color;
                   * Label text color - set button label text color;
                   * Button corner radius - set button corner radius;
                   * Should animate social network image on press - animate netwrok image alpha on button press;
                       DESC

  s.homepage         = 'https://github.com/pffan91/VSSocialButton/'
  s.screenshots     = 'https://dl.dropbox.com/s/63z3s2n0obfqe6c/img1.png', 'https://dl.dropbox.com/s/jjj2wj3ebwsh7zu/img2.png'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Vladyslav Semenchenko' => 'developer.semenchenko@gmail.com' }
  s.source           = { :git => 'https://github.com/pffan91/VSSocialButton.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/V_Semenchenko'

  s.ios.deployment_target = '8.0'

  s.source_files = 'VSSocialButton/Classes/**/*'
  
  # s.resource_bundles = {
  #   'VSSocialButton' => ['VSSocialButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  s.frameworks = 'UIKit'
end