//
//  Product.h
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Product : NSObject

@property (nonatomic, readonly, strong) NSString *name;
@property (nonatomic, readonly, strong) NSString *color;
@property (nonatomic, readonly, strong) NSString *price;
@property (nonatomic, readonly, strong) NSString *styleCode;
@property (nonatomic, readonly, strong) NSString *thumbImageURL;
@property (nonatomic, readonly, strong) NSString *fullImageURL;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
