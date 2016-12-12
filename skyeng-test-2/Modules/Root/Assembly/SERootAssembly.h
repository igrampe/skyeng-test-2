//
//  SERootAssembly.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEModuleAssembly.h"
#import "SESignInAssembly.h"

@interface SERootAssembly : SEModuleAssembly

@property (nonatomic, strong, readonly) SESignInAssembly *singInAssembly;

- (UIViewController *)viewRoot;

@end
