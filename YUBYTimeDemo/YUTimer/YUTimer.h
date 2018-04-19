//
//  YUTimer.h
//  MasonryDemo
//
//  Created by yu on 2018/3/16.
//  Copyright © 2018年 yu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface YUTimer : NSObject
/**
 初始化加开始

 @param timeNum 循环时间
 @param block 循环方法
 */
- (void)startTimerWithSpace:(float)timeNum block:(void(^)(BOOL))block;


/**
 恢复
 */
- (void)resume;

/**
 暂停
 */
- (void)suspend;


/**
 关闭
 */
- (void)stopTimer;

@end
