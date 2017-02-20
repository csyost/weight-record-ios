//
//  AppDelegate.h
//  WeightRecord
//
//  Created by Casey Yost on 2/1/17.
//  Copyright © 2017 Toasty. All rights reserved.
//

@class WRNode;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic) NSArray <WRNode *> *rootNodes;

@end

