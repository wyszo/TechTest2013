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
#import "SHZNetworkManager.h"

static NSString *const kShazamRSSFeedURL = @"http://www.shazam.com/music/web/taglistrss?mode=xml&userName=shazam";
static NSString *const kXMLTestFileName = @"taglistrss_test1";


@interface SHZTagsDataSource ()

@property (nonatomic, strong) NSArray *tags;

@end


@implementation SHZTagsDataSource

- (void) fetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock {
    
    // TODO: Not implemented yet
    
    // for testing
//    [self fillTagsWithTestDataCompletion:completionBlock];
//    [self fillTagsWithTestFile1DataCompletion:completionBlock];
    [self fillTagsWithNetworkRSSFeedCompletion:completionBlock];
}


#pragma mark - Tags parsing

- (NSArray *) parseRSSData:(NSData *)rssData {

    SHZRSSParser *rssParser = [SHZRSSParser new];
    NSArray *tags = [rssParser parseData:rssData];

    return tags;
}


#pragma mark - RSS Feed Fetching

- (void) fillTagsWithNetworkRSSFeedCompletion:(fetchTagsCompletionBlock)completionBlock {

    SHZNetworkManager *networkManager = [[SHZNetworkManager alloc] init];
    __weak SHZTagsDataSource *weakSelf = self;

    [networkManager asyncFetchRSSFeedWithURLString:kShazamRSSFeedURL completion:^(BOOL success, NSData *rssFeed) {

        DLog(@"Network RSS Feed fetching success: %d", success);
        NSArray *tags = [weakSelf parseRSSData:rssFeed];
        weakSelf.tags = tags;

        completionBlock(YES, tags);
    }];
}


#pragma mark - Test methods

- (void) fillTagsWithTestDataCompletion:(fetchTagsCompletionBlock)completionBlock {

    SHZRSSItem *sampleItem1 = [[SHZRSSItem alloc] initWithTitle:@"title 1" trackName:@"track 1" trackArtist:@"artist 1" link:nil];

    self.tags = @[ sampleItem1 ];
    completionBlock(YES, _tags);
}

- (void) fillTagsWithTestFile1DataCompletion:(fetchTagsCompletionBlock)completionBlock {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:kXMLTestFileName ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];

    self.tags = [self parseRSSData:xmlData];

    completionBlock(YES, _tags);
}

@end
