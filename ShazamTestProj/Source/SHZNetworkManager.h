//
//  SHZNetworkManager.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

typedef void (^fetchRSSFeedCompletionBlock)(BOOL success, NSData *rssFeed);


@interface SHZNetworkManager : NSObject

// TODO: cancel connections which are no longer needed (on app states transitions)

- (void) asyncFetchRSSFeedWithURLString:(NSString *)urlString completion:(fetchRSSFeedCompletionBlock)completionBlock;

@end
