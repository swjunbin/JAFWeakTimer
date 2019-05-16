//
//  JAFFirstController.m
//  JAFWeakTimerDemo
//
//  Created by 张俊彬 on 2019/5/16.
//  Copyright © 2019 Jamfer.iOSCoder. All rights reserved.
//

#import "JAFFirstController.h"
#import "JAFSecondController.h"

@interface JAFFirstController ()

@end

@implementation JAFFirstController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"firstController";
    
    UIBarButtonItem* rightBar = [[UIBarButtonItem alloc] initWithTitle:@"Push" style:UIBarButtonItemStylePlain target:self action:@selector(pushSecond)];
    self.navigationItem.rightBarButtonItem = rightBar;
}

#pragma mark - Action

-(void)pushSecond{
    JAFSecondController* secondC = [[JAFSecondController alloc] init];
    [self.navigationController pushViewController:secondC animated:YES];
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
