//
//  JAFSecondController.m
//  JAFWeakTimerDemo
//
//  Created by 张俊彬 on 2019/5/16.
//  Copyright © 2019 Jamfer.iOSCoder. All rights reserved.
//

#import "JAFSecondController.h"
#import "JAFWeakTimer.h"

@interface JAFSecondController ()

@end

@implementation JAFSecondController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"secondController";
    
    NSLog(@"timer begin");
    [JAFWeakTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}

#pragma mark - Action

-(void)timerAction{
    NSLog(@"timer keep running");
}

-(void)dealloc{
    NSLog(@"secondCroller release");
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
