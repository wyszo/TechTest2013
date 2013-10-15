//
//  SHZWebViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZWebViewController.h"
#import "NSURLRequest+Common.h"
#import "UIAlertView+CommonAlerts.h"
#import "NSError+CommonErrors.h"


@interface SHZWebViewController () <UIWebViewDelegate>

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation SHZWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _webView.delegate = self;
    [self displayContentsOfURL:_url];
}

- (void) displayContentsOfURL:(NSString *)url {
        
    NSURLRequest *request = [NSURLRequest urlRequestWithURLString:url];
    [_webView loadRequest:request];
}


#pragma mark - UIWebViewDelegate

- (void) webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {

    if ([error isNoInternetConnectionError]) {
        
        [UIAlertView showNewNoInternetAlertView];
    }
    else {
        [UIAlertView showNewWebPageErrorAlertView];
    }
}


@end
