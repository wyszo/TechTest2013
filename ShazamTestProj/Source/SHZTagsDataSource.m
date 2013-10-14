//
//  SHZTagsDataSource.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZTagsDataSource.h"
#import "SHZRSSParser.h"
#import "SHZRSSItem.h"

static NSString *const kXMLTestFileName = @"taglistrss_test1";


@interface SHZTagsDataSource ()

@property (nonatomic, strong) NSArray *tags;

@end


@implementation SHZTagsDataSource

- (void) fetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock {
    
    // TODO: Not implemented yet
    
    // for testing
//    [self fillTagsWithTestDataCompletion:completionBlock];
    [self fillTagsWithTestFile1DataCompletion:completionBlock];
}

- (void) fillTagsWithTestDataCompletion:(fetchTagsCompletionBlock)completionBlock {

    SHZRSSItem *sampleItem1 = [[SHZRSSItem alloc] initWithTitle:@"title 1" trackName:@"track 1" trackArtist:@"artist 1" link:nil];

    self.tags = @[ sampleItem1 ];
    completionBlock(YES, _tags);
}

- (void) fillTagsWithTestFile1DataCompletion:(fetchTagsCompletionBlock)completionBlock {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:kXMLTestFileName ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];

    SHZRSSParser *rssParser = [SHZRSSParser new];
    NSArray *tags = [rssParser parseData:xmlData];
    self.tags = tags;

    completionBlock(YES, _tags);
}

@end
