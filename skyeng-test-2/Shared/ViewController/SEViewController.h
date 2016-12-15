//
//  SEViewController.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <APLViperStack.h>
#import "UIView+Relayout.h"
#import "SEAppTheme.h"

@interface SEViewController : UIViewController <APLTransitionHandler>

@property (nonatomic, assign) BOOL didSetupConstraints;

- (void)setupView;

@end
