//
//  PSTabbarControllerViewController.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSTabbarControllerViewController.h"
#import "PSStreamViewController.h"

@interface PSTabbarControllerViewController () <UITabBarControllerDelegate>

@end

@implementation PSTabbarControllerViewController

- (instancetype)init {
    if (self = [super init]) {

        self.delegate = self;

        PSStreamViewController *vc = [PSStreamViewController new];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        self.viewControllers = @[nav];

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
