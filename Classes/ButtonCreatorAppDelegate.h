//
//  ButtonCreatorAppDelegate.h
//  ButtonCreator
//
//  Created by Edward Patel on 2010-02-20.
//  Copyright Memention AB 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

#if !TARGET_IPHONE_SIMULATOR
#error This project should only run in the Simulator
#endif 

@class ButtonCreatorViewController;

@interface ButtonCreatorAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    ButtonCreatorViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet ButtonCreatorViewController *viewController;

@end

