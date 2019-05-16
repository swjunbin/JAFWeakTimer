//
//  JAFWeakTimer.h
//  FaceApp
//
//  Created by admin on 2017/9/26.
//  Copyright © 2017年 JXTYCompny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JAFWeakTimer : NSObject
+(NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(id)userInfo
                                     repeats:(BOOL)repeats;
@end
