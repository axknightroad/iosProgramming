//
//  BNRHypnosisViewController.m
//  HypnoNerd
//
//  Created by Axel Han on 16/1/8.
//  Copyright © 2016年 Axel Han. All rights reserved.
//

#import "BNRHypnosisViewController.h"
#import "BNRHypnosisView.h"

@implementation BNRHypnosisViewController

- (void)loadView {
    // 创建一个 BNRHypnosisView 对象
    BNRHypnosisView *backgroundView = [[BNRHypnosisView alloc] init];
    
    // 将 BNRHypnosisView 对象赋给视图控制器的view属性
    self.view = backgroundView;
}

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        self.tabBarItem.title = @"Hypnotize";
        
        UIImage *i = [UIImage imageNamed:@"Hypno.png"];
        self.tabBarItem.image = i;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"BNRhypnosisViewController loaded its view");
    // 创建一个 UISegmentedControl 对象
    NSArray *segmentedArray = @[@"Red", @"Green", @"Blue"];
    CGRect segRect = CGRectMake(40, 40, 150, 20);
    UISegmentedControl *sc = [[UISegmentedControl alloc] initWithItems:segmentedArray];
    sc.momentary = YES;
    sc.frame = segRect;
    
    [self.view addSubview:sc];
    [sc addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
}

- (void)segmentAction:(UISegmentedControl *)Seg{
    
    NSInteger Index = Seg.selectedSegmentIndex;
    
    NSLog(@"Index %i", Index);
    
    BNRHypnosisView *hv = self.view;
    
    switch (Index) {
            
        case 0:
            
            [hv setCircleColor:[UIColor redColor]];
            
            break;

        case 1:
            
            [hv setCircleColor:[UIColor greenColor]];
            
            break;
            
        case 2:
            
            [hv setCircleColor:[UIColor blueColor]];
            
            break;
            
        default:
            
            break;
            
    }
    
}

@end
