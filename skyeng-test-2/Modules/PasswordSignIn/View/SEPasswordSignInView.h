//
//	SEPasswordSignInView.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SEPasswordSignInViewOutput.h"
#import "SEViewController.h"

@interface SEPasswordSignInView : SEViewController

@property (nonatomic, weak) id<SEPasswordSignInViewOutput> output;

@end
