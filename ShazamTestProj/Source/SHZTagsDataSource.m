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
#import "Configuration.h"

static NSString *const kXMLTestFileName = @"taglistrss_test1";


@interface SHZTagsDataSource ()

@property (nonatomic, strong) NSArray *tags;

@end


@implementation SHZTagsDataSource

- (void) asyncFetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock {

    [self fillTagsWithOnlineRSSFeedCompletion:completionBlock];
}


#pragma mark - Tags parsing

- (NSArray *) parseRSSData:(NSData *)rssData {

    SHZRSSParser *rssParser = [SHZRSSParser new];
    NSArray *tags = [rssParser parseData:rssData];

    return tags;
}


#pragma mark - RSS Feed Fetching

- (void) fillTagsWithOnlineRSSFeedCompletion:(fetchTagsCompletionBlock)completionBlock {

    SHZNetworkManager *networkManager = [[SHZNetworkManager alloc] init];
    __weak SHZTagsDataSource *weakSelf = self;

    [networkManager asyncFetchRSSFeedWithURLString:kShazamRSSFeedURL completion:^(NSData *rssFeed, NSError *error) {

        BOOL success = (error != nil);
        DLog(@"Network RSS Feed fetching success: %d", success);

        NSArray *tags = [weakSelf parseRSSData:rssFeed];
        weakSelf.tags = tags;

        completionBlock(tags, error);
    }];
}


#pragma mark - Test methods

// TODO: move this to the test project
- (void) fillTagsWithTestFile1DataCompletion:(fetchTagsCompletionBlock)completionBlock {

    NSString *filePath = [[NSBundle mainBundle] pathForResource:kXMLTestFileName ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];

    self.tags = [self parseRSSData:xmlData];

    completionBlock(_tags, nil);
}

@end
