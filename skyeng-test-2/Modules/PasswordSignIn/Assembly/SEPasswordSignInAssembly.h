//
//	SEPasswordSignInAssembly.h
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import <Typhoon/Typhoon.h>

@class SEServicesAssembly;

@interface SEPasswordSignInAssembly : TyphoonAssembly

@property (nonatomic, readonly) SEServicesAssembly *servicesAssembly;

- (UIViewController *)viewPasswordSignIn;

@end
