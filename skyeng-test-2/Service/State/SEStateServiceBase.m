//
//  SEStateServiceBase.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SEStateServiceBase.h"
#import <UICKeyChainStore.h>
#import "SEAuthCodeReciever.h"

NSString *const SEStateServiceBaseDefaultsKeyLaunchesCount = @"SEStateServiceBaseDefaultsKeyLaunchesCount";

@interface SEStateServiceBase ()

@property (nonatomic, strong) UICKeyChainStore *keychain;

@end

@implementation SEStateServiceBase

@synthesize token = _token;
@synthesize authCodeReciever;

- (instancetype)init {
    self = [super init];
    if (self) {
        
        self.keychain = [UICKeyChainStore keyChainStoreWithService:[[NSBundle mainBundle] bundleIdentifier]];
        
        NSInteger launchCount = [[NSUserDefaults standardUserDefaults] integerForKey:SEStateServiceBaseDefaultsKeyLaunchesCount];
        launchCount++;
        [[NSUserDefaults standardUserDefaults] setInteger:launchCount forKey:SEStateServiceBaseDefaultsKeyLaunchesCount];
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if (launchCount == 1) {
            [self.keychain removeAllItems];
        }
    }
    return self;
}

#pragma mark - SEStateService

- (BOOL)isAuthorized {
    return (self.token.length > 0);
}

- (void)setToken:(NSString *)token {
    _token = token;
}

@end
