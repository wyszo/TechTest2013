//
// Created by Tomasz Wyszomirski on 10/15/13.
// Copyright (c) 2013 Wyszo. All rights reserved.
//#import "UIAlertView+CommonAlerts.h"


@implementation UIAlertView (CommonAlerts)

+ (UIAlertView *) showNewWebPageErrorAlertView {

    NSString *error = NSLocalizedString(@"WebPageError", nil);

    UIAlertView *alertView = [self okAlertViewWithTitle:nil message:error];
    [alertView show];

    return alertView;
}

+ (UIAlertView *) showNewNoInternetAlertView {

    NSString *error = NSLocalizedString(@"InternetDown", nil);
    
    UIAlertView *alertView = [self okAlertViewWithTitle:nil message:error];
    [alertView show];
    
    return alertView;
}



#pragma mark - Common methods

+ (UIAlertView *) okAlertViewWithTitle:(NSString *)title message:(NSString *)message {

    NSString *ok = NSLocalizedString(@"ButtonOK", nil);

    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title
                                                        message:message
                                                       delegate:nil
                                              cancelButtonTitle:ok
                                              otherButtonTitles:nil];

    return alertView;
}

@end