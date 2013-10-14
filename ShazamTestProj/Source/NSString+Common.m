//
//  NSString+Common.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "NSString+Common.h"

@implementation NSString (Common)

- (NSString *) stringByRemovingNewlineCharacters {
    return [self stringByReplacingOccurrencesOfString:@"\n" withString:@""];
}

@end
