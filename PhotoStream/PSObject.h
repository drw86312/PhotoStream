//
//  PSObject.h
//  PhotoStream
//
//  Created by David Warner on 6/3/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PSPhoto.h"

@interface PSObject : NSObject

@property (strong, nonatomic) NSString *attribution;
@property (strong, nonatomic) NSString *userFullName;
@property (strong, nonatomic) NSString *username;
@property (strong, nonatomic) NSString *captionText;

@property (strong, nonatomic) NSDate *timeStamp;

@property (strong, nonatomic) NSURL *userProfileImageURL;

@property (strong, nonatomic) NSNumber *commentsCount;
@property (strong, nonatomic) NSNumber *likesCount;

@property (strong, nonatomic) NSArray *comments;

@property (strong, nonatomic) PSPhoto *thumbnailPhoto;
@property (strong, nonatomic) PSPhoto *lowResolutionPhoto;
@property (strong, nonatomic) PSPhoto *standardResolutionPhoto;


@end
