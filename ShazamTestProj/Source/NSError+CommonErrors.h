//
//  NSError+CommonErrors.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

extern NSString *const kRSSFeedErrorDomain;

typedef enum {
    RSSFeedErrorCodeInvalidFeedURL
} RSSFeedErrorCode;


@interface NSError (CommonErrors)

- (BOOL) isNoInternetConnectionError;

@end
