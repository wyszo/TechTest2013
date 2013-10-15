//
//  ShazamTestProjTests.m
//  ShazamTestProjTests
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "ShazamTestProjTests.h"
#import "SHZRSSParser.h"
#import "SHZRSSItem.h"


NSString *const kXMLTestFileName = @"taglistrss_test1";
const NSUInteger kNumberOfTagsInFile = 29;
const NSUInteger kLastTagIndex = kNumberOfTagsInFile - 1;

@interface ShazamTestProjTests ()

@property (nonatomic, strong) SHZRSSParser *rssParser;
@property (nonatomic, strong) NSArray *tags;

@end


@implementation ShazamTestProjTests

- (void)setUp
{
    [super setUp];
    
    /**
     * That's not really a unit test, just a quick dirty way to check that RSS parser is not broken
     * Normally tests should operate on MUCH smaller chunks of data than sample RSS feed loaded here
     *
     * Ideally SHZRSSParser should have proper unit tests instead of this
     */
    [self fillTagsWithTestFile1Data];
}

- (void) fillTagsWithTestFile1Data {
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:kXMLTestFileName ofType:@"xml"];
    NSData *xmlData = [NSData dataWithContentsOfFile:filePath];
    
    [self parseRSSData:xmlData];
}

- (void) parseRSSData:(NSData *)rssData {
    
    _rssParser = [SHZRSSParser new];
    __weak ShazamTestProjTests *weakSelf = self;
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    [_rssParser parseData:rssData completion:^(NSArray *tags, NSError *error) {
        
        weakSelf.tags = tags;
        dispatch_semaphore_signal(semaphore);
    }];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}

- (void)tearDown
{
    // Tear-down code here.
    [super tearDown];
}

- (void) testTagsNonempty {
    
    STAssertNotNil(self.tags, @"Parser failed, no results in tags array");
}

- (void) testNumberOfTags {
    
    STAssertEquals(self.tags.count, kNumberOfTagsInFile, @"Incorrect number of tags fetched");
}

- (void) testLastTagTitleNonempty {
    
    SHZRSSItem *lastItem = self.tags[kLastTagIndex];
    STAssertTrue(lastItem.title.length > 0, @"last item title empty");
}

/**
 * Test suite far from complete; just a dirty check if parsing looks fine
 */

@end
