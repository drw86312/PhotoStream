//
//  PSPhotoCellNode.h
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AsyncDisplayKit/AsyncDisplayKit.h>
#import "PSPhoto.h"

@interface PSPhotoCellNode : ASCellNode

-(id)initWithPhoto:(PSPhoto*)photo;

@property (strong, nonatomic) ASNetworkImageNode *imageNode;
@property (strong, nonatomic) ASTextNode *textNode;

@end
