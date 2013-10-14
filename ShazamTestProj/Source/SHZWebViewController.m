//
//  SHZWebViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/14/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZWebViewController.h"

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
    
    if (_url.length > 0) {
        
        NSURL *url = [NSURL URLWithString:_url];
        NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
        
        [_webView loadRequest:request];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
