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
    [self.sourceViewController addChildViewController:self.destinationViewController];
    self.destinationViewController.view.frame = self.sourceViewController.view.bounds;
    [self.sourceViewController.view addSubview:self.destinationViewController.view];
    [self.destinationViewController didMoveToParentViewController:self.sourceViewController];
}

- (void)unwind {
    [self.destinationViewController willMoveToParentViewController:nil];
    [self.destinationViewController.view removeFromSuperview];
    [self.destinationViewController removeFromParentViewController];
    [self.sourceViewController viewWillAppear:NO];
    [self.sourceViewController viewDidAppear:NO];
}

@end
