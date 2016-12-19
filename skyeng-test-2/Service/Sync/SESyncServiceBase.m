//
//  SESyncServiceBase.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 12/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SESyncServiceBase.h"
#import "NSDate+Helpers.h"

static NSString *SESyncServiceBaseDefaultsKeyLastSync = @"SESyncServiceBaseDefaultsKeyLastSync";

@interface SESyncServiceBase ()

@property (nonatomic, assign) NSTimeInterval lastSyncTms;

@end

@implementation SESyncServiceBase

- (instancetype)init {
    self = [super init];
    if (self) {
        self.lastSyncTms = [[NSUserDefaults standardUserDefaults] doubleForKey:SESyncServiceBaseDefaultsKeyLastSync];
    }
    return self;
}

- (BOOL)needSync {
    NSDate *now = [NSDate date];
    NSDate *lastSync = [NSDate dateWithTimeIntervalSince1970:self.lastSyncTms];
    
    return (![lastSync isEqualToDateIgnoringTime:now]) && ([now timeIntervalSinceDate:lastSync] > 0);
}

#pragma mark - SESyncService

- (void)start {
    if ([self needSync]) {
        [self sync];
    }
}

- (void)sync {
    // TODO: Implement sync
    self.lastSyncTms = [NSDate date].timeIntervalSince1970;
    [[NSUserDefaults standardUserDefaults] setDouble:self.lastSyncTms forKey:SESyncServiceBaseDefaultsKeyLastSync];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

@end
