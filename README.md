# JoyMobilitySDK

[![CI Status](https://img.shields.io/travis/JoyMobilitySDK.svg?style=flat)](https://cocoapods.org/pods/JoyMobilitySDK)
[![Version](https://img.shields.io/cocoapods/v/JoyMobilitySDK.svg?style=flat)](https://cocoapods.org/pods/JoyMobilitySDK)
[![License](https://img.shields.io/cocoapods/l/JoyMobilitySDK.svg?style=flat)](https://cocoapods.org/pods/JoyMobilitySDK)
[![Platform](https://img.shields.io/cocoapods/p/JoyMobilitySDK.svg?style=flat)](https://cocoapods.org/pods/JoyMobilitySDK)

Use JoyMobilitySDK to integrate our Carpooling service within your own App.  You can also use it to have your own white label Mobility App with just few lines of Code. The SDK is fully written in Swift and is also Obj-C compatible.
![Feed](https://github.com/AlaaCherbib/JoyMobilitySDK_DEV/blob/master/doc-assets/feed.png)
![Details](https://github.com/AlaaCherbib/JoyMobilitySDK_DEV/blob/master/doc-assets/details.png)
## Requirements
iOS 11 and above
Sign up to our platform and get a your customer id

## Installation

JoyMobilitySDK is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following to your Podfile:

```ruby
pod 'JoyMobilitySDK'
```
run pod install on the terminal from the Poffile directory, then close the project and open the xcworkspace file, clean and build the project.

## Getting Started

### Add your configuration files
After signing up, you will receive two plist files, one is your GoogleService info file, which will be used to configure Firebase and Google maps services. this file should never be edited and must be added to your project and belong to your target. The second 'Configuration.plist' file contains your specific keys, customer id, api keys and some config params, add this file as well to your project as it is mandatory to run the SDK.

### Customise the settings and appearance
in Configuration.plist you will be able to do the following customisations:

- [x] Enable/Disable sign up module: Depending on your use case, you can choose to use our Login feature and signup your users through our authentication services or you can choose to use your own authentication system, in this case you will have to pass the user infos to the SDK before starting using it. 
- [x] Enable/Disable pricing: The SDK comes with a pricing feature that suggests fees for sharing the rides. you can enable/disable this feature depending on your needs.
- [x] Show/Hide an initial app consent screen, this screen shows a customised text that the user will have to accept before using the carpool service. this screen will be only shown once if it is enabled.
- [x] Set the profile button position: in the first screen which is the rides feed, on the navigation bar will be placed a button that takes the user to his profile/edit profile screen. you can decide to show this button on the LEFT position (in case you don't need to show a back button, e.g showing the view in Tabbar), RIGHT position, or you can decide to hide it completely, possible values are LEFT, RIGHT, NONE. 
- [x] Set primary color: if you want to edit the primary color that is in the SDK screens, please add a color asset to you assets file (e.g assets.xcassets) and call it 'joy_primary', set the color value and the SDK will use it automatically.
- [x] Set the navigation bar logo: you will have to add your own navigation bar logo, this will replace the default Joy mobility logo, to do so, add an image asset to your assets file (e.g assets.xcassets) and put in your logo images files, recommended sizes are (154x96, 2x: 308x192, 3x: 462x288)

### Start the SDK
in the App delegate add the following lines: 
```swift
import JoyMobilitySDK
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    JoyMobilityApp(customerId: "YOUR_CUSTOMER_ID").configure()
}

func applicationDidBecomeActive(_ application: UIApplication) {
    JoyMobilityApp.appDidBecomeActive()
}

func application(_ application: UIApplication,
                 didReceiveRemoteNotification userInfo: [AnyHashable: Any],
                 fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    if JoyMobilityNotificationsHandler.handleNotification(with: userInfo, application: application) {
        return
    }
}

func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
    return JoyMobilityApp.handleJoyDeepLink(with: userActivity)
}
```

### Authenticate the user if you are disabling the SDK Sign up Module (SKIP THIS STEP IF YOU USE THE SDK'S SIGN UP SCREEN)
after the user logs in to his account in your app, please make this call to the authenticate the user for the carpool service:
```swift
JoyMobilityApp.signInUser(email: "user_email",
                         firstname: "user_fisrt_name",
                         lastname: "user_last_name",
                         phoneNumber: "001122334455",
                         gender: .male) { success in
                           // you can use the completion block if necessary or just set it to nil
}
```

### Start the first screen
Now all you have to do is to choose your entry point, it can be a button or a Tableview cell action, or a tab bar item if it an in app integration, or in App delegate if you are using the SDK as a white label product to generate a new standalone mobility app 

- [x] in case of in app integration:
```swift
    let vc: UIViewController
    do {
        // set excludeNavigationController value depending on your setup
        // if you set it to false the viewController will be embedded in a navigationController
        // if you are using your own navigationController and will push the new vc, then set it to true
        vc = try JoyMobilityApp.initialViewController(excludeNavigationController: true)
    } catch  {
        // The user is not logged in, redirect to your login view controller or authenticate the user
        // This is an example code, please use your own views
        vc = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginViewController")
    }
    navigationController?.pushViewController(vc, animated: true)
```
- [x] in case of a standalone App:

in AppDelegate:

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
    window = UIWindow(frame: UIScreen.main.bounds)
    window?.backgroundColor = .white
    do {
        JoyMobilityApp(customerId: MainConfiguration.shared.customerID).configure()
        let initialViewController = try JoyMobilityApp.initialViewController()
        window?.rootViewController = initialViewController
        window?.makeKeyAndVisible()
        JoyMobilityApp.showAppDescriptionIfNecessary()
    } catch  {}

    return true
}
```

That is basically it, you're all set up now, the rest will be managed by the SDK. Happy coding !!



## Author

JoyMobility, info@joy-mobility.com | www.joy-mobility.com

## License

JoyMobilitySDK is available under the MIT license. See the LICENSE file for more info.
