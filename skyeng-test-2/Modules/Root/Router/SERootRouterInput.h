//
//  SERootRouterInput.h
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol SERootRouterInput <NSObject>

- (void)openSignInModule;
- (void)closeSignInModule;
- (void)openSettingsModule;
- (void)closeSettingsModule;

@end
