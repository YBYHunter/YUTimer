//
//  ViewController.m
//  YUBYTimeDemo
//
//  Created by yu on 2018/4/16.
//  Copyright © 2018年 yu. All rights reserved.
//

#import "ViewController.h"
#import "YUTimer.h"

@interface ViewController ()

@property (nonatomic, strong) UIButton * startButton;

@property (nonatomic, strong) UIButton * resumeButton;

@property (nonatomic, strong) UIButton * suspendButton;

@property (nonatomic, strong) UIButton * stopButton;

@property (nonatomic, strong) UILabel * timeLabel;

@property (nonatomic, strong) YUTimer * timer;

@property (nonatomic, assign) NSInteger currentEditStatusTime;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    // Do any additional setup after loading the view, typically from a nib.
    [self.view addSubview:self.startButton];
    [self.view addSubview:self.resumeButton];
    [self.view addSubview:self.suspendButton];
    [self.view addSubview:self.stopButton];
    [self.view addSubview:self.timeLabel];
    
//    __weak __typeof(self)weakSelf = self;
//    [self.timer startTimerWithSpace:1 block:^(BOOL result) {
//        weakSelf.currentEditStatusTime++;
//        weakSelf.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)weakSelf.currentEditStatusTime];
//    }];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat buttonWidth = 64;
    CGFloat spaceValue = (screenWidth - (buttonWidth * 4))/5;
    
    self.startButton.frame = CGRectMake(spaceValue, 100, buttonWidth, 44);
    self.resumeButton.frame = CGRectMake(spaceValue * 2 + buttonWidth, 100, buttonWidth, 44);
    self.suspendButton.frame = CGRectMake(spaceValue * 3 + buttonWidth * 2, 100, buttonWidth, 44);
    self.stopButton.frame = CGRectMake(spaceValue * 4 + buttonWidth * 3, 100, buttonWidth, 44);
    
    self.timeLabel.frame = CGRectMake(0, 100 + 64 + 44, screenWidth, self.timeLabel.font.lineHeight);
    self.timeLabel.text = @"0";
}

- (void)startButtonAction {
    _currentEditStatusTime = 0;
    __weak __typeof(self)weakSelf = self;
    [self.timer startTimerWithSpace:1 block:^(BOOL result) {
        weakSelf.currentEditStatusTime++;
        weakSelf.timeLabel.text = [NSString stringWithFormat:@"%ld",(long)weakSelf.currentEditStatusTime];
    }];
}

- (void)resumeButtonAction {
    [self.timer resume];
}

- (void)suspendButtonAction {
    [self.timer suspend];
}

- (void)stopButtonAction {
    [self.timer stopTimer];
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    ViewController * next = [[ViewController alloc] init];
    [self presentViewController:next animated:YES completion:nil];
}

#pragma mark - getter

- (UIButton *)startButton {
    if (_startButton == nil) {
        _startButton = [[UIButton alloc] init];
        [_startButton setTitle:@"开启" forState:UIControlStateNormal];
        [_startButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _startButton.layer.borderWidth = 1;
        _startButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_startButton addTarget:self action:@selector(startButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _startButton;
}


- (UIButton *)resumeButton {
    if (_resumeButton == nil) {
        _resumeButton = [[UIButton alloc] init];
        [_resumeButton setTitle:@"恢复" forState:UIControlStateNormal];
        [_resumeButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _resumeButton.layer.borderWidth = 1;
        _resumeButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_resumeButton addTarget:self action:@selector(resumeButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _resumeButton;
}

- (UIButton *)suspendButton {
    if (_suspendButton == nil) {
        _suspendButton = [[UIButton alloc] init];
        [_suspendButton setTitle:@"暂停" forState:UIControlStateNormal];
        [_suspendButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _suspendButton.layer.borderWidth = 1;
        _suspendButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_suspendButton addTarget:self action:@selector(suspendButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _suspendButton;
}


- (UIButton *)stopButton {
    if (_stopButton == nil) {
        _stopButton = [[UIButton alloc] init];
        [_stopButton setTitle:@"关闭" forState:UIControlStateNormal];
        [_stopButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _stopButton.layer.borderWidth = 1;
        _stopButton.layer.borderColor = [UIColor blackColor].CGColor;
        [_stopButton addTarget:self action:@selector(stopButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _stopButton;
}

- (UILabel *)timeLabel {
    if (_timeLabel == nil) {
        _timeLabel = [[UILabel alloc] init];
        _timeLabel.textColor = [UIColor blackColor];
        _timeLabel.font = [UIFont systemFontOfSize:17];
        _timeLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _timeLabel;
}

- (YUTimer *)timer {
    if (_timer == nil) {
        _timer = [[YUTimer alloc] init];
    }
    return _timer;
}
















- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
