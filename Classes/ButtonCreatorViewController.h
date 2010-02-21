//
//  ButtonCreatorViewController.h
//  ButtonCreator
//
//  Created by Edward Patel on 2010-02-20.
//  Copyright Memention AB 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ButtonCreatorViewController : UIViewController {
	IBOutlet id button1;
	IBOutlet id button2;
	IBOutlet UITextField *field;
	IBOutlet UISlider *hue;
	IBOutlet UISlider *saturation;
	IBOutlet UISlider *brightness;
	IBOutlet UILabel *widthLabel;
	IBOutlet UILabel *hueLabel;
	IBOutlet UILabel *saturationLabel;
	IBOutlet UILabel *brightnessLabel;
	float colors[2][3];
	BOOL useText;
}

- (IBAction)widthSliderChanged:(id)sender;
- (IBAction)sliderChanged:(id)sender;
- (IBAction)partChanged:(id)sender;
- (IBAction)open:(id)sender;

@end

