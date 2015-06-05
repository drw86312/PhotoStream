//
//  PSPhotoCellNode.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSPhotoCellNode.h"

@implementation PSPhotoCellNode

-(id)initWithPhoto:(PSPhoto*)photo {
    self = [super init];
    if (self) {

        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.backgroundColor = [UIColor lightGrayColor];

        float width = CGRectGetWidth([UIScreen mainScreen].bounds);
        float height = photo.height.floatValue/photo.width.floatValue * width;
        _imageNode.frame = CGRectMake(0, 0, width, height);

        [self addSubnode:_imageNode];

        _textNode = [[ASTextNode alloc] init];
        
    }
    return self;
}

// perform expensive sizing operations on a background thread
- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    return CGSizeMake(_imageNode.frame.size.width, _imageNode.frame.size.height);
}

- (void)layout {
//    // layout the image using its cached size
//    CGSize imageSize = _imageNode.calculatedSize;
//
//    NSLog(@"%f, %f", imageSize.width , imageSize.height);
//
//    _imageNode.frame = CGRectMake(self.bounds.size.width - imageSize.width, 0.0f,
//                                  imageSize.width, imageSize.height);
//
//    // layout the text view using its cached size
//    CGSize textSize = _textNode.calculatedSize;
//    _textNode.frame = (CGRect){ CGPointZero, textSize };
}


@end
