//
//  ButtonCreatorAppDelegate.m
//  ButtonCreator
//
//  Created by Edward Patel on 2010-02-20.
//  Copyright Memention AB 2010. All rights reserved.
//

#import "ButtonCreatorAppDelegate.h"
#import "ButtonCreatorViewController.h"

@implementation ButtonCreatorAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
