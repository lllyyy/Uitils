////
////  UINavigation.m
////  test
////
////  Created by 卢杨 on 17/3月/3.
////  Copyright © 2017年 jian. All rights reserved.
////
//
//#import "UINavigation.h"
//
//@implementation UINavigation
//
////设置NavigationBar背景颜色
//[[UINavigationBar appearance] setBarTintColor:[UIColor redColor]];
//
//// 通过富文本设置title 样式（这里也可以通过自定义Label，然后设置 titleView 来实现）
//[[UINavigationBar appearance] setTitleTextAttributes:@{
//                                                       NSForegroundColorAttributeName : [UIColor whiteColor]
//                                                       }];
//
//// 设置状态栏格式，如果 NavigationBar 为深色调，就设置为 UIBarStyleBlack，则状态栏显示为白色
//[[UINavigationBar appearance] setBarStyle:UIBarStyleBlack];
//
// 实现 NavigationBar 透明效果
//实现透明可能大家第一个想到的是 设置 alpha 值，但是由于设置了作为父控件的 NavigationBar 的透明度后，其子控件 BarButtonItem 也会随之改变，因此想要实现导航栏透明，但是 BarButtonItem 正常显示（类似 手机QQ 的好友动态页），可以采用下面的方法
//// 设置一个空的图片背景图片，就能实现导航栏透明但是 BarButtonItem 正常显示
//[self.navigationController.navigationBar setBackgroundImage:[UIImage new]
//                                              forBarMetrics:UIBarMetricsDefault];
//// 设置一个空的 shadowImage 来实现
//self.navigationController.navigationBar.shadowImage = [UIImage new];
//
//@end
