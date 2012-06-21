//
//  RHCPAppDelegate.h
//  Jun21
//
//  Created by Axel Nunez on 6/21/12.
//  Copyright (c) 2012 CUNY. All rights reserved.
//

#import <UIKit/UIKit.h>
@class View;


@interface RHCPAppDelegate : UIResponder <UIApplicationDelegate>{
    View *view;
    UIWindow *_window;
}


@property (strong, nonatomic) UIWindow *window;

@end
