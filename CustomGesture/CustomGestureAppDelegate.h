//
//  CustomGestureAppDelegate.h
//  CustomGesture
//
//  Created by Andreas Katzian on 15.03.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CustomGestureViewController;

@interface CustomGestureAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet CustomGestureViewController *viewController;

@end
