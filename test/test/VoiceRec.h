//
//  VoiceRec.h
//  test
//
//  Created by E&P on 2017/4/25.
//  Copyright © 2017年 easipass. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "iflyMSC/iflyMSC.h"
#import "PQVoiceInputView.h"
@interface VoiceRec : UIViewController<IFlySpeechRecognizerDelegate>
@property (nonatomic, strong) IFlySpeechRecognizer *iFlySpeechRecognizer;//带界面的识别对象
@property (nonatomic,strong) PQVoiceInputView *voiceView1;
@property (nonatomic, strong) UITextView *textView;
@property (nonatomic, assign) int  i;
- (void)startRecWithView:(UIView *)view;
@end
