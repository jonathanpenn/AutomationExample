//
//  AUTDetailViewController.h
//  AutomationExample
//
//  Created by Jonathan Penn on 6/28/12.
//  Copyright (c) 2012 Navel Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AUTDetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;

@property (strong, nonatomic) IBOutlet UILabel *detailDescriptionLabel;

@end
