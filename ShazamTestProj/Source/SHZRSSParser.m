//
//  SHZRSSParser.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSParser.h"
#import "SHZRSSMutableItem.h"
#import "NSString+Concatenation.h"

static NSString *const kItemTagName = @"item";

static NSString *const kTitleElementName = @"title";
static NSString *const kTrackNameElementName = @"trackName";
static NSString *const kTrackArtistElementName = @"trackArtist";
static NSString *const kLinkElementName = @"link";


@interface SHZRSSParser () <NSXMLParserDelegate>

@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, copy) NSString *currentElement;
@property (nonatomic, assign) BOOL insideItemElement;
@property (nonatomic, strong) SHZRSSMutableItem *rssItem;

@property (nonatomic, strong) NSMutableArray *rssItems;

@end


/**
* Technical debt: convert this into NSOperation!
*/
@implementation SHZRSSParser

- (NSArray *) parseData:(NSData *)xmlData {
    
    if (xmlData.length == 0) {
        
        DLog(@"invalid xmlData obejct, returning");
        return nil;
    }
    
    _rssItems = [NSMutableArray new];
    
    self.xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
    _xmlParser.delegate = self;
    
    DLog(@"Parsing xml data..");
    [_xmlParser parse];
    
    // TODO: abort parsing if app goes inactive

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

        // TODO: save RSSItem, instead of RSSMutableItem

        if (_rssItem != nil) {
            [_rssItems addObject:_rssItem];
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

    // TODO: implement error handling
}


@end
