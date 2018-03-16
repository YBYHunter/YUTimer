//
//  YUTimer.m
//  MasonryDemo
//
//  Created by yu on 2018/3/16.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "YUTimer.h"

@interface YUTimer ()

@property (nonatomic,strong) dispatch_source_t timer;

@property (nonatomic,strong) dispatch_semaphore_t lock;

@end

@implementation YUTimer

- (void)startTimerWithSpace:(float)timeNum block:(void(^)(BOOL))block {
    dispatch_time_t start = dispatch_walltime(NULL, (int64_t)(0.0 * NSEC_PER_SEC));
    uint64_t interval = (uint64_t)(timeNum * NSEC_PER_SEC);
    dispatch_source_set_timer(self.timer, start, interval, 0);
    dispatch_source_set_event_handler(self.timer, ^{
        if (block) {
            block(YES);
        }
    });
    [self resume];
}

- (void)resume {
    dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);
    if (self.timer) {
        dispatch_resume(self.timer);
    }
    dispatch_semaphore_signal(self.lock);
}

- (void)suspend {
    dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);
    if (self.timer) {
        dispatch_suspend(self.timer);
    }
    dispatch_semaphore_signal(self.lock);
}

- (void)stopTimer {
    dispatch_semaphore_wait(self.lock, DISPATCH_TIME_FOREVER);
    if (self.timer) {
        dispatch_cancel(self.timer);
    }
    dispatch_semaphore_signal(self.lock);
}


- (void)dealloc {
    NSLog(@" ----- dealloc -----------");
}


#pragma mark - getter

- (dispatch_source_t)timer {
    if (_timer == nil) {
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT,0);
        _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    }
    return _timer;
}

- (dispatch_semaphore_t)lock {
    if (_lock == nil) {
        //线程加锁
        _lock = dispatch_semaphore_create(1);
    }
    return _lock;
}






@end
