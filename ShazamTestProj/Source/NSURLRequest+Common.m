//
//  NSURLRequest+Common.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "NSURLRequest+Common.h"

@implementation NSURLRequest (Common)

+ (NSURLRequest *) urlRequestWithURLString:(NSString *)urlString {
    
    NSURLRequest *request = nil;
    
    if (urlString.length > 0) {
        
        NSURL *url = [NSURL URLWithString:urlString];
        request = [[NSURLRequest alloc] initWithURL:url];
    }
    return request;
}

@end
