//
//  SHZViewController.m
//  ShazamTestProj
//
//  Created by Wyszo on 10/13/13.
//  Copyright (c) 2013 Wyszo. All rights reserved.
//

#import "SHZViewController.h"

@interface SHZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tagsTableView;

@end


@implementation SHZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}


#pragma mark - TableView DataSource

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 0;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    return nil;
}


#pragma mark - TableView Delegate

- (void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    // TODO: bring up a corresponding webpage
}


@end
