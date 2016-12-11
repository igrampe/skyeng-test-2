//
//  SERootView.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SEViewController.h"
#import "SERootViewOutput.h"

@interface SERootView : SEViewController

@property (nonatomic, strong) id<SERootViewOutput> output;

@end
