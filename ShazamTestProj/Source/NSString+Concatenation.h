//
//  NSString+Concatenation.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Concatenation)

+ (NSString *) safeAppendString:(NSString *)stringToAppend toString:(NSString *)string;

@end
