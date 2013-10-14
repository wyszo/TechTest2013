//
//  SHZRSSItem.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZRSSItem.h"
#import "NSString+Common.h"


@interface SHZRSSItem ()

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *trackName;
@property (nonatomic, copy) NSString *trackArtist;
@property (nonatomic, copy) NSString *link;

@end


@implementation SHZRSSItem

- (id) initWithTitle:(NSString *)title trackName:(NSString *)trackName trackArtist:(NSString *)trackArtist link:(NSString *)link {

    self = [super init];
    if (self) {
        self.title = title;
        self.trackName = trackName;
        self.trackArtist = trackArtist;
        self.link = link;
    }

    return self;
}

+ (id) rssItemWithTitle:(NSString *)title trackName:(NSString *)trackName trackArtist:(NSString *)trackArtist link:(NSString *)link {

    return [[self alloc] initWithTitle:title trackName:trackName trackArtist:trackArtist link:link];
}

- (id) initWithRSSItem:(SHZRSSItem *)other {
    
    self = [super init];
    if (self) {
        self.title = other.title;
        self.trackName = other.trackName;
        self.trackArtist = other.trackArtist;
        self.link = other.link;
    }
    
    return self;
}

+ (id) rssItemWithRSSItem:(SHZRSSItem *)other {
    
    return [[self alloc] initWithRSSItem:other];
}


#pragma mark - Accessors

- (void) setLink:(NSString *)link {
    
    if ([link isEqualToString:_link] == NO) {
        
        NSString *processedLink = link;
        if (processedLink.length > 0) {
            processedLink = [processedLink stringByTrimmingWhitespaceAndNewline];
        }
        
        _link = processedLink;
    }
}

@end
