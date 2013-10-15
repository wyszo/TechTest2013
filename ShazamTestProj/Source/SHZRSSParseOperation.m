//
//  SHZRSSParseOperation.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSParseOperation.h"
#import "SHZRSSMutableItem.h"
#import "NSString+Concatenation.h"
#import "NSError+CommonErrors.h"


static NSString *const kItemTagName = @"item";

static NSString *const kTitleElementName = @"title";
static NSString *const kTrackNameElementName = @"trackName";
static NSString *const kTrackArtistElementName = @"trackArtist";
static NSString *const kLinkElementName = @"link";


@interface SHZRSSParseOperation () <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, copy) NSString *currentElement;
@property (nonatomic, assign) BOOL insideItemElement;
@property (nonatomic, strong) SHZRSSMutableItem *rssItem;

@property (nonatomic, strong) NSMutableArray *rssItems;
@property (nonatomic, copy) rssParseCompletionBlock customCompletionBlock;

@end


@implementation SHZRSSParseOperation

- (id) initWithXMLData:(NSData *)xmlData completion:(rssParseCompletionBlock)completion {

    self = [super init];
    if (self) {

        _rssItems = [NSMutableArray new];

        _xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
        _xmlParser.delegate = self;
        
        _customCompletionBlock = completion;
    }

    return self;
}

- (void) main {

    DLog(@"Parsing xml data..");
    BOOL success = [_xmlParser parse];

    if (success) {
        
        DLog(@"Parsing xml data: success");
        
        NSArray *result = [self immutableRSSItems];
        _customCompletionBlock(result, nil);
    }
}

- (NSArray *) immutableRSSItems {
    
    NSArray *result = nil;
    
    if (_rssItems.count > 0) {
        result = [NSArray arrayWithArray:_rssItems];
    }
    
    return result;
}


#pragma mark - NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    self.currentElement = elementName;

    if ([elementName isEqualToString:kItemTagName]) {

        DLog(@"%@ tag found, creating new RSSItem object", kItemTagName);
        _insideItemElement = YES;

        _rssItem = [SHZRSSMutableItem new];
    }
    else {
        DLog(@"%@ tag found", elementName);
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if ([elementName isEqualToString:kItemTagName]) {

        DLog(@"%@ closing tag found, adding new RSSItem", kItemTagName);
        _insideItemElement = NO;

        SHZRSSItem *newRSSItem = [[SHZRSSItem alloc] initWithRSSItem:_rssItem]; // dropping mutability

        if (newRSSItem != nil) {
            [_rssItems addObject:newRSSItem];
        }
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

    if (_insideItemElement == YES) {

        if ([_currentElement isEqualToString:kTitleElementName]) {
            _rssItem.title = [NSString safeAppendString:string toString:_rssItem.title];
        }
        else if ([_currentElement isEqualToString:kTrackNameElementName]) {
            _rssItem.trackName = [NSString safeAppendString:string toString:_rssItem.trackName];
        }
        else if ([_currentElement isEqualToString:kTrackArtistElementName]) {
            _rssItem.trackArtist = [NSString safeAppendString:string toString:_rssItem.trackArtist];
        }
        else if ([_currentElement isEqualToString:kLinkElementName]) {
            _rssItem.link = [NSString safeAppendString:string toString:_rssItem.link];
        }
    }
}

- (void) parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
        
    NSArray *rssItems = [self immutableRSSItems];
    NSError *error = [NSError errorWithDomain:kXMLParsingErrorDomain code:XMLParsingInvalidXMLErrorCode userInfo:nil];
    
    _customCompletionBlock(rssItems, error);
}

@end
