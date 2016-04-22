//
//  ViewController.m
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import "ResultsViewController.h"
#import "NetworkManager.h"
#import "Product.h"
#import "ProductCell.h"
#import "ProductDetailViewController.h"

@interface ResultsViewController ()
@property (strong, nonatomic) NSArray *products;
@end

static NSString *reusableIdentifier = @"ProductCell";

@implementation ResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    __weak __typeof__(self) weakSelf = self;
    NetworkManager *networkManager = [[NetworkManager alloc] init];
    [networkManager productsFromURL:@"http://www.petesalvo.com/products.json"
                       successBlock:^(NSArray *products) {
                           __typeof__(self) strongSelf = weakSelf;
                           strongSelf.products = products;
                           [strongSelf.tableView reloadData];
                       }
                       faulureBlock:^(NSError *error) {
                       }
     ];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.products.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    ProductCell *cell = (ProductCell *)[tableView dequeueReusableCellWithIdentifier:reusableIdentifier forIndexPath:indexPath];
    [cell configureCellWithProduct:self.products[indexPath.row]];
    return cell;
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    ProductCell *cell = (ProductCell *)sender;
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    
    if ([segue.identifier isEqualToString:@"ProductDetailSegue"]) {
        ProductDetailViewController *viewController = (ProductDetailViewController *)segue.destinationViewController;
        Product *product = self.products[indexPath.row];
        viewController.productImageURL = product.fullImageURL;
    }
}

@end
