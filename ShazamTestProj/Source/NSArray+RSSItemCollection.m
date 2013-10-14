//
//  NSArray+RSSItemCollection.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/15/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "NSArray+RSSItemCollection.h"

@implementation NSArray (RSSItemCollection)

- (SHZRSSItem *) rssItemForIndex:(int)index {
    
    SHZRSSItem *rssItem = nil;
    
    if ([self count] > index) {
        
        id dataSourceObject = self[index];
        
        if ([dataSourceObject isKindOfClass:[SHZRSSItem class]] == NO) {
            DLog(@"Unexpected DataSource object class!");
        }
        else {
            rssItem = (SHZRSSItem *)dataSourceObject;
        }
    }
    return rssItem;
}

- (NSString *) urlFromRSSItemForIndex:(int)index {
    
    SHZRSSItem *rssItem = [self rssItemForIndex:index];
    NSString *url = rssItem.link;
    
    return url;
}

@end
