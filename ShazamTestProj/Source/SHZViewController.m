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
#import "NSArray+RSSItemCollection.h"
#import "SHZWebViewController.h"

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
    
    self.title = NSLocalizedString(@"MainViewName", nil);
    
    self.tagsDataSource = [SHZTagsDataSource new];
    [self fetchTags];
}

- (void) fetchTags {
    
    __weak SHZViewController *weakSelf = self;

    [self.tagsDataSource asyncFetchTagsCompletion:^(BOOL success, NSArray *tags) {

        if (success == YES) {
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
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    }
    
    [self configureCell:cell forIndexPath:indexPath];
    return cell;
}


#pragma mark - TableViewCell Customization

- (void) configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    SHZRSSItem *rssItem = [_tagsDataSource.tags rssItemForIndex:indexPath.row];
    
    if (rssItem) {
        cell.textLabel.text = rssItem.title;
        cell.detailTextLabel.text = rssItem.trackArtist;
    }
    
    cell.imageView.image = [UIImage feedIcon];
}


#pragma mark - TableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    _lastSelectedIndexPath = indexPath;

    if ([_tagsDataSource.tags urlFromRSSItemForIndex:indexPath.row].length > 0) {
        [self performSegueWithIdentifier:kWebViewSegueIdentifier sender:self];
    }
}


#pragma mark - Segues 

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {

    [super prepareForSegue:segue sender:sender];

    if ([segue.destinationViewController isKindOfClass:[SHZWebViewController class]]) {
        
        SHZWebViewController *webViewController = (SHZWebViewController *)segue.destinationViewController;
        webViewController.url = [_tagsDataSource.tags urlFromRSSItemForIndex:_lastSelectedIndexPath.row];
    }
}


@end
