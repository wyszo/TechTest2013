//
//  SHZRSSParser.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSParser.h"
#import "SHZRSSParseOperation.h"
#import "NSError+CommonErrors.h"


@interface SHZRSSParser ()

@property (nonatomic, strong) NSOperationQueue *operationQueue;
@property (nonatomic, strong) NSOperation *parseOperation;

@end


@implementation SHZRSSParser

- (void) parseData:(NSData *)xmlData completion:(rssParseCompletionBlock)completionBlock {

    if (xmlData.length == 0) {
        
        DLog(@"invalid xmlData object, returning");
        
        NSError *error = [NSError errorWithDomain:kXMLParsingErrorDomain code:XMLParsingInvalidXMLErrorCode userInfo:nil];
        completionBlock(nil, error);
    }
    else {
        
        _parseOperation = [[SHZRSSParseOperation alloc] initWithXMLData:xmlData completion:completionBlock];
        [self.operationQueue addOperation:_parseOperation];
    }
}

- (NSOperationQueue *) operationQueue {

    if (_operationQueue == nil) {
        _operationQueue = [[NSOperationQueue alloc] init];
    }
    return _operationQueue;
}

@end
