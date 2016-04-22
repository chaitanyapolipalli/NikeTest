//
//  ProductCell.m
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import "ProductCell.h"

@interface ProductCell ()

@property (weak, nonatomic) IBOutlet UIImageView *productImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *styleCodeLabel;
@property (weak, nonatomic) IBOutlet UILabel *colorLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;

@end

@implementation ProductCell

- (void)configureCellWithProduct:(Product *)product {
    
    self.nameLabel.text = product.name;
    self.styleCodeLabel.text = [NSString stringWithFormat:@"StyleCode: %@", product.styleCode];
    self.colorLabel.text = [NSString stringWithFormat:@"Color: %@", product.color];
    self.priceLabel.text = product.price;
    
    [self setThumbnailImageForProduct:product];
}

- (void)setThumbnailImageForProduct:(Product *)product {
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        NSURL *url = [NSURL URLWithString:product.thumbImageURL];
        NSData *data = [NSData dataWithContentsOfURL:url];
        UIImage *image = [UIImage imageWithData:data];
        dispatch_async(dispatch_get_main_queue(), ^{
            self.productImageView.image = image;
        });
    });
}

@end
