//
//  PSAsyncStreamDataSource.h
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PSStreamViewModel.h"

@interface PSAsyncStreamDataSource : NSObject <ASTableViewDataSource>

- (instancetype)initWithTableView:(ASTableView *)tableView
                        viewModel:(PSStreamViewModel *)viewModel;

@end
