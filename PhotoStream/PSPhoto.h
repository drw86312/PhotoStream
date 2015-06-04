//
//  PSPhoto.h
//  PhotoStream
//
//  Created by David Warner on 6/3/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PSPhoto : NSObject

-(instancetype)initWithURL:(NSURL*)url
                     width:(NSNumber*)width
                    height:(NSNumber*)height;

@property (strong, nonatomic) NSURL *url;
@property (strong, nonatomic) NSNumber *width;
@property (strong, nonatomic) NSNumber *height;


@end
