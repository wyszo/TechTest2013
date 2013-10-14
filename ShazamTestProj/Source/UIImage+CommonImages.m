//
//  UIImage+CommonImages.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "UIImage+CommonImages.h"

static NSString *const kFeedIconName = @"Generic_Feed-icon";


@implementation UIImage (CommonImages)

+ (UIImage *) feedIcon {
    return [UIImage imageNamed:kFeedIconName];
}

@end
