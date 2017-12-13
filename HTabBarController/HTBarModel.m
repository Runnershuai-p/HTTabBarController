//
//  HTBarModel.m
//  CustomTabBar
//
//  Created by shuai pan on 2017/5/11.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import "HTBarModel.h"

@implementation HTBarModel
- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

@end
@implementation HTBarModelTool

+ (NSArray *)massProductionWithHTBarModels:(NSString *)sourceFile {
    NSMutableArray *workshop = [NSMutableArray arrayWithCapacity:2];
    NSArray *plist = [[NSArray alloc] initWithContentsOfFile:sourceFile];
    for (NSDictionary *dict in plist) {
        HTBarModel *model = [[HTBarModel alloc] initWithDictionary:dict];
        [workshop addObject:model];
    }
    return workshop;
}


@end
