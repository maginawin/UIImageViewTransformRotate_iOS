//
//  ViewController.m
//  testRotation
//
//  Created by maginawin on 14-11-21.
//  Copyright (c) 2014年 mycj.wwd. All rights reserved.
//

#import "ViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController ()

@end

@implementation ViewController
CGFloat temp;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self image:_imageView rotatedByRadians:45];
    temp = 0.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//UIImage的旋转方法
- (void)image:(UIImageView*)image rotatedByRadians:(CGFloat)radians{
    CGFloat width = image.bounds.size.width;
    CGFloat height = image.bounds.size.height;
    CGFloat radius = width / 2;
    CGFloat everyJaiodu = 2 * M_PI / 360;
    CGFloat ra = everyJaiodu * radians;
    //定义一个执行旋转的CGAffineTransform结构体
    CGAffineTransform t = CGAffineTransformMakeRotation(ra);
    _imageView.transform = t;
}

//layer的旋转方法
- (void)image:(UIImageView*)image zhuan:(CGFloat)rad{
    
    CABasicAnimation* anim = [CABasicAnimation animationWithKeyPath:@"transform"]; //创建动画
    CATransform3D fromValue1 = image.layer.transform;
    anim.fromValue = [NSValue valueWithCATransform3D:fromValue1]; //设置动画开始的属性值
    
    CGFloat width = image.bounds.size.width;
    CGFloat height = image.bounds.size.height;
    CGFloat radius = width / 2;
    CGFloat everyJaiodu = M_PI / 180;
    CGFloat ra = everyJaiodu * rad; //根据传入角度算出的弧度(一个圆的弧度是2pi)
    
//    image.layer.transform = CATransform3DMakeRotation(ra, 0, 0, 1);
    
    //绕z轴旋转了rad度,这个是旋转到那个位置
    CATransform3D toValue1 = CATransform3DMakeRotation(ra, 0, 0, 1);
    
    //绕z轴旋转了rad度,这个是在基础上添加角度
//    CATransform3D toValue1 = CATransform3DRotate(fromValue1, rad * everyJaiodu, 0, 0, 1);
    
    anim.toValue = [NSValue valueWithCATransform3D:toValue1]; //设置动画结束时的属性
    anim.duration = 0.5f;
    image.layer.transform = toValue1;
    anim.removedOnCompletion = YES;
    [image.layer addAnimation:anim forKey:nil]; //为image.layer添加动画
}

- (IBAction)testClick:(id)sender {
    temp += 10;
    //    [self image:_imageView rotatedByRadians:temp];
    //    [self image:_imageView zhuan:10];
    [self image:_imageView zhuan:temp];
}

@end
