//
//  SERootAssembly.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEModuleAssembly.h"
#import "SESignInAssembly.h"
#import "SESettingsAssembly.h"

@interface SERootAssembly : SEModuleAssembly

@property (nonatomic, strong, readonly) SESignInAssembly *singInAssembly;
@property (nonatomic, strong, readonly) SESettingsAssembly *settingsAssembly;

- (UIViewController *)viewRoot;

@end
