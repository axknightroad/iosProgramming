//
//  exericises2-10.m
//  RandomItems
//
//  Created by Axel Han on 15/12/27.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRContainer.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //NSMutableArray *items = [[NSMutableArray alloc] init];
        BNRContainer *con1 = [BNRContainer randomContainer];
        BNRContainer *con2 = [BNRContainer randomContainer];
        [con1 addContainer:con2];
        
        NSLog(@"%@", con2);
        NSLog(@"%@", con1);
        
        con2 = nil;
        con1 = nil;
        
        
    }
    return 0;
}
