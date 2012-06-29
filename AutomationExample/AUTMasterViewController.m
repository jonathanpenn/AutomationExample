//
//  AUTMasterViewController.m
//  AutomationExample
//
//  Created by Jonathan Penn on 6/28/12.
//  Copyright (c) 2012 Navel Labs. All rights reserved.
//

#import "AUTMasterViewController.h"

#import "AUTDetailViewController.h"

@implementation AUTMasterViewController

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

#pragma mark - Table View


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        UITableViewCell *cell = [self.tableView cellForRowAtIndexPath:indexPath];
        [[segue destinationViewController] setDetailItem:cell.textLabel.text];
    }
}

@end
