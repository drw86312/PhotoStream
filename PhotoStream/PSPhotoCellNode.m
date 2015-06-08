//
//  PSPhotoCellNode.m
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSPhotoCellNode.h"
#import "PSComment.h"
#import "NSDate+TimeAgo.h"

CGFloat const kCellHeaderHeight = 50;

@interface PSPhotoCellNode ()
@property (strong, nonatomic) ASNetworkImageNode *userProfileImageNode;
@property (strong, nonatomic) ASNetworkImageNode *imageNode;
@property (strong, nonatomic) ASTextNode *commentsNode;
@property (strong, nonatomic) ASTextNode *nameNode;
@property (strong, nonatomic) ASTextNode *timeNode;
@end

@implementation PSPhotoCellNode

-(id)initWithPhotoObject:(PSObject*)photoObject {
    self = [super init];
    if (self) {

        float width = CGRectGetWidth([UIScreen mainScreen].bounds);
        float imageHeight = photoObject.standardResolutionPhoto.height.floatValue/photoObject.standardResolutionPhoto.width.floatValue * width;
        float sidePadding = 15.f;
        float topPadding = 10.f;

        _userProfileImageNode = [[ASNetworkImageNode alloc] init];
        _userProfileImageNode.backgroundColor = [UIColor lightGrayColor];
        _userProfileImageNode.URL = photoObject.userProfileImageURL;
        _userProfileImageNode.frame = CGRectMake(sidePadding, topPadding, kCellHeaderHeight - (2*topPadding), kCellHeaderHeight - (2*topPadding));
        _userProfileImageNode.layer.cornerRadius = CGRectGetWidth(_userProfileImageNode.frame)/2;
        _userProfileImageNode.clipsToBounds = YES;
        [self addSubnode:_userProfileImageNode];

        _timeNode = [[ASTextNode alloc] init];
        _timeNode.maximumLineCount = 1;
        _timeNode.attributedString =
        [[NSAttributedString alloc] initWithString:[photoObject.timeStamp timeAgoSimple]
                                        attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue-UltraLight"
                                                                                           size:12.0]}];
        CGSize sizeThatFits =[_timeNode measure:CGSizeMake(CGFLOAT_MAX, CGFLOAT_MAX)];
        _timeNode.frame = CGRectMake(width - sidePadding - sizeThatFits.width, kCellHeaderHeight/2 - sizeThatFits.height/2, sizeThatFits.width, sizeThatFits.height);
        [self addSubnode:_timeNode];

        _nameNode = [[ASTextNode alloc] init];
        _nameNode.maximumLineCount = 1;
        _nameNode.attributedString =
        [[NSAttributedString alloc] initWithString:photoObject.userFullName
                                        attributes:@{NSFontAttributeName : [UIFont fontWithName:@"HelveticaNeue"
                                                                                           size:16.0]}];

        float rightSpace = width - (CGRectGetMinX(_timeNode.frame) - sidePadding);
        float leftSpace = CGRectGetMaxX(_userProfileImageNode.frame) + sidePadding;
        sizeThatFits =[_nameNode measure:CGSizeMake(width - rightSpace - leftSpace, CGFLOAT_MAX)];

        _nameNode.frame = CGRectMake(CGRectGetMaxY(_userProfileImageNode.frame) + 15, kCellHeaderHeight/2 - sizeThatFits.height/2, sizeThatFits.width, sizeThatFits.height);
        [self addSubnode:_nameNode];

        _imageNode = [[ASNetworkImageNode alloc] init];
        _imageNode.backgroundColor = [UIColor lightGrayColor];
        _imageNode.URL = photoObject.standardResolutionPhoto.url;
        _imageNode.frame = CGRectMake(0, kCellHeaderHeight, width, imageHeight);
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
        sizeThatFits = [_commentsNode measure:CGSizeMake(width, 120)];
        _commentsNode.frame = CGRectMake(sidePadding, CGRectGetMaxY(_imageNode.frame) + topPadding, width - (2*sidePadding), sizeThatFits.height);
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
