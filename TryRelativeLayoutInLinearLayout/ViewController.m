//
//  ViewController.m
//  TryRelativeLayoutInLinearLayout
//
//  Created by Elvis Lee on 2018/7/3.
//  Copyright © 2018 Elvis Lee. All rights reserved.
//

#import "ViewController.h"
#import <MyLayout/MyLayout.h>

@interface ViewController ()

@property (strong, nonatomic) MyLinearLayout *contentLayout;

@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    MyLinearLayout *contentLayout = [MyLinearLayout linearLayoutWithOrientation:MyOrientation_Vert];
    contentLayout.myHorzMargin = 0;
    contentLayout.heightSize.lBound(self.view.heightSize, 10, 1);
    contentLayout.gravity = MyGravity_Horz_Fill;

    [self.scrollView addSubview:contentLayout];
    self.contentLayout = contentLayout;

    UIView *redView = [UIView new];
    redView.backgroundColor = UIColor.redColor;
    redView.myHeight = 100;
    [self.contentLayout addSubview:redView];

    MyRelativeLayout *yellowRelativeLayout = [MyRelativeLayout new];

    yellowRelativeLayout.backgroundColor = UIColor.yellowColor;
    yellowRelativeLayout.wrapContentHeight = YES;

    UIView *blueView = [UIView new];
    blueView.backgroundColor = UIColor.blueColor;
    blueView.topPos.equalTo(yellowRelativeLayout.topPos).offset(10);
    blueView.leftPos.equalTo(yellowRelativeLayout.leftPos).offset(20);
    blueView.rightPos.equalTo(yellowRelativeLayout.rightPos).offset(30);
    blueView.bottomPos.equalTo(yellowRelativeLayout.bottomPos).offset(40);

    yellowRelativeLayout.myHeight = 200;
//    blueView.heightSize.equalTo(@60);

//  comment line #51, uncomment line #52, yellowRelativeLayout 高度應該要是110,
//  但render完yellowRelativeLayout的高度卻是50 (應該是top offset 10 + bottomOffset 40)
//  完全看不到blueView

    [yellowRelativeLayout addSubview:blueView];

    [self.contentLayout addSubview:yellowRelativeLayout];
}



@end
