//
//  PSPhoto.m
//  PhotoStream
//
//  Created by David Warner on 6/3/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSPhoto.h"

@implementation PSPhoto

-(instancetype)initWithURL:(NSURL*)url
                     width:(NSNumber*)width
                    height:(NSNumber*)height {
    if (self = [super init]) {
        self.url= url;
        self.width = width;
        self.height = height;
    }
    return self;
}

@end
