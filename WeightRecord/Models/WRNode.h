//
//  WRNode.h
//  WeightRecord
//
//  Created by Casey Yost on 2/1/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

NS_ASSUME_NONNULL_BEGIN
@interface WRNode : NSObject
@property (nonatomic, copy) NSString *name;

+ (instancetype)nodeFromDictionary:(NSDictionary *)dictionary;
- (instancetype)initWithDictionary:(NSDictionary *)dictionary;
- (NSMutableDictionary *)serializeToDictionary;
@end
NS_ASSUME_NONNULL_END
