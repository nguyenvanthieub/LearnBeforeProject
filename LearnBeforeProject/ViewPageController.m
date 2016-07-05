//
//  ViewPageController.m
//  LearnBeforeProject
//
//  Created by  on 7/5/16.
//  Copyright © 2016 thieumao. All rights reserved.
//

#import "ViewPageController.h"

@interface ViewPageController ()

@property (weak, nonatomic) IBOutlet UIView *viewHand;
@property (weak, nonatomic) IBOutlet UIView *viewRed;
@property (weak, nonatomic) IBOutlet UIView *viewYellow;
@property (weak, nonatomic) IBOutlet UIView *viewBlue;

@end

@implementation ViewPageController

CGFloat _width;
CGFloat _height;
int _position;
CGRect _prePosition;
CGRect _currentPosition;
CGRect _nextPosition;
bool _isShow;
//CGRect _nonePosition;

- (void)viewDidLoad {
    [super viewDidLoad];
    CGSize screenSize = [UIScreen mainScreen].bounds.size;
    _width = screenSize.width;
    _height = screenSize.height / 4;
    _position = 1;
    _prePosition = CGRectMake(-_width, 0, _width, _height);
    _currentPosition = CGRectMake(0, 0, _width, _height);
    _nextPosition = CGRectMake(_width, 0, _width, _height);
    _isShow = YES;
//    _nonePosition = CGRectMake(0, -_height, _width, _height);
}

- (void)viewDidAppear:(BOOL)animated {
    [self initial];
}

- (void)initial {
    self.viewYellow.frame = _prePosition;
    self.viewRed.frame = _currentPosition;
    self.viewBlue.frame = _nextPosition;
    self.viewHand.frame = _currentPosition;
    [self handEvent];
}

- (void)handEvent {
    // click event
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    // double click
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
    // to right
    UISwipeGestureRecognizer *swipeRightOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToRightWithGestureRecognizer:)];
    swipeRightOrange.direction = UISwipeGestureRecognizerDirectionRight;
    // to left
    UISwipeGestureRecognizer *swipeLeftOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToLeftWithGestureRecognizer:)];
    swipeLeftOrange.direction = UISwipeGestureRecognizerDirectionLeft;
    // to up
    UISwipeGestureRecognizer *swipeUpOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToUpWithGestureRecognizer:)];
    swipeUpOrange.direction = UISwipeGestureRecognizerDirectionUp;
    // to down
    UISwipeGestureRecognizer *swipeDownOrange = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(slideToDownWithGestureRecognizer:)];
    swipeDownOrange.direction = UISwipeGestureRecognizerDirectionDown;
    // add gesture recognizer
    [self.viewHand addGestureRecognizer:singleTapGestureRecognizer];
    [self.viewHand addGestureRecognizer:doubleTapGestureRecognizer];
    [self.viewHand addGestureRecognizer:swipeRightOrange];
    [self.viewHand addGestureRecognizer:swipeLeftOrange];
    [self.viewHand addGestureRecognizer:swipeUpOrange];
    [self.viewHand addGestureRecognizer:swipeDownOrange];
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"Click");
}

-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"Double click");
}

- (void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Right");
    if (_isShow) {
        [UIView animateWithDuration:0.5 animations:^{
            self.viewRed.frame = CGRectOffset(self.viewRed.frame, _width, 0.0);
            self.viewYellow.frame = CGRectOffset(self.viewYellow.frame, _width, 0.0);
            self.viewBlue.frame = CGRectOffset(self.viewBlue.frame, _width, 0.0);
        }];
        _position--;
        if (_position < 0) {
            _position = 2;
        }
        switch (_position) {
            case 0:
                self.viewBlue.frame = _prePosition;
                break;
            case 1:
                self.viewYellow.frame = _prePosition;
                break;
            case 2:
                self.viewRed.frame = _prePosition;
                break;
        }
    }
}


- (void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Left");
    if (_isShow) {
        [UIView animateWithDuration:0.5 animations:^{
            self.viewRed.frame = CGRectOffset(self.viewRed.frame, -_width, 0.0);
            self.viewYellow.frame = CGRectOffset(self.viewYellow.frame, -_width, 0.0);
            self.viewBlue.frame = CGRectOffset(self.viewBlue.frame, -_width, 0.0);
        }];
        _position++;
        if (_position > 2) {
            _position = 0;
        }
        switch (_position) {
            case 0:
                self.viewRed.frame = _nextPosition;
                break;
            case 1:
                self.viewBlue.frame = _nextPosition;
                break;
            case 2:
                self.viewYellow.frame = _nextPosition;
                break;
        }
    }
}

- (void)slideToUpWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Up");
    if (_isShow) {
        [UIView animateWithDuration:0.5 animations:^{
            self.viewYellow.frame = CGRectOffset(self.viewYellow.frame, 0, -_height);
            self.viewRed.frame = CGRectOffset(self.viewRed.frame, 0, -_height);
            self.viewBlue.frame = CGRectOffset(self.viewBlue.frame, 0, -_height);
        }];
        _isShow = NO;
    }
}

- (void)slideToDownWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Down");
    if (!_isShow) {
        [UIView animateWithDuration:0.5 animations:^{
            self.viewYellow.frame = CGRectOffset(self.viewYellow.frame, 0, _height);
            self.viewRed.frame = CGRectOffset(self.viewRed.frame, 0, _height);
            self.viewBlue.frame = CGRectOffset(self.viewBlue.frame, 0, _height);
        }];
        _isShow = YES;
    }
}

@end
