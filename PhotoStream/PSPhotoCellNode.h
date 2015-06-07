//
//  PSPhotoCellNode.h
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PSObject.h"

@interface PSPhotoCellNode : ASCellNode

-(id)initWithPhoto:(PSObject*)photoObject;

@end
