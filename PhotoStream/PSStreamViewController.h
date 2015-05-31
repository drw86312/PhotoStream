//
//  PSStreamViewController.h
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PSStreamViewModel.h"

@interface PSStreamViewController : UIViewController

@property (strong, nonatomic) PSStreamViewModel *viewModel;

@end
