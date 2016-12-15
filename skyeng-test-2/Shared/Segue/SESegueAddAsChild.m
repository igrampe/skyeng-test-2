//
//  SESegueAddAsChild.m
//  skyeng-test-2
//
//  Created by Semyon Belokovsky on 11/12/2016.
//  Copyright © 2016 igrampe. All rights reserved.
//

#import "SESegueAddAsChild.h"

@implementation SESegueAddAsChild

- (void)perform {
    [self.source addChildViewController:self.destination];
    self.destination.view.frame = self.source.view.bounds;
    [self.source.view addSubview:self.destination.view];
    [self.destination didMoveToParentViewController:self.source];
}

- (void)unwind {
    [self.destination willMoveToParentViewController:nil];
    [self.destination.view removeFromSuperview];
    [self.destination removeFromParentViewController];
    [self.source viewWillAppear:NO];
    [self.source viewDidAppear:NO];
}

@end
