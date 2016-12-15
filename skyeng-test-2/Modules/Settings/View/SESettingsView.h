//
//	SESettingsView.h
//  Settings
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 14/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "SESettingsViewOutput.h"
#import "SEViewController.h"

@interface SESettingsView : SEViewController

@property (nonatomic, strong) id<SESettingsViewOutput> output;

@end
