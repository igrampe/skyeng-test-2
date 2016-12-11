//
//	SESignInView.h
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SESignInViewOutput.h"
#import "SEViewController.h"

@interface SESignInView : SEViewController

@property (nonatomic, weak) id<SESignInViewOutput> output;

@end
