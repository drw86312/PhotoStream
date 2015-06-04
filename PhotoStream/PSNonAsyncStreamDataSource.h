//
//  PSNonAsyncDataSource.h
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSStreamViewModel.h"
#import <UIKit/UIKit.h>

@interface PSNonAsyncStreamDataSource : NSObject <UITableViewDataSource>

- (instancetype)initWithTableView:(UITableView *)tableView
                        viewModel:(PSStreamViewModel *)viewModel;


@end
