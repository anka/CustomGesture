//
//  CustomGestureViewController.m
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CustomGestureViewController.h"
#import "CheckmarkGestureRecognizer.h"

@implementation CustomGestureViewController

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create the custom checkmark gesture recognizer
    CheckmarkGestureRecognizer *recognizer = [[CheckmarkGestureRecognizer alloc] initWithTarget:self action:@selector(didRecognizeCheckmark:)];
    [self.view addGestureRecognizer:recognizer];
    [recognizer release];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return YES;
}

-(void)didRecognizeCheckmark:(UIGestureRecognizer*)gestureRecognizer
{
    float c1 = (rand()%255)/255.0;
    float c2 = (rand()%255)/255.0;
    float c3 = (rand()%255)/255.0;
    NSLog(@"didRecognizeCheckmark %f", c1);
    
    //If a checkmark was recognized change the
    //background color of the view
    self.view.backgroundColor = [UIColor colorWithRed:c1 green:c2 blue:c3 alpha:1.0];
}


@end
