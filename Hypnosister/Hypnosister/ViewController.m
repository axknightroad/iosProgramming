//
//  ViewController.m
//  Hypnosister
//
//  Created by Axel Han on 15/12/29.
//  Copyright © 2015年 Axel Han. All rights reserved.
//

#import "ViewController.h"
#import "BNRHypnosisView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    /*
    CGRect firstFrame = self.view.bounds;
    BNRHypnosisView *firstView = [[BNRHypnosisView alloc] initWithFrame:firstFrame];
    
    [self.view addSubview:firstView];
     */
    
    // Create CGRects for frames
    CGRect screenRect = self.view.bounds;
    CGRect bigRect = screenRect;
    bigRect.size.width *= 2.0;
//    bigRect.size.height *= 2.0;
    
    // Create a screen-size scroll view and add it to the window
    UIScrollView *scrollview = [[UIScrollView alloc] initWithFrame:screenRect];
    [scrollview setPagingEnabled:YES];
    [self.view addSubview:scrollview];
    
    // Create a super-sized hypnosis view and add it to the scroll view
//    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:bigRect];
    
    // Create a screen-sized hypnosis view and add it to the scroll view
    BNRHypnosisView *hypnosisView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    
    [scrollview addSubview:hypnosisView];
    
    // Add a second screen-sized hypnosis view just off screen to the right
    screenRect.origin.x += screenRect.size.width;
    BNRHypnosisView *anotherView = [[BNRHypnosisView alloc] initWithFrame:screenRect];
    [scrollview addSubview:anotherView];
    
    // Tell the scroll view how big its content area is
    scrollview.contentSize = bigRect.size;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
