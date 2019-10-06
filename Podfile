# Uncomment the next line to define a global platform for your project
platform :ios, '10.0'
use_frameworks!

def common_pods
  pod 'RxSwift'
  pod 'RxCocoa'
  pod 'Moya/RxSwift'
  pod 'SwiftLint'
  pod 'RxGesture'
  pod 'RxSwiftUtilities'
  pod 'RxSwiftExt'
  pod 'lottie-ios'
end

target 'SnapShotSample' do
  inhibit_all_warnings!
    common_pods

target 'SnapShotSampleTests' do
    inhibit_all_warnings!
    inherit! :search_paths

    pod 'Quick'
    pod 'Nimble'
    pod 'RxBlocking'
    pod 'KIF'
    pod 'KIF/IdentifierTests'
    pod 'iOSSnapshotTestCase'

   post_install do |installer|
     installer.pods_project.targets.each do |target|
       target.build_configurations.each do |config|
         config.build_settings['ENABLE_BITCODE'] = 'NO'
       end
     end
   end
 end
end
