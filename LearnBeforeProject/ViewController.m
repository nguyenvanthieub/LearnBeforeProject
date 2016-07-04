//
//  ViewController.m
//  LearnBeforeProject
//
//  Created by  on 7/4/16.
//  Copyright © 2016 thieumao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIView *viewAlert;
@property (weak, nonatomic) IBOutlet UIView *slideMenu;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // click event
    UITapGestureRecognizer *singleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleSingleTapGesture:)];
    [self.viewAlert addGestureRecognizer:singleTapGestureRecognizer];
    // double click
    UITapGestureRecognizer *doubleTapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleDoubleTapGesture:)];
    doubleTapGestureRecognizer.numberOfTapsRequired = 2;
//    doubleTapGestureRecognizer.numberOfTouchesRequired = 2;
    [self.viewAlert addGestureRecognizer:doubleTapGestureRecognizer];
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
    [self.viewAlert addGestureRecognizer:swipeRightOrange];
    [self.viewAlert addGestureRecognizer:swipeLeftOrange];
    [self.viewAlert addGestureRecognizer:swipeUpOrange];
    [self.viewAlert addGestureRecognizer:swipeDownOrange];
}

- (void)handleSingleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"Click");
}

-(void)handleDoubleTapGesture:(UITapGestureRecognizer *)tapGestureRecognizer{
    NSLog(@"Double click");
}

- (void)slideToRightWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Right");
    [UIView animateWithDuration:0.5 animations:^{
        self.slideMenu.frame = CGRectOffset(self.slideMenu.frame, 320.0, 0.0);
    }];
}


- (void)slideToLeftWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Left");
    [UIView animateWithDuration:0.5 animations:^{
        self.slideMenu.frame = CGRectOffset(self.slideMenu.frame, -320.0, 0.0);
    }];
}

- (void)slideToUpWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Up");
}

- (void)slideToDownWithGestureRecognizer:(UISwipeGestureRecognizer *)gestureRecognizer{
    NSLog(@"Down");
}

@end
