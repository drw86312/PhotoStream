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
#import "PSComment.h"

static NSString *const kClientID = @"7b38cad66c05466e9cd872f546d39d39";

@implementation PSStreamViewModel

- (instancetype)init {
    if (self = [super init]) {

        NSString *urlString = [NSString stringWithFormat:@"https://api.instagram.com/v1/users/3/media/recent/?client_id=%@", kClientID];

        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        [manager GET:urlString
          parameters:nil
             success:^(AFHTTPRequestOperation *operation, NSDictionary *responseObject) {

                 NSMutableArray *tempArray = [NSMutableArray new];

                 [(NSArray*)responseObject[@"data"] enumerateObjectsUsingBlock:^(NSDictionary *photoDict, NSUInteger idx, BOOL *stop) {

                     PSObject *photoObject = [PSObject new];

                     photoObject.attribution = photoDict[@"attribution"];
                     photoObject.commentsCount = (NSNumber*)photoDict[@"comments"][@"count"];
                     photoObject.likesCount = (NSNumber*)photoDict[@"likes"][@"count"];

                     photoObject.userFullName = photoDict[@"user"][@"full_name"];
                     photoObject.username = photoDict[@"user"][@"username"];
                     photoObject.userProfileImageURL = [NSURL URLWithString:photoDict[@"user"][@"profile_picture"]];

                     photoObject.captionText = photoDict[@"caption"][@"text"];
                     photoObject.timeStamp = [NSDate dateWithTimeIntervalSince1970:[(NSNumber*)photoDict[@"created_time"] doubleValue]];

                     photoObject.lowResolutionPhoto =
                     [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"low_resolution"][@"url"]]
                                            width:(NSNumber*)photoDict[@"images"][@"low_resolution"][@"width"]
                                           height:(NSNumber*)photoDict[@"images"][@"low_resolution"][@"height"]];

                     photoObject.thumbnailPhoto =
                     [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"thumbnail"][@"url"]]
                                            width:(NSNumber*)photoDict[@"images"][@"thumbnail"][@"width"]
                                           height:(NSNumber*)photoDict[@"images"][@"thumbnail"][@"height"]];

                     photoObject.standardResolutionPhoto =
                     [[PSPhoto alloc] initWithURL:[NSURL URLWithString:photoDict[@"images"][@"standard_resolution"][@"url"]]
                                            width:(NSNumber*)photoDict[@"images"][@"standard_resolution"][@"width"]
                                           height:(NSNumber*)photoDict[@"images"][@"standard_resolution"][@"height"]];


                     NSMutableArray *tempCommentsArray = [NSMutableArray new];

                     [(NSArray*)photoDict[@"comments"][@"data"] enumerateObjectsUsingBlock:^(NSDictionary *commentDict, NSUInteger idx, BOOL *stop) {

                         PSComment *comment = [PSComment new];
                         comment.commenterName = commentDict[@"from"][@"full_name"];
                         comment.commenterUsername = commentDict[@"from"][@"username"];
                         comment.userProfileImageURL = [NSURL URLWithString:commentDict[@"from"][@"profile_picture"]];
                         comment.timeStamp = [NSDate dateWithTimeIntervalSince1970:[(NSNumber*)commentDict[@"created_time"] doubleValue]];
                         comment.text = commentDict[@"text"];

                         [tempCommentsArray addObject:comment];
                     }];

                     photoObject.comments = [NSArray arrayWithArray:tempCommentsArray];
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
