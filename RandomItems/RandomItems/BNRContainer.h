//
//  BNRContainer.h
//  RandomItems
//
//  Created by Axel Han on 15/12/18.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"

@interface BNRContainer : BNRItem

@property (nonatomic, strong) NSMutableArray *subitems;
@property NSInteger totValue;

+ (instancetype)randomContainer;

- (instancetype)initWithBNRItem:(BNRItem *)item;
- (void)addItem:(BNRItem *)item;
- (void)addContainer:(BNRContainer *)container;

@end
