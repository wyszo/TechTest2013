//
//  SHZTagsDataSource.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZTagsDataSource.h"

@interface SHZTagsDataSource ()

@property (nonatomic, strong) NSArray *tags;

@end


@implementation SHZTagsDataSource

- (void) fetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock {
    
    // TODO: Not implemented yet
    
    // for testing
    [self fillTagsWithTestDataCompletion:completionBlock];
}

- (void) fillTagsWithTestDataCompletion:(fetchTagsCompletionBlock)completionBlock {
    
    self.tags = @[ @"test 1", @"test 2" ];
    completionBlock(YES, _tags);
}

@end
