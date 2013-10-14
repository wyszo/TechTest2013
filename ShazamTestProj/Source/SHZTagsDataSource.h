//
//  SHZTagsDataSource.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^fetchTagsCompletionBlock)(BOOL finished, NSArray *tags);


@interface SHZTagsDataSource : NSObject

@property (nonatomic, strong, readonly) NSArray *tags;

/**
 * Asynchronous
 */
- (void) fetchTagsCompletion:(fetchTagsCompletionBlock)completionBlock;


@end
