//
//  ViewController.m
//  stomt-ios-sdk-sample
//
//  Created by Max Klenk on 13/10/15.
//  Copyright © 2015 Stomt. All rights reserved.
//

#import "ViewController.h"
#import <Stomt-iOS-SDK/Stomt.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Setup Stomt with your AppID
	// -> get yours at: https://www.stomt.com/dev/my-apps
    //
    [Stomt setAppID:@"9oKmFftlRL946JtDDUTmpmW4H"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

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

- (IBAction)openLoginModal:(id)sender {
	
	// Users of stomt can login using oAuth to create stomts in their own name
	//
	[Stomt promptAuthenticationIfNecessaryWithCompletionBlock:^(BOOL succeeded, NSError *error, STUser *user) {
		if(succeeded) {
			NSLog(@"Successful logged in");
		}
	}];
}

- (IBAction)logout:(id)sender {
	
	// There is a logout function aswell
	//
	[Stomt logout];
}

@end
