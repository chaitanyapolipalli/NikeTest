//
//  ViewController.h
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ResultsViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@end

