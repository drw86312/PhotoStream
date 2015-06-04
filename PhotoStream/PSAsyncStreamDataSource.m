//
//  PSStreamDataSource.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSAsyncStreamDataSource.h"
#import "PSPhotoCellNode.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "PSObject.h"

@interface PSAsyncStreamDataSource ()
@property (weak, readwrite) PSStreamViewModel *viewModel;
@end

@implementation PSAsyncStreamDataSource

- (instancetype)initWithTableView:(ASTableView *)tableView
                        viewModel:(PSStreamViewModel *)viewModel {
    if (self = [super init]) {

        self.viewModel = viewModel;

        [RACObserve(self.viewModel, photos)
         subscribeNext:^(NSArray *photos) {
            [tableView reloadData];
        }];
    }
    return self;
}

- (ASCellNode *)tableView:(ASTableView*)tableView nodeForRowAtIndexPath:(NSIndexPath*)indexPath {

    PSObject *photoObject = [self.viewModel.photos objectAtIndex:indexPath.row];
    PSPhotoCellNode *photoNode = [[PSPhotoCellNode alloc] initWithPhoto:photoObject.standardResolutionPhoto];;
    photoNode.imageNode.URL = photoObject.standardResolutionPhoto.url;
    return photoNode;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.photos.count;
}

@end
