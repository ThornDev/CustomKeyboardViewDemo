//
//  MacroConfig.h
//  CustomKeyboardViewDemo
//
//  Created by 思来氏 on 16/7/26.
//  Copyright © 2016年 ThornDemo. All rights reserved.
//

#ifndef MacroConfig_h
#define MacroConfig_h

#define SCREEN_WIDTH    ([[UIScreen mainScreen] bounds].size.width)                 //屏幕宽度
#define SCREEN_HEIGHT   ([[UIScreen mainScreen] bounds].size.height)                //屏幕长度
#define CUSTOM_KEYBOARD_HEIGHT   263           //自定义键盘高度
#define NUMBUTTONHEIGHT 65.0
#define OBUTTONHEIGHT 108.0
#define SPACE 1.0

#define KEYBOARDWIDTH ([[UIScreen mainScreen] bounds].size.width)

#define RGBCOLORVA(rgbValue, alphaValue) [UIColor \
colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 \
green:((float)((rgbValue & 0x00FF00) >> 8))/255.0 \
blue:((float)(rgbValue & 0x0000FF))/255.0 \
alpha:alphaValue]

#endif /* MacroConfig_h */
