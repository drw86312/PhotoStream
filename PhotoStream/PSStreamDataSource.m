//
//  PSStreamDataSource.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSStreamDataSource.h"

@interface PSStreamDataSource ()
@property (weak, readwrite) PSStreamViewModel *viewModel;
@end

@implementation PSStreamDataSource

- (instancetype)initWithTableView:(ASTableView *)tableView
                        viewModel:(PSStreamViewModel *)viewModel {
    if (self = [super init]) {

        self.viewModel = viewModel;


    }
    return self;
}

- (ASCellNode *)tableView:(id)tableView nodeForRowAtIndexPath:(id)indexPath {

    ASCellNode *cellNode = [ASCellNode new];
    return cellNode;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


@end
