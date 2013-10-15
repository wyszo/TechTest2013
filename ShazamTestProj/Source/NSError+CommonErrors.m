//
//  NSError+CommonErrors.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "NSError+CommonErrors.h"

NSString *const kRSSFeedErrorDomain = @"RSSFeedErrorDomain";
NSString *const kXMLParsingErrorDomain = @"XMLParsingErrorDomain";


@implementation NSError (CommonErrors)

- (BOOL) isNoInternetConnectionError {
    return (self.code == NSURLErrorNotConnectedToInternet);
}

@end
