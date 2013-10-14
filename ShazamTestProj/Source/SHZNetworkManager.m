//
//  SHZNetworkManager.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZNetworkManager.h"
#import "NSURLRequest+Common.h"

@implementation SHZNetworkManager

- (void) asyncFetchRSSFeedWithURLString:(NSString *)urlString completion:(fetchRSSFeedCompletionBlock)completionBlock {
    
    if (urlString.length == 0) {
        
        DLog(@"Empty RSS Feed URL requested!");
        completionBlock(NO, nil);
    }
    else {
        
        DLog(@"Downloading RSS Feed");
        
        NSURLRequest *request = [NSURLRequest urlRequestWithURLString:urlString];
        NSOperationQueue *queue = [NSOperationQueue mainQueue];
        
        [NSURLConnection sendAsynchronousRequest:request queue:queue completionHandler:^(NSURLResponse *response, NSData *retrievedData, NSError *error) {
            
            BOOL success = (error == nil);
            completionBlock(success, retrievedData);
        }];
    }
}

@end
