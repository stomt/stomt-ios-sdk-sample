# stomt iOS-SDK sample app
Sample iOS app to show how to integrate [stomt iOS-SDK](https://github.com/stomt/stomt-ios-sdk) in your apps.

To see how stomt is integrated in the app review the following files:

## CocoaPod ([/Podfile](https://github.com/stomt/stomt-ios-sdk-sample/blob/master/Podfile))
Include the [Stomt-iOS-SDK](https://github.com/stomt/stomt-ios-sdk) and install it using `pod install`.
```ruby
target 'stomt-ios-sdk-sample' do
  pod 'Stomt-iOS-SDK', '~> 0.0.x'
end
```

## Initilization ([/stomt-ios-sdk-sample/AppDelegate.m](https://github.com/stomt/stomt-ios-sdk-sample/blob/master/stomt-ios-sdk-sample/AppDelegate.m#L31))
Initilize the SDK once per application with your [AppID](https://www.stomt.com/dev/my-apps).
```Objective-C
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {

	// Setup Stomt with your AppID
	// -> get yours at: https://www.stomt.com/dev/my-apps
	//
	[Stomt setAppID:@"9oKmFftlRL946JtDDUTmpmW4H"];

}
```

## Create Stomt ([/stomt-ios-sdk-sample/ViewController.m](https://github.com/stomt/stomt-ios-sdk-sample/blob/master/stomt-ios-sdk-sample/ViewController.m#L46))
Open a stomt creation panel when pressing the connected button.
```Objective-C
- (IBAction)openStomtCreateModal:(UIButton *)sender {

	// Open a creation modal for your applications page
	// -> the targetID is your pages identifier you can copy it from the pages url
	//    https://www.stomt.com/stomt-ios-sdk -> stomt-ios-sdk
	//
	[Stomt presentStomtCreationPanelWithTargetID:@"stomt-ios-sdk"
									 defaultText:@" "
									  likeOrWish:kSTObjectWish
								 completionBlock:^(NSError *error, STObject *stomt) {
		if(stomt) {
			NSLog(@"Stomt created");
		}
	}];
}
```

## More about stomt

* On the web [www.stomt.com](https://www.stomt.com)
* [stomt for iOS](http://stomt.co/ios)
* [stomt for Android](http://stomt.co/android)
