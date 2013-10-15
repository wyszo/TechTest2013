//
//  SHZRSSParseOperation.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

typedef void (^rssParseCompletionBlock)(NSArray *tags, NSError *error);


@interface SHZRSSParseOperation : NSOperation

- (id) initWithXMLData:(NSData *)xmlData completion:(rssParseCompletionBlock)completion;

@end
