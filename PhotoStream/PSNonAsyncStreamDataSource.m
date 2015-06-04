//
//  PSNonAsyncStreamDataSource.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSNonAsyncStreamDataSource.h"
#import "PSTableViewCell.h"

@interface PSNonAsyncStreamDataSource ()
@property (weak, readwrite) PSStreamViewModel *viewModel;
@end

static NSString *const kPhotoCell = @"PhotoCell";

@implementation PSNonAsyncStreamDataSource

- (instancetype)initWithTableView:(UITableView *)tableView
                        viewModel:(PSStreamViewModel *)viewModel {
    if (self = [super init]) {

        self.viewModel = viewModel;

        [tableView registerClass:[PSTableViewCell class] forCellReuseIdentifier:kPhotoCell];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.viewModel.photos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    PSTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kPhotoCell];
    return cell;
}

@end
