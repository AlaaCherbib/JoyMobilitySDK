Pod::Spec.new do |s|
  s.name                  = 'JoyMobilitySDK'
  s.version = "0.9.6"
  s.summary               = 'Use the JoyMobilitySDK to integrate mobility services into your own app.'
  s.swift_version         = '5.0'
  s.homepage              = 'https://joy-mobility.com/'
  s.license               = 'Copyright 2019 Joy Mobility'
  s.author                = { 'Joy Mobility' => 'info@joy-mobility.com' }
  s.static_framework      = true
  s.requires_arc          = true
  s.ios.deployment_target = '11.0'
  s.libraries             = 'z'
  s.source                = { :http => "https://joy-cocoapods.s3.us-east-2.amazonaws.com/JoyMobilitySDK.#{s.version.to_s}.zip" }
  s.ios.vendored_frameworks = "JoyMobilitySDK.framework"
  s.resources = "JoyMobilitySDK.bundle"


  s.frameworks            = 'CoreLocation'
  s.dependency 'JLRoutes',                  '2.1'
  s.dependency 'PureLayout',                '3.1.4'
  s.dependency 'MBProgressHUD',             '1.1.0'
  s.dependency 'UITextView+Placeholder',    '1.2.1'
  s.dependency 'FloatingPanel',             '1.6.4'
  s.dependency 'NotificationBannerSwift',   '2.5.1'
  s.dependency 'IQKeyboardManagerSwift',    '6.2.1'
  s.dependency 'Apollo',                    '0.15.0'
  s.dependency 'SwiftAsyncTasks',           '1.4.0'
  s.dependency 'Kingfisher',                '5.3.1'
  s.dependency 'RealmSwift',                '3.14.2'
  s.dependency 'GoogleMaps',                '3.3.0'
  s.dependency 'GooglePlaces',              '3.3.0'
  s.dependency 'GoogleUtilities',           '6.2.5'
  s.dependency 'FirebaseDynamicLinks',      '4.0.3'
  s.dependency 'FirebaseMessaging',         '4.1.4'
  s.dependency 'FirebaseCore',              '6.2.1'
end
