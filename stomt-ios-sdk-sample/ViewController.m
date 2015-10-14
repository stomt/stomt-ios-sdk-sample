//
//  ViewController.m
//  stomt-ios-sdk-sample
//
//  Created by Max Klenk on 13/10/15.
//  Copyright © 2015 Stomt. All rights reserved.
//

#import "ViewController.h"

#import "Stomt.h" //#import <Stomt-iOS-SDK/Stomt.h> if you added the library manually!

@interface ViewController ()
@property (nonatomic,strong) IBOutlet UILabel* stomtLabel;
@property (nonatomic,strong) IBOutlet UILabel* stomtVersionLabel;
@property (nonatomic,strong) IBOutlet UIButton* stomtCreationButton;
@end

@implementation ViewController



- (void)viewDidLoad {
	
	// Private initialization -------
	self.stomtLabel.text = @"stomt";
	self.stomtLabel.font = [UIFont fontWithName:@"HelveticaNeue-Medium" size:24];
	self.stomtLabel.textColor = [UIColor colorWithRed:0 green:145.0f/255 blue:201.0f/255 alpha:100];
	self.stomtVersionLabel.text = @"BETA";
	self.stomtVersionLabel.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:8];
	self.stomtVersionLabel.textColor = [UIColor colorWithRed:239.0f/255 green:142.0f/255 blue:30.0f/255 alpha:100];
	
	// END ------
	

    [super viewDidLoad];

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
