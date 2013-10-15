//
//  SHZNetworkManager.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

typedef void (^fetchRSSFeedCompletionBlock)(NSData *rssFeed, NSError *error);


@interface SHZNetworkManager : NSObject

- (void) asyncFetchRSSFeedWithURLString:(NSString *)urlString completion:(fetchRSSFeedCompletionBlock)completionBlock;

@end
