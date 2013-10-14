//
//  NSArray+RSSItemCollection.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSItem.h"


@interface NSArray (RSSItemCollection)

- (SHZRSSItem *) rssItemForIndex:(int)index;
- (NSString *) urlFromRSSItemForIndex:(int)index;

@end
