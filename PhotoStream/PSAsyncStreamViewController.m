//
//  PSStreamViewController.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSAsyncStreamViewController.h"
#import "PSAsyncStreamDataSource.h"

@interface PSAsyncStreamViewController () <ASTableViewDelegate>

@property (strong, nonatomic) ASTableView *tableView;
@property (strong, nonatomic) PSAsyncStreamDataSource *dataSource;

@end

@implementation PSAsyncStreamViewController

- (instancetype)init {
    if (self = [super init]) {
        self.viewModel = [[PSStreamViewModel alloc] init];
    }
    return self;
}

-(void)loadView {
    [super loadView];

    self.title = @"Async Display Kit Feed";

    _tableView =[[ASTableView alloc] initWithFrame:CGRectMake(CGRectGetMinX(self.view.bounds), CGRectGetMaxY(self.navigationController.navigationBar.bounds), CGRectGetWidth(self.view.bounds), CGRectGetHeight(self.view.bounds) - CGRectGetHeight(self.navigationController.navigationBar.bounds) - CGRectGetHeight(self.tabBarController.tabBar.bounds))];
    _tableView.tableFooterView = [UIView new];
    _tableView.asyncDelegate = self;

    [self.view addSubview:_tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    self.dataSource =
    [[PSAsyncStreamDataSource alloc] initWithTableView:self.tableView
                                        viewModel:self.viewModel];
    _tableView.asyncDataSource = self.dataSource;
}

@end
