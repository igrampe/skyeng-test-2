//
//	SEPasswordSignInPresenter.m
//  PasswordSignIn
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 18/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//


#import "SEPasswordSignInPresenter.h"
#import "SEPasswordSignInViewOutput.h"
#import "SEPasswordSignInInteractorOutput.h"
#import "SEPasswordSignInModuleInput.h"

@interface SEPasswordSignInPresenter ()
<SEPasswordSignInViewOutput,
SEPasswordSignInInteractorOutput,
SEPasswordSignInModuleInput>

@end

@implementation SEPasswordSignInPresenter

@synthesize moduleOutput;

#pragma mark - SEPasswordSignInViewOutput

- (void)eventViewIsReady {
    
}

- (void)eventEmailFieldTextDidChange:(NSString *)text {
    
}

- (void)eventPasswordFieldTextDidChange:(NSString *)text {
    
}

- (void)actionSignIn {
    
}

- (void)actionRequestCode {
    
}

@end
