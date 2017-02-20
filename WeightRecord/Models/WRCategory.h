//
//  WRCategory.h
//  WeightRecord
//
//  Created by Casey Yost on 2/5/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

#import "WRNode.h"

NS_ASSUME_NONNULL_BEGIN
@interface WRCategory : WRNode
@property (nonatomic) NSMutableArray *subnodes;
@end
NS_ASSUME_NONNULL_END
