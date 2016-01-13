//
//  BNRContainer.m
//  RandomItems
//
//  Created by Axel Han on 15/12/18.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "BNRContainer.h"

@implementation BNRContainer {
    NSInteger _totValue;
    NSMutableArray *_subitems;
}

@synthesize subitems = _subitems, totValue = _totValue;


+ (instancetype) randomContainer {
    //BNRItem *tempItem = [BNRItem randomItem];
    //BNRContainer *newContainer = [[self alloc] initWithBNRItem:tempItem];
    //tempItem = nil;
    BNRContainer *newContainer = [super randomItem];
    for (int i = 0; i < 3; i++) {
        BNRItem *randItem = [BNRItem randomItem];
        [newContainer addItem:randItem];
    }
    
    return newContainer;
}

- (void)addItem:(BNRItem *)item {
    [self.subitems addObject:item];
    self.totValue += item.valueInDollars;
}

- (void)addContainer:(BNRContainer *)container {
    [self.subitems addObject:container];
    self.totValue += container.totValue;
}

- (instancetype) initWithItemName:(NSString *)name valueInDollars:(int)value serialNumber:(NSString *)sNumber {
    self = [super initWithItemName:name
                    valueInDollars:value
                      serialNumber:sNumber];
    
    if (self) {
        _subitems = [[NSMutableArray alloc] init];
        _totValue = value;
    }
    
    return self;
}


- (instancetype) initWithBNRItem:(BNRItem *)item {
    NSString* name = item.itemName;
    name = [name stringByAppendingString:@" container"];
    return [self initWithItemName:name
                   valueInDollars:item.valueInDollars
                     serialNumber:item.serialNumber];
}

- (NSString *)description {
    NSMutableString *subItmesString = [[NSMutableString alloc] init];
    
    for (BNRItem *item in self.subitems) {
        [subItmesString appendFormat:@"     %@\n", item];
    }
    
    return [NSString stringWithFormat:
            @"%@ (%@): Self worth $%d, total worth $%ld, recoded on %@\n     Which contains:\n{\n%@}\n",
            self.itemName,
            self.serialNumber,
            self.valueInDollars,
            self.totValue,
            self.dateCreated,
            subItmesString];
    
    
}

@end
