//
//  PSTabbarControllerViewController.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSTabbarController.h"
#import "PSAsyncStreamViewController.h"
#import "PSNonAsyncStreamViewController.h"

@interface PSTabbarController () <UITabBarControllerDelegate>

@end

@implementation PSTabbarController

- (instancetype)init {
    if (self = [super init]) {

        self.delegate = self;

        PSAsyncStreamViewController *asyncVC = [PSAsyncStreamViewController new];
        UINavigationController *asyncNav = [[UINavigationController alloc] initWithRootViewController:asyncVC];

        PSNonAsyncStreamViewController *nonAsyncVC = [PSNonAsyncStreamViewController new];
        UINavigationController *nonAsyncNav = [[UINavigationController alloc] initWithRootViewController:nonAsyncVC];

        self.viewControllers = @[asyncNav, nonAsyncNav];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

@end
