#
# Be sure to run `pod lib lint ROConcurrency.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |spec|
    spec.name         = 'ROConcurrency'
    spec.version      = '2.1.1'
    spec.license      = { :type => 'MIT' }
    spec.homepage     = 'https://github.com/prine/ROConcurrency'
    spec.authors      = { 'Robin Oster' => 'prine.dev@gmail.com' }
    spec.summary      = 'Simple helper classes which will reduce the complexity for using concurrent methods in Swift.'
    spec.source       = { :git => 'https://github.com/prine/ROConcurrency.git', :tag => "2.1.1" }
    spec.source_files = 'Source/**/*'
    spec.framework    = 'SystemConfiguration'
    spec.ios.deployment_target  = '8.4'
end
