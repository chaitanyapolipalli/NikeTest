//
//  ProductDetailViewController.h
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductDetailViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;

@property (strong, nonatomic) NSString *productImageURL;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;

@end
