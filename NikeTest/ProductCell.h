//
//  ProductCell.h
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"

@interface ProductCell : UITableViewCell

- (void)configureCellWithProduct:(Product *)product;

@end
