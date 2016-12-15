//
//	SESignInPresenter.m
//  SignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SESignInPresenter.h"
#import "SESignInViewOutput.h"
#import "SESignInInteractorOutput.h"
#import "SESignInModuleInput.h"
#import "SESignInModuleOutput.h"

@interface SESignInPresenter () <SESignInViewOutput, SESignInInteractorOutput, SESignInModuleInput>

@end

@implementation SESignInPresenter

@synthesize moduleOutput;

- (void)viewIsReady {
    
}

@end
