//
//  SHZRSSParser.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSParseOperation.h"


@interface SHZRSSParser : NSObject

- (void) parseData:(NSData *)xmlData completion:(rssParseCompletionBlock)completionBlock;

@end
