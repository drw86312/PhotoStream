//
//  PSNonAsyncStreamViewController.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSNonAsyncStreamViewController.h"
#import "PSNonAsyncStreamDataSource.h"

@interface PSNonAsyncStreamViewController () <UITableViewDelegate>
@property (strong, nonatomic) UITableView *tableView;
@property (strong, nonatomic) PSNonAsyncStreamDataSource *dataSource;
@end

@implementation PSNonAsyncStreamViewController

- (instancetype)init {
    if (self = [super init]) {
        self.viewModel = [[PSStreamViewModel alloc] init];
    }
    return self;
}

-(void)loadView {
    [super loadView];

    self.title = @"Non-ASDK Feed";

    _tableView =[[UITableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.navigationController.navigationBar.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.navigationController.navigationBar.bounds) - CGRectGetHeight(self.tabBarController.tabBar.bounds))];
    _tableView.tableFooterView = [UIView new];
    [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
    _tableView.delegate = self;

    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource =
    [[PSNonAsyncStreamDataSource alloc] initWithTableView:self.tableView
                                                viewModel:self.viewModel];
    _tableView.dataSource = self.dataSource;
}

@end
