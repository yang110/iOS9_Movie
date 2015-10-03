//
//  DataService.h
//  HWmovie
//
//  Created by Mac on 15/7/21.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import <Foundation/Foundation.h>
typedef void(^BlcokType) (id result);

@interface DataService : NSObject
+ (id)loadData1:(NSString *)string;
+ (id)loadData:(NSString *)string;

+(void)requestAFUrl:(NSString *)urlString
         httpMethod:(NSString *)method
             params:(NSMutableDictionary *)params
              datas:(NSMutableDictionary *)dicData
              block:(BlcokType)block;


@end
