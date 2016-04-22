//
//  ProductDetailViewController.m
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import "ProductDetailViewController.h"

@implementation ProductDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.title = @"Product Detail";
    [self loadProductImage];
    [self.productImageView setTranslatesAutoresizingMaskIntoConstraints:NO];
    self.navigationController.navigationBar.topItem.title = @"";
    self.scrollView.clipsToBounds = YES;
    self.scrollView.scrollEnabled = YES;
    self.scrollView.userInteractionEnabled = YES;
    self.scrollView.contentSize = CGSizeMake(400, 2300);
}

- (void)loadProductImage {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURL *url = [NSURL URLWithString:self.productImageURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.productImageView.image = image;
            
        });
    });
}

@end
