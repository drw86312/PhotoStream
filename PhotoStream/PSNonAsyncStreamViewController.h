//
//  PSNonAsyncStreamViewController.h
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PSStreamViewModel.h"

@interface PSNonAsyncStreamViewController : UIViewController

@property (strong, nonatomic) PSStreamViewModel *viewModel;

@end
