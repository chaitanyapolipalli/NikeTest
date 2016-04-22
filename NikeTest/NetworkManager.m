//
//  NetworkManager.m
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import "NetworkManager.h"
#import "Product.h"

@interface NetworkManager ()
@property (nonatomic, copy) void (^successBlock)(NSArray *);
@property (nonatomic, copy) void (^failureBlock)(NSError *);
@end

@implementation NetworkManager

- (void)productsFromURL:(NSString *)urlString
           successBlock:(void(^)(NSArray *))successBlock
           faulureBlock:(void(^)(NSError *))failureBlock {
    
    NSParameterAssert(successBlock);
    NSParameterAssert(failureBlock);
    
    self.successBlock = successBlock;
    self.failureBlock = failureBlock;
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request
                                            completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                if (!error) {
                                                    NSError *serializatioError = nil;
                                                    NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                       options:NSJSONReadingAllowFragments error:&serializatioError];
                                                    if(!serializatioError) {
                                                        [self buildProductsFromResponseDictionary:responseDictionary[@"results"]];
                                                    }
                                                    else {
                                                        failureBlock(serializatioError);
                                                    }
                                                }
                                                else {
                                                    failureBlock(error);
                                                }
        
    }];
    
    [task resume];
}

- (void)buildProductsFromResponseDictionary:(NSArray *)response {
    
    __block NSMutableArray *products = [NSMutableArray array];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        for (NSDictionary *dictionary in response) {
            Product *product = [[Product alloc] initWithDictionary:dictionary];
            [products addObject:product];
        }
        dispatch_async(dispatch_get_main_queue(), ^{
            self.successBlock(products);
        });
    });
}

@end
