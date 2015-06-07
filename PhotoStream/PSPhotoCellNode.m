//
//  PSPhotoCellNode.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSPhotoCellNode.h"
#import "PSComment.h"

CGFloat const kCellHeaderHeight = 50;

@interface PSPhotoCellNode ()
@property (strong, nonatomic) ASNetworkImageNode *userProfileImageNode;
@property (strong, nonatomic) ASNetworkImageNode *imageNode;
@property (strong, nonatomic) ASTextNode *commentsNode;
@property (strong, nonatomic) ASTextNode *nameNode;
@end

@implementation PSPhotoCellNode

-(id)initWithPhoto:(PSObject*)photoObject {
    self = [super init];
    if (self) {

        float width = CGRectGetWidth([UIScreen mainScreen].bounds);
        float height = photoObject.standardResolutionPhoto.height.floatValue/photoObject.standardResolutionPhoto.width.floatValue * width;

        _userProfileImageNode = [[ASNetworkImageNode alloc] init];
        _userProfileImageNode.backgroundColor = [UIColor lightGrayColor];
        _userProfileImageNode.URL = photoObject.userProfileImageURL;
        _userProfileImageNode.frame = CGRectMake(15, 10, 30, 30);
        _userProfileImageNode.layer.cornerRadius = 15;
        _userProfileImageNode.clipsToBounds = YES;
        [self addSubnode:_userProfileImageNode];

        _nameNode = [[ASTextNode alloc] init];
        _nameNode.maximumLineCount = 1;
        _nameNode.attributedString =
        [[NSAttributedString alloc] initWithString:photoObject.userFullName
                                        attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue"
                                                                                           size:16.0]}];
        CGSize sizeThatFits =[_nameNode measure:CGSizeMake(width - (CGRectGetMaxY(_userProfileImageNode.frame) + 25), CGFLOAT_MAX)];
        _nameNode.frame = CGRectMake(CGRectGetMaxY(_userProfileImageNode.frame) + 15, kCellHeaderHeight/2 - sizeThatFits.height/2, sizeThatFits.width, sizeThatFits.height);
        [self addSubnode:_nameNode];

        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.backgroundColor = [UIColor lightGrayColor];
        _imageNode.URL = photoObject.standardResolutionPhoto.url;
        _imageNode.frame = CGRectMake(0, kCellHeaderHeight, width, height);
        [self addSubnode:_imageNode];

        _commentsNode = [[ASTextNode alloc] init];
        NSMutableAttributedString *textString = [[NSMutableAttributedString alloc] init];

        [photoObject.comments enumerateObjectsUsingBlock:^(PSComment *c, NSUInteger idx, BOOL *stop) {

            NSMutableAttributedString *author =
            [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ ", c.commenterUsername]
                                                   attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-Light"               size:12.0]}];
            NSAttributedString *comment =
            [[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n", c.text]
                                            attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-UltraLight" size:12.0]}];

            [author appendAttributedString:comment];
            [textString appendAttributedString:author];
        }];

        _commentsNode.attributedString = textString;
        _commentsNode.maximumLineCount = 8;
        CGSize textSize = [_commentsNode measure:CGSizeMake(width, 120)];
        _commentsNode.frame = CGRectMake(10, CGRectGetMaxY(_imageNode.frame) + 10, width -20, textSize.height);
        [self addSubnode:_commentsNode];
    }
    return self;
}

- (CGSize)calculateSizeThatFits:(CGSize)constrainedSize {
    float padding = 10;
    return CGSizeMake(_imageNode.frame.size.width, kCellHeaderHeight + _imageNode.frame.size.height + _commentsNode.frame.size.height + padding*2);
}

- (void)layout {

}


@end
