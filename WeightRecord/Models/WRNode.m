//
//  WRNode.m
//  WeightRecord
//
//  Created by Casey Yost on 2/1/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

#import "WRNode.h"

#include <objc/objc-runtime.h>

@implementation WRNode

+ (instancetype)nodeFromDictionary:(NSDictionary *)dictionary
{
    NSString *className = dictionary[@"Class"];
    Class c = NSClassFromString(className);
    WRNode *newNode = [[c alloc] initWithDictionary:dictionary];
    return newNode;
}

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(self)
    {
        self.name = dictionary[@"name"];
    }
    return self;
}

- (NSMutableDictionary *)serializeToDictionary
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]
                                 initWithObjects:@[NSStringFromClass([self class])]
                                 forKeys:@[@"Class"]];
    
    dict[@"name"] = _name;
    
    return dict;
}


@end
