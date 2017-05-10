//
//  VoiceRec.m
//  test
//
//  Created by E&P on 2017/4/25.
//  Copyright © 2017年 easipass. All rights reserved.
//

#import "VoiceRec.h"
#import "iflyMSC/iflyMSC.h"
#import "ISRDataHelper.h"
#define SICHUANESE  0;

@implementation VoiceRec
 


- (void)viewDidLoad {
    [super viewDidLoad];
    self.i = 0;
    
    self.textView = [[UITextView alloc]initWithFrame:CGRectMake(10, 80, self.view.frame.size.width - 20, 100)];
    self.textView.layer.borderColor = [UIColor redColor].CGColor;
    self.textView.layer.borderWidth = 1;
    self.textView.textColor = [UIColor yellowColor];
    [self.view addSubview:self.textView];
    
//    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 100, 100)];
//    [btn setTitle:@"语音" forState:UIControlStateNormal];
//    btn.backgroundColor = [UIColor lightGrayColor];
//    [btn addTarget:self action:@selector(btn) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:btn];
    
    
    self.voiceView1 = [PQVoiceInputView pgq_reateVoiceViewWithRect:CGRectMake(110, self.view.frame.size.height - 180, (self.view.frame.size.width - 110)/2, 150) voiceColor:[UIColor cyanColor] volumeColor:[UIColor redColor] title:@"按下说话" showType:1 hidden:^(PQVoiceInputView * _Nullable view, NSString * _Nullable text, NSInteger type) {
        NSLog(@"上滑");
    }];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(btn)];
  [self.voiceView1  addGestureRecognizer:tap];
    
    
    [self.view addSubview:self.voiceView1];
}

- (void)btn {
 
    if (self.i == 0) {
        [self.voiceView1 startCircleAnimation];
        self.i = 1;
        [self.voiceView1 updateTitle:@"正在聆听" textColor:[UIColor greenColor]];
    }else{
        [self.voiceView1 stopCircleAnimation];
        [self.voiceView1 updateTitle:@"按下说话" textColor:[UIColor orangeColor]];
        self.i = 0;
    }
    [self startRecWithView:self.view];
}

- (void)startRecWithView:(UIView *)view {
    if (_iFlySpeechRecognizer  == nil) {
        [self initRecognizerWithView:view];
    }
    
    [_iFlySpeechRecognizer cancel];
    
    //设置音频来源为麦克风
    [_iFlySpeechRecognizer setParameter:IFLY_AUDIO_SOURCE_MIC forKey:@"audio_source"];
    
    //设置听写结果格式为json
    [_iFlySpeechRecognizer setParameter:@"json" forKey:[IFlySpeechConstant RESULT_TYPE]];
    
    //保存录音文件，保存在sdk工作路径中，如未设置工作路径，则默认保存在library/cache下
    [_iFlySpeechRecognizer setParameter:@"asr.pcm" forKey:[IFlySpeechConstant ASR_AUDIO_PATH]];
    
   
    
    BOOL ret = [_iFlySpeechRecognizer startListening];
    
    if (ret) {
     // [self.voiceView1 stopCircleAnimation];
        
    }else{
       // [_popUpView showText: @"启动识别服务失败，请稍后重试"];//可能是上次请求未结束，暂不支持多路并发
    }
}

- (void)initRecognizerWithView:(UIView *)view {
    //单例模式，UI的实例
    if (_iFlySpeechRecognizer == nil) {
        _iFlySpeechRecognizer = [IFlySpeechRecognizer sharedInstance];
        
        [_iFlySpeechRecognizer setParameter:@"" forKey:[IFlySpeechConstant PARAMS]];
        
        //设置听写模式
        [_iFlySpeechRecognizer setParameter:@"iat" forKey:[IFlySpeechConstant IFLY_DOMAIN]];
        
    }
    _iFlySpeechRecognizer.delegate = self;
    
    if (_iFlySpeechRecognizer != nil) {
//        IATConfig *instance = [IATConfig sharedInstance];
        //设置最长录音时间
        [_iFlySpeechRecognizer setParameter:@"3000" forKey:[IFlySpeechConstant SPEECH_TIMEOUT]];
        //设置后端点
        [_iFlySpeechRecognizer setParameter:@"3000" forKey:[IFlySpeechConstant VAD_EOS]];
        //设置前端点
        [_iFlySpeechRecognizer setParameter:@"3000" forKey:[IFlySpeechConstant VAD_BOS]];
        //网络等待时间
        [_iFlySpeechRecognizer setParameter:@"20000" forKey:[IFlySpeechConstant NET_TIMEOUT]];
        
        //设置采样率，推荐使用16K
        [_iFlySpeechRecognizer setParameter:@"16000" forKey:[IFlySpeechConstant SAMPLE_RATE]];
//        if ([instance.language isEqualToString:[IATConfig chinese]]) {
//            //设置语言
//            [_iflyRecognizerView setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
//            //设置方言
//            [_iflyRecognizerView setParameter:instance.accent forKey:[IFlySpeechConstant ACCENT]];
//        }else if ([instance.language isEqualToString:[IATConfig english]]) {
//            //设置语言
//            [_iflyRecognizerView setParameter:instance.language forKey:[IFlySpeechConstant LANGUAGE]];
//        }
         [_iFlySpeechRecognizer setParameter:@"zh_cn" forKey:[IFlySpeechConstant LANGUAGE]];
        //设置是否返回标点符号
        [_iFlySpeechRecognizer setParameter:@"1" forKey:[IFlySpeechConstant ASR_PTT]];
        
    }

}

#pragma mark - IFlySpeechRecognizerDelegate
/**
 无界面，听写结果回调
 results：听写结果
 isLast：表示最后一次
 ****/
- (void) onResults:(NSArray *) results isLast:(BOOL)isLast
{
    
    NSMutableString *resultString = [[NSMutableString alloc] init];
    NSDictionary *dic = results[0];
   
    for (NSString *key in dic) {
     
        [resultString appendFormat:@"%@",key];
    }
    
    NSLog(@"======resultresult  %@----%@",self.textView.text,resultString);
    NSString * resultFromJson =  [ISRDataHelper stringFromJson:resultString];
    self.textView.text = [NSString stringWithFormat:@"%@%@",self.textView.text,  resultFromJson];
         
    if (self.textView.text.length > 0){
        [self.voiceView1 stopCircleAnimation];
        [self.voiceView1 updateTitle:@"按下说话" textColor:[UIColor orangeColor]];
        self.i = 0;
    }
 }

/*!
 *  回调返回识别结果
 *
 *  @param resultArray 识别结果，NSArray的第一个元素为NSDictionary，NSDictionary的key为识别结果，sc为识别结果的置信度
 *  @param isLast      -[out] 是否最后一个结果
 */
//- (void)onResult:(NSArray *)resultArray isLast:(BOOL) isLast {
//    
//    
//    NSMutableString *result = [[NSMutableString alloc] init];
//    NSDictionary *dic = [resultArray objectAtIndex:0];
//    
//    NSLog(@"======resultArray  %@----%@",resultArray,dic);
//    for (NSString *key in dic) {
//        
//        NSLog(@"======key----%@",key );
//        [result appendFormat:@"%@",key];
//    }
//     NSLog(@"======resultresult  %@----%@",self.lable.text,result);
//    
//   self.lable.text = [NSString stringWithFormat:@"%@%@",self.lable.text,  result];
// 
//}

/*!
 *  识别结束回调
 *
 *  @param error 识别结束错误码
 */
- (void)onError: (IFlySpeechError *) error {
    if (error.errorCode == 0) {
        
    } else {
        //[SVProgressHUD showErrorWithStatus:[NSString stringWithFormat:@"%d", error.errorCode]];
    }
}


 

@end
