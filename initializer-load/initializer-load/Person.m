//
//  Person.m
//  initializer-load
//
//  Created by apple on 2018/2/1.
//  Copyright © 2018年 yangchao. All rights reserved.
//

#import "Person.h"

@implementation Person


+(void)load{
    NSLog(@"%s",__func__);
}

+(void)initialize{
    NSLog(@"%s %@",__func__ ,[self class]);
}

-(instancetype)init{
    if (self=[super init]) {
        NSLog(@"%s",__func__);
    }
    return self;
}

@end
