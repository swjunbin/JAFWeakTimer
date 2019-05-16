# JAFWeakTimer
resolve circular references for iOS NSTimer

## 为什么需要？
1、在某些业务场景下，需要在controller中新增一个timer；  
2、但是这个timer并不能给出准确的invalidate的时机；  
3、单纯推出该controller并不能使timer自动release，因为timer被runloop持有；  
4、在controller的dealloc下invalidate timer也不能解决，因为timer被runloop持有，timer通过target持有了该controller，引起循环引用无法 release也就无法进入dealloc；  
5、后续iOS针对循环引用在iOS10.0以后给出了 + (NSTimer *)timerWithTimeInterval:(NSTimeInterval)interval repeats:(BOOL)repeats block:(void (^)(NSTimer *timer))block ，但是这个method首先仅支持iOS10.0以上，其次循环引用在某些业务使用下依旧存在；  

## JAFWeakTimer如何解决？

1、破坏timer持有target，timer被runloop持有的循环关系，从target下手，将target转移到另一个obj，使timer并不持有target为controller，这样便不会使controller release失败；  
2、将controller弱引用于JAFWeakTimer，在timer的执行method中判断controller是否release来决定是否invalidate；  

## 如何使用？

[JAFWeakTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(timerAction) userInfo:nil repeats:YES];  
