//
//  PSTabbarControllerViewController.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSTabbarControllerViewController.h"
#import "PSAsyncStreamViewController.h"
#import "PSNonAsyncStreamViewController.h"

@interface PSTabbarControllerViewController () <UITabBarControllerDelegate>

@end

@implementation PSTabbarControllerViewController

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

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
