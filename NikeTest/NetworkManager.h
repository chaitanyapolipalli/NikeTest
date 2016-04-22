//
//  NetworkManager.h
//  NikeTest
//
//  Created by Chaitanya on 4/21/16.
//  Copyright © 2016 Chaitanya. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NetworkManager : NSObject

- (void)productsFromURL:(NSString *)urlString
           successBlock:(void(^)(NSArray *))successBlock
           faulureBlock:(void(^)(NSError *))failureBlock;

@end
