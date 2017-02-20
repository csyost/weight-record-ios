//
//  WRCategory.m
//  WeightRecord
//
//  Created by Casey Yost on 2/5/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

#import "WRCategory.h"

@implementation WRCategory

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super initWithDictionary:dictionary];
    if(self)
    {
        NSArray <NSDictionary *> *arr = dictionary[@"subnodes"];
        _subnodes = [NSMutableArray arrayWithCapacity:arr.count];
        
        for(NSDictionary *dict in arr)
        {
            [_subnodes addObject:[WRNode nodeFromDictionary:dict]];
        }
    }
    return self;
}
@end
