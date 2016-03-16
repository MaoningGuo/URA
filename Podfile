source 'https://github.com/CocoaPods/Specs.git'
platform :ios, '8.0'
use_frameworks!

target :PocketForecast, :exclusive => true do
    
    pod 'Typhoon', :head
    
    pod 'Charts'
    pod 'ICLoader'
    pod 'SwiftCSV'
    pod 'NGAParallaxMotion'
    pod 'NSURL+QueryDictionary'
    pod 'OCLogTemplate'
    pod 'PaperFold', :git => 'https://github.com/jasperblues/PaperFold-for-iOS.git', :tag => '1.2-no-gesture-recognizers'
    
end

# Test Dependencies

target :PocketForecastTests do
    pod 'Expecta', '~> 0.2.1'
    pod 'OCHamcrest'
    pod 'OCMockito'
end

inhibit_all_warnings!
