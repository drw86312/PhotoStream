//
//  PSPhotoCellNode.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSPhotoCellNode.h"
#import "PSComment.h"

@implementation PSPhotoCellNode

-(id)initWithPhoto:(PSObject*)photoObject {
    self = [super init];
    if (self) {

        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.backgroundColor = [UIColor lightGrayColor];

        float width = CGRectGetWidth([UIScreen mainScreen].bounds);
        float height = photoObject.standardResolutionPhoto.height.floatValue/photoObject.standardResolutionPhoto.width.floatValue * width;
        _imageNode.frame = CGRectMake(0, 0, width, height);

        [self addSubnode:_imageNode];

        _textNode = [[ASTextNode alloc] init];

        NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] init];

        [photoObject.comments enumerateObjectsUsingBlock:^(PSComment *c, NSUInteger idx, BOOL *stop) {

            NSMutableAttributedString *author =
            [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", c.commenterUsername]
                                                   attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light"       size:12.0]}];
            NSAttributedString *comment =
            [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", c.text]
                                            attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:12.0]}];

            [author appendAttributedString:comment];
            [textString appendAttributedString:author];
        }];

        self.textNode.attributedString = textString;
        self.textNode.maximumLineCount = 8;
        CGSize textSize = [_textNode measure:CGSizeMake(width, 120)];
        self.textNode.frame = CGRectMake(10, CGRectGetMaxY(_imageNode.frame), width -20, textSize.height);
        [self addSubnode:_textNode];
    }
    return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    float bottomPadding = 10;
    return CGSizeMake(_imageNode.frame.size.width, _imageNode.frame.size.height + _textNode.frame.size.height + bottomPadding);
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
