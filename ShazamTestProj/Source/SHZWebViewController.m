//
//  SHZWebViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZWebViewController.h"
#import "NSURLRequest+Common.h"

@interface SHZWebViewController ()

@property (weak, nonatomic) IBOutlet UIWebView *webView;

@end


@implementation SHZWebViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayContentsOfURL:_url];
}

- (void) displayContentsOfURL:(NSString *)url {
    
    NSURLRequest *request = [NSURLRequest urlRequestWithURLString:_url];
    [_webView loadRequest:request];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
