//
//  SHZRSSItem.h
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

@interface SHZRSSItem : NSObject

@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *trackName;
@property (nonatomic, copy, readonly) NSString *trackArtist;
@property (nonatomic, copy, readonly) NSString *link;

- (id) initWithTitle:(NSString *)title trackName:(NSString *)trackName trackArtist:(NSString *)trackArtist link:(NSString *)link;
+ (id) rssItemWithTitle:(NSString *)title trackName:(NSString *)trackName trackArtist:(NSString *)trackArtist link:(NSString *)link;

- (id) initWithRSSItem:(SHZRSSItem *)other;
+ (id) rssItemWithRSSItem:(SHZRSSItem *)other;

@end
