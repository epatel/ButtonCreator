//
//  ButtonCreatorViewController.m
//  ButtonCreator
//
//  Created by Edward Patel on 2010-02-20.
//  Copyright Memention AB 2010. All rights reserved.
//

#import "ButtonCreatorViewController.h"
#import <QuartzCore/QuartzCore.h>

@implementation ButtonCreatorViewController



/*
 // The designated initializer. Override to perform setup that is required before the view is loaded.
 - (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
 if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
 // Custom initialization
 }
 return self;
 }
 */

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView {
 }
 */


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	int i, j;
	for (i=0; i<2; i++)
		for (j=0; j<3; j++)
			colors[i][j] = 0.5;
    [super viewDidLoad];
	useText = YES;
	[self sliderChanged:nil];
	useText = NO;
	[self sliderChanged:nil];
	CGRect r = [button1 frame];
	widthLabel.text = [NSString stringWithFormat:@"Width: %.1f", r.size.width];	
}

- (void)updateColors
{
	if (useText) {
		[((UIButton*)button1) setTitleColor:[UIColor colorWithHue:colors[0][0] 
													   saturation:colors[0][1] 
													   brightness:colors[0][2] 
															alpha:1.0]
								   forState:UIControlStateNormal];
		[((UIButton*)button2) setTitleColor:[UIColor colorWithHue:colors[0][0] 
													   saturation:colors[0][1] 
													   brightness:colors[0][2] 
															alpha:1.0]
								   forState:UIControlStateNormal];
	} else {
		[button1 setValue:[UIColor colorWithHue:colors[1][0] 
									 saturation:colors[1][1] 
									 brightness:colors[1][2] 
										  alpha:1.0] forKey:@"tintColor"];
		[button2 setValue:[UIColor colorWithHue:colors[1][0] 
									 saturation:colors[1][1] 
									 brightness:colors[1][2] 
										  alpha:1.0] forKey:@"tintColor"];
	}
}

/*
 // Override to allow orientations other than the default portrait orientation.
 - (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
 // Return YES for supported orientations
 return (interfaceOrientation == UIInterfaceOrientationPortrait);
 }
 */

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

- (BOOL)textField:(UITextField *)textField 
shouldChangeCharactersInRange:(NSRange)range 
replacementString:(NSString *)string
{
	[button1 setTitle:[textField.text stringByReplacingCharactersInRange:range
															  withString:string]
			 forState:UIControlStateNormal];
	[button2 setTitle:[textField.text stringByReplacingCharactersInRange:range
															  withString:string]
			 forState:UIControlStateNormal];
	return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

- (IBAction)widthSliderChanged:(id)sender
{
	int w = [(UISlider*)sender value];
	CGRect r = [button1 frame];
	r.size.width = w;
	[button1 setFrame:r];
	r = [button2 frame];
	r.size.width = w;
	[button2 setFrame:r];
	widthLabel.text = [NSString stringWithFormat:@"Width: %.1f", r.size.width];
}

- (IBAction)sliderChanged:(id)sender
{
	int i = 0;
	
	if (!useText) 
		i = 1;
	
	colors[i][0] = [hue value];
	colors[i][1] = [saturation value];
	colors[i][2] = [brightness value];
	
	hueLabel.text = [NSString stringWithFormat:@"Hue: %f", colors[i][0]];
	saturationLabel.text = [NSString stringWithFormat:@"Saturation: %f", colors[i][1]];
	brightnessLabel.text = [NSString stringWithFormat:@"Brightness: %f", colors[i][2]];
	
	[self updateColors];
}

- (IBAction)partChanged:(id)sender
{
	useText = [sender selectedSegmentIndex] ? YES : NO;
	
	int i = 0;
	
	if (!useText) 
		i = 1;
	
	[hue setValue:colors[i][0]];
	[saturation setValue:colors[i][1]];
	[brightness setValue:colors[i][2]];
	
	[self sliderChanged:nil];
}

- (IBAction)open:(id)sender
{
	NSString *filename1;
	NSString *filename2;
	{
		UIGraphicsBeginImageContext([button1 frame].size);
		CGContextRef theContext = UIGraphicsGetCurrentContext();
		[(CALayer*)[button1 layer] renderInContext:theContext];
		UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
		NSData *theData = UIImagePNGRepresentation(theImage);
		filename1 = [NSString stringWithFormat:@"/tmp/button-%.5d1.png", time(NULL)%100000];
		[theData writeToFile:filename1 atomically:NO];
	}		
	{
		UIGraphicsBeginImageContext([button2 frame].size);
		CGContextRef theContext = UIGraphicsGetCurrentContext();
		[(CALayer*)[button2 layer] renderInContext:theContext];
		UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
		NSData *theData = UIImagePNGRepresentation(theImage);
		filename2 = [NSString stringWithFormat:@"/tmp/button-%.5d2.png", time(NULL)%100000];
		[theData writeToFile:filename2 atomically:NO];
	}		
	// This will be outputted to the system log and picked up by the LOG_MONITOR
	// script.
	NSLog(@"open-button %@", filename1);
	NSLog(@"open-button %@", filename2);
}

@end
