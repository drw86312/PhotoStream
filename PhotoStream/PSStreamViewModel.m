//
//  PSStreamViewModel.m
//  PhotoStream
//
//  Created by David Warner on 5/31/15.
//  Copyright (c) 2015 dwarner. All rights reserved.
//

#import "PSStreamViewModel.h"
#import "AFHTTPRequestOperationManager.h"
#import "PSObject.h"

static NSString *const kClientID = @"7b38cad66c05466e9cd872f546d39d39";

@implementation PSStreamViewModel

- (instancetype)init {
    if (self = [super init]) {

        NSString *urlString = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/3/media/recent/?client_id=%@", kClientID];

        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:urlString
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

                 NSArray *data = responseObject[@"data"];
                 NSMutableArray *tempArray = [NSMutableArray new];

                 [data enumerateObjectsUsingBlock:^(NSDictionary *photoDict, NSUInteger idx, BOOL *stop) {

                     PSObject *photoObject = [PSObject new];

                     photoObject.attribution = photoDict[@"attribution"];
                     photoObject.commentsCount = (NSNumber*)photoDict[@"comments"][@"count"];
                     photoObject.likesCount = (NSNumber*)photoDict[@"likes"][@"count"];
                     photoObject.userProfileImageURL = [NSURL URLWithString:photoDict[@"user"][@"profile_picture"]];

//                     photoObject.userFullName = photoDict[@"user"][@"full_name"];
//                     photoObject.username = photoDict[@"user"][@"username"];

                     photoObject.lowResolutionPhoto = [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"low_resolution"][@"url"]] width:(NSNumber*)photoDict[@"images"][@"low_resolution"][@"width"] height:(NSNumber*)photoDict[@"images"][@"low_resolution"][@"height"]];

                     photoObject.thumbnailPhoto = [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"thumbnail"][@"url"]] width:(NSNumber*)photoDict[@"images"][@"thumbnail"][@"width"] height:(NSNumber*)photoDict[@"images"][@"thumbnail"][@"height"]];

                    photoObject.standardResolutionPhoto = [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"standard_resolution"][@"url"]] width:(NSNumber*)photoDict[@"images"][@"standard_resolution"][@"width"] height:(NSNumber*)photoDict[@"images"][@"standard_resolution"][@"height"]];

                     [tempArray addObject:photoObject];
                 }];

                 self.photos = [NSArray arrayWithArray:tempArray];

        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Error: %@", error);
        }];


        
    }
    return self;
}

@end
