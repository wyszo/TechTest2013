//
//  SHZTagsDataSource.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

typedef void (^fetchTagsCompletionBlock)(NSArray *tags, NSError *error);


@interface SHZTagsDataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *tags;

- (void) asyncFetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock;

@end
