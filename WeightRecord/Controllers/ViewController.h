//
//  ViewController.h
//  WeightRecord
//
//  Created by Casey Yost on 2/1/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

@class WRNode;

NS_ASSUME_NONNULL_BEGIN

@interface ViewController : UITableViewController
@property (nonatomic) NSArray <WRNode *> *nodes;
- (instancetype)initWithNodes:(NSArray <WRNode*> *)nodes;
@end

NS_ASSUME_NONNULL_END
