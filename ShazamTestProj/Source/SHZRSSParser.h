//
//  SHZRSSParser.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SHZRSSParser : NSObject

- (NSArray *) parseData:(NSData *)xmlData;

@end
