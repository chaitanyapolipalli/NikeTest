//
//  Product.m
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import "Product.h"

@interface Product ()
@property (nonatomic, readwrite, strong) NSString *name;
@property (nonatomic, readwrite, strong) NSString *color;
@property (nonatomic, readwrite, strong) NSString *price;
@property (nonatomic, readwrite, strong) NSString *styleCode;
@property (nonatomic, readwrite, strong) NSString *thumbImageURL;
@property (nonatomic, readwrite, strong) NSString *fullImageURL;
@end

@implementation Product

- (instancetype)initWithDictionary:(NSDictionary *)dictionary {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    _name = dictionary[@"name1"];
    _color = dictionary[@"colorDescription"];
    _styleCode = dictionary[@"style"];
    
    [self setImageURLSFromDictionary:dictionary];
    [self setPriceFromDictionary:dictionary[@"prices"][@"list"]];

    return self;
}

- (void)setImageURLSFromDictionary:(NSDictionary *)dictionary {
    
    NSArray *imagesArray = dictionary[@"images"];

    NSDictionary *fullImageDictionary = [imagesArray firstObject];
    _fullImageURL = fullImageDictionary[@"full"];

    NSDictionary *thumbImageDictionary = [imagesArray lastObject];
    _thumbImageURL = thumbImageDictionary[@"thumb"];
    
}

- (void)setPriceFromDictionary:(NSString *)priceString {
    
    NSNumber *number = [NSNumber numberWithDouble:[priceString doubleValue]];
    
    NSNumberFormatter *currencyFormatter = [[NSNumberFormatter alloc] init];
    [currencyFormatter setNumberStyle:NSNumberFormatterCurrencyStyle];
    [currencyFormatter setCurrencyCode:@"USD"];
    [currencyFormatter setNegativeFormat:@"-¤#,##0.00"];
    [currencyFormatter setCurrencySymbol:@"$"];
    _price = [currencyFormatter stringFromNumber:number];
}

@end
