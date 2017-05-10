//
//  ViewController.m
//  test
//
//  Created by jian on 2017/3/8.
//  Copyright © 2017年 jian. All rights reserved.
//

#import "ViewController.h"
#import "TPExIdentityCardOCR.h"
#import "KxMenu.h"

#import "RCAnimatedImagesView.h"
@interface ViewController ()



@property(strong, nonatomic) RCAnimatedImagesView *animatedImagesView;
@end

@implementation ViewController
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
   // [self.animatedImagesView startAnimating];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
   // [self.animatedImagesView stopAnimating];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//    
//    self.animatedImagesView = [[RCAnimatedImagesView alloc]
//                               initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width,
//                                                        self.view.bounds.size.height)];
//    [self.view addSubview:self.animatedImagesView];
//      self.animatedImagesView.delegate = self;
//    
//    UIBarButtonItem *btn = [[UIBarButtonItem alloc]initWithTitle:@"add" style:UIBarButtonItemStylePlain target:self action:@selector(showMenu:)];
//    
//    self.navigationItem.rightBarButtonItem =btn;
    // Do any additional setup after loading the view, typically from a nib.
//    TPExIdentityCardOCR *iDentifyOCR = [[TPExIdentityCardOCR alloc ] initWith:self];
//    [iDentifyOCR passValue:^(NSString *data) {
//       NSLog(@"datadatadatadatadata%@", data) ;
//    } ];
//    
//    iDentifyOCR.bFront = @"YES";
//    [iDentifyOCR  start];
    //[self formatTime:@"ee---ttttT.TTT:ff.f"];
    
//    NSString *string = @"hvbvv  yyyyyy";
//    
//    NSString *cString = [[string
//                          stringByTrimmingCharactersInSet:[NSCharacterSet
//                                                           whitespaceAndNewlineCharacterSet]]
//                         uppercaseString];
//    
//    NSLog(@"==== %@",cString);

}

//- (NSUInteger)animatedImagesNumberOfImages:
//(RCAnimatedImagesView *)animatedImagesView {
//    return 2;
//}
//
//- (UIImage *)animatedImagesView:(RCAnimatedImagesView *)animatedImagesView
//                   imageAtIndex:(NSUInteger)index {
//    return [UIImage imageNamed:@"20170302我的绑定_spec-1"];
//}

  

- (void)showMenu:(UIButton *)sender {
    
    
    
    
    
    
    /*
    NSArray *menuItems = @[
                           
                           [KxMenuItem menuItem:@"发起聊天"
                                          image:[UIImage imageNamed:@"startchat_icon"]
                                         target:self
                                         action:@selector(pushChat:)],
                           
                           [KxMenuItem menuItem:@"创建群组"
                                          image:[UIImage imageNamed:@"creategroup_icon"]
                                         target:self
                                         action:@selector(pushContactSelected:)],
                           
                           [KxMenuItem menuItem:@"添加好友"
                                          image:[UIImage imageNamed:@"addfriend_icon"]
                                         target:self
                                         action:@selector(pushAddFriend:)],
#if RCDDebugTestFunction
                           [KxMenuItem menuItem:@"创建讨论组"
                                          image:[UIImage imageNamed:@"addfriend_icon"]
                                         target:self
                                         action:@selector(pushToCreateDiscussion:)],
#endif
                           ];
    
    UIBarButtonItem *rightBarButton = self.tabBarController.navigationItem.rightBarButtonItems[1];
    CGRect targetFrame = rightBarButton.customView.frame;
    targetFrame.origin.y = targetFrame.origin.y + 15;
    [KxMenu setTintColor:[UIColor redColor]];
    [KxMenu setTitleFont:[UIFont systemFontOfSize:17]];
    [KxMenu showMenuInView:self.view
                  fromRect:targetFrame
                 menuItems:menuItems];
     
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(NSString *)formatTime:(NSString *)updateAt
{
    NSString *str1 =
    [updateAt stringByReplacingOccurrencesOfString:@"-" withString:@"/"];
    NSLog(@"==== %@",str1);
    NSString *str2 =
    [str1 stringByReplacingOccurrencesOfString:@"T" withString:@"/"];
    NSLog(@"==vvvv== %@",str2);
    
    NSString *str3 =
    [str2 stringByReplacingOccurrencesOfString:@":" withString:@"/"];
      NSLog(@"==vvvdddv== %@",str3);
    
    NSMutableString *str = [[NSMutableString alloc] initWithString:str3];
    NSString *point = @".";
    if ([str rangeOfString:point].location != NSNotFound) {
        
        NSRange rang = [updateAt rangeOfString:point];
 
        [str deleteCharactersInRange:NSMakeRange(rang.location,
                                                 str.length - rang.location)];
    }
     NSLog(@"==str= %@",str);
    return str;
}


@end
