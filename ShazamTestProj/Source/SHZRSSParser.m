//
//  SHZRSSParser.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSParser.h"
#import "SHZRSSItem.h"

NSString *const kItemTagName = @"item";


@interface SHZRSSParser () <NSXMLParserDelegate>

@end


@implementation SHZRSSParser

- (NSArray *) parseData:(NSData *)xmlData {
    
    if (xmlData.length == 0) {
        return nil;
    }
    
    NSArray *result = nil;
    
    // TODO: implement parsing data
    {
        NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithData:xmlData];
        
        xmlParser.delegate = self;
        [xmlParser parse];

        DLog(@"Parsing xml data..");

        // TODO: abort parsing if app goes inactive
    }
    
    return result;
}


#pragma mark - NSXMLParserDelegate

- (void) parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict {

    if ([elementName isEqualToString:kItemTagName]) {

        DLog(@"%@ tag found", kItemTagName);
    }
}

- (void) parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName {

    if ([elementName isEqualToString:kItemTagName]) {

        DLog(@"%@ closing tag found", kItemTagName);
    }
}

- (void) parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {

}


@end
