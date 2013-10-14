//
//  SHZViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZViewController.h"
#import "SHZTagsDataSource.h"
#import "UIImage+CommonImages.h"
#import "SHZRSSItem.h"
#import "SHZWebViewController.h"

static NSString *const kViewTitle = @"Shazam tags";
static NSString *const kWebViewSegueIdentifier = @"webViewSegue";


@interface SHZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic, readwrite) IBOutlet UITableView *tagsTableView;
@property (strong, nonatomic) SHZTagsDataSource *tagsDataSource;
@property (strong, nonatomic) NSIndexPath *lastSelectedIndexPath;

@end


@implementation SHZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = kViewTitle;
    
    self.tagsDataSource = [SHZTagsDataSource new];
    [self fetchTags];
}

- (void) fetchTags {
    
    __weak SHZViewController *weakSelf = self;

    [self.tagsDataSource fetchTagsCompletion:^(BOOL finished, NSArray *tags) {

        if (finished == YES) {
            [weakSelf.tagsTableView reloadData];
        }
    }];
}

- (void) didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - TableView DataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [_tagsDataSource.tags count];
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"TagCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}


#pragma mark - TableViewCell Customisation

- (void) configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    SHZRSSItem *rssItem = [self rssItemForIndexPath:indexPath];
    
    if (rssItem) {
        cell.textLabel.text = rssItem.title;
    }
    
    cell.imageView.image = [UIImage feedIcon];
}

- (SHZRSSItem *) rssItemForIndexPath:(NSIndexPath *)indexPath {
    
    SHZRSSItem *rssItem = nil;
    
    if ([_tagsDataSource.tags count] > indexPath.row) {
        
        id dataSourceObject = _tagsDataSource.tags[indexPath.row];
        
        if ([dataSourceObject isKindOfClass:[SHZRSSItem class]] == NO) {
            DLog(@"Unexpected DataSource object class!");
        }
        else {
            rssItem = (SHZRSSItem *)dataSourceObject;
        }
    }
    return rssItem;
}

- (NSString *) urlFromRSSItemForIndexPath:(NSIndexPath *)indexPath {
    
    SHZRSSItem *rssItem = [self rssItemForIndexPath:indexPath];
    NSString *url = rssItem.link;
    
    return url;
}


#pragma mark - TableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _lastSelectedIndexPath = indexPath;

    if ([self urlFromRSSItemForIndexPath:indexPath].length > 0) {
        [self performSegueWithIdentifier:kWebViewSegueIdentifier sender:self];
    }
}


#pragma mark - Segues 

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    [super prepareForSegue:segue sender:sender];

    if ([segue.destinationViewController isKindOfClass:[SHZWebViewController class]]) {
        
        SHZWebViewController *webViewController = (SHZWebViewController *)segue.destinationViewController;
        webViewController.url = [self urlFromRSSItemForIndexPath:_lastSelectedIndexPath];
    }
}


@end
