//
//  JAFWeakTimer.m
//  FaceApp
//
//  Created by admin on 2017/9/26.
//  Copyright © 2017年 JXTYCompny. All rights reserved.
//

#import "JAFWeakTimer.h"

@interface JAFWeakTimerTarget : NSObject
@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) NSTimer* timer;
@end

@implementation JAFWeakTimerTarget

-(void)fire:(NSTimer*)timer{
    
    if(self.target){
        [self.target performSelector:self.selector withObject:timer.userInfo afterDelay:0.0f inModes:@[NSRunLoopCommonModes]];
    }else{
        [self.timer invalidate];
        self.timer = nil;
    }
}

@end

@implementation JAFWeakTimer
+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                    target:(id)aTarget
                                  selector:(SEL)aSelector
                                  userInfo:(id)userInfo
                                   repeats:(BOOL)repeats{
    JAFWeakTimerTarget* timerTarget = [[JAFWeakTimerTarget alloc] init];
    timerTarget.target = aTarget;
    timerTarget.selector = aSelector;
    timerTarget.timer = [NSTimer scheduledTimerWithTimeInterval:interval
                                                         target:timerTarget
                                                       selector:@selector(fire:)
                                                       userInfo:userInfo
                                                        repeats:repeats];
    [[NSRunLoop currentRunLoop] addTimer:timerTarget.timer forMode:NSRunLoopCommonModes];
    return timerTarget.timer;
}

@end
