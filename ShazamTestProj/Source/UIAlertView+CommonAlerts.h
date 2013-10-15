//
// Created by Tomasz Wyszomirski on 10/15/13.
// Copyright (c) 2013 Wyszo. All rights reserved.

@interface UIAlertView (CommonAlerts)

+ (UIAlertView *) showNewWebPageErrorAlertView;
+ (UIAlertView *) showNewNoInternetAlertView;
+ (UIAlertView *) showRSSFeedFetchingErrorAlertView;
+ (UIAlertView *) showNewEmptyTagListAlertView;

@end