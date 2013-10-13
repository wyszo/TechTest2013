//
//  SHZViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZViewController.h"
#import "SHZTagsDataSource.h"

@interface SHZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic, readwrite) IBOutlet UITableView *tagsTableView;
@property (strong, nonatomic) SHZTagsDataSource *tagsDataSource;

@end


@implementation SHZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
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

- (void) configureCell:(UITableViewCell *)cell forIndexPath:(NSIndexPath *)indexPath {
    
    if ([_tagsDataSource.tags count] > indexPath.row) {

        cell.textLabel.text = _tagsDataSource.tags[indexPath.row];
    }
}


#pragma mark - TableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // TODO: bring up a corresponding webpage
}


@end
