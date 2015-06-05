//
//  PSComment.h
//  PhotoStream
//
//  Created by David Warner on 6/4/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSComment : NSObject

@property (strong, nonatomic) NSString *commenterName;
@property (strong, nonatomic) NSString *commenterUsername;
@property (strong, nonatomic) NSDate *timeStamp;
@property (strong, nonatomic) NSURL *userProfileImageURL;
@property (strong, nonatomic) NSString *text;

@end
