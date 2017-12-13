//
//  HTBarModel.h
//  CustomTabBar
//
//  Created by shuai pan on 2017/5/11.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTBarModel : NSObject

@property (nonatomic ,strong) NSString *title;
@property (nonatomic ,strong) NSString *normal;
@property (nonatomic ,strong) NSString *select;


- (instancetype)initWithDictionary:(NSDictionary *)dict ;

@end

@interface HTBarModelTool : NSObject

/** 批量生产barItem
 *  sourceFile：资源配置文件
 */

+ (NSArray *)massProductionWithHTBarModels:(NSString *)sourceFile ;


@end
