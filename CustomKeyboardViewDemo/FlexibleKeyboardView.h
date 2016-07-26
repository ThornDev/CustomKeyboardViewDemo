//
//  TSKeyboardView.h
//  KeyBoardDemo
//
//  Created by 思来氏 on 16/4/25.
//  Copyright © 2016年 ThornDemo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MacroConfig.h"


@interface FlexibleKeyboardView : UIView

@property (nonatomic, assign) CGFloat keyboardX;
@property (nonatomic, assign) CGFloat keyboardY;

- (void)setupKeyboardWithField:(UITextField*)filed;

- (void)showKeyboard;

typedef void(^numberKeyboardBlock)(NSString *priceString);
- (void)showNumKeyboardViewAnimateWithPrice:(NSString *)priceString andBlock:(numberKeyboardBlock)block;
@end
