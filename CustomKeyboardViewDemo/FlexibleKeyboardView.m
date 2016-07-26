//
//  TSKeyboardView.m
//  KeyBoardDemo
//
//  Created by 思来氏 on 16/4/25.
//  Copyright © 2016年 ThornDemo. All rights reserved.
//

#import "FlexibleKeyboardView.h"




@interface FlexibleKeyboardView()
@property (strong, nonatomic) UITextField *cTextField;
@property (strong, nonatomic) UIView *contentView;
@property (nonatomic , copy) numberKeyboardBlock block;
@end

@implementation FlexibleKeyboardView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
 
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
}



- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self setBackgroundColor:RGBCOLORVA(0x000000, 0.2)];
        self.frame = frame;
        _contentView = [[UIView alloc] init];
        _contentView.frame = CGRectMake((CGRectGetWidth(frame)-KEYBOARDWIDTH)/2, SCREEN_HEIGHT, KEYBOARDWIDTH, CUSTOM_KEYBOARD_HEIGHT);;
        _contentView.backgroundColor = RGBCOLORVA(0xd2d2d2, 1.0);
        _keyboardY =  CGRectGetHeight(frame)-CUSTOM_KEYBOARD_HEIGHT;
        [self customView];
        }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
    
}

- (void)setupKeyboardWithField:(UITextField*)filed{
    _cTextField = filed;
    [self addSubview:_contentView];
    _cTextField.inputView = [[UIView alloc] initWithFrame:CGRectMake(_keyboardX, 0, 0, 0)];
    
}

- (void)showKeyboard{
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.frame = CGRectMake(_keyboardX, _keyboardY, KEYBOARDWIDTH, CUSTOM_KEYBOARD_HEIGHT);
    } completion:^(BOOL finished) {
    }];
}

- (void)customView{
    CGFloat width = (KEYBOARDWIDTH-3.0)/4.0;
    for (int i = 0; i<4; i++) {
        for (int j = 0 ; j < 3; j++) {
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(j*(width+SPACE), i*(NUMBUTTONHEIGHT+SPACE), width, NUMBUTTONHEIGHT);
            [button setTitleColor:RGBCOLORVA(0x484848, 1.0) forState:UIControlStateNormal];
            if (i == 3) {
                switch (j) {
                    case 0:
                         [button setTitle:@"." forState:UIControlStateNormal];
                        break;
                    case 1:
                         [button setTitle:@"0" forState:UIControlStateNormal];
                        break;
                    case 2:
                        [button setImage:[UIImage imageNamed:@"key_space"] forState:UIControlStateNormal];
                        break;
                        
                    default:
                        break;
                }
            }else{
                [button setTitle:[NSString stringWithFormat:@"%d",3*i+j+1] forState:UIControlStateNormal];
            }
            button.tag = 3*i+j+1;
            [button addTarget:self action:@selector(numberDotSpaceAction:) forControlEvents:UIControlEventTouchUpInside];
            [button setBackgroundImage:[UIImage imageNamed:@"key_background"] forState:UIControlStateNormal];
            button.titleLabel.font = [UIFont systemFontOfSize:21.0f];
            [_contentView addSubview:button];
        }
    }
    
    for (int i = 0; i<2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(KEYBOARDWIDTH-width , i*(NUMBUTTONHEIGHT*2+SPACE+1), width, NUMBUTTONHEIGHT*2+1);
        button.tag = i;
        if (i == 0) {
            [button setImage:[UIImage imageNamed:@"key_delete"] forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"key_background"] forState:UIControlStateNormal];
            UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressDelete:)];
            [button addGestureRecognizer:longPress];
        }else{
            [button setTitle:@"确认" forState:UIControlStateNormal];
            [button setBackgroundImage:[UIImage imageNamed:@"key_sure_background"] forState:UIControlStateNormal];
        }
        [button addTarget:self action:@selector(deleteSureAction:) forControlEvents:UIControlEventTouchUpInside];
        button.titleLabel.font = [UIFont systemFontOfSize:21.0f];
        [_contentView addSubview:button];
    }
}

- (void)deleteContent{
    if ([_cTextField.text length] > 0) {
        [_cTextField deleteBackward];
    }
}

- (void)showNumKeyboardViewAnimateWithPrice:(NSString *)priceString andBlock:(numberKeyboardBlock)block{
    _block = block;
    
}


- (void)hideNumKeyboardViewWithAnimateWithConfirm:(BOOL)isConfirm{
    [UIView animateWithDuration:0.2 animations:^{
        self.contentView.frame = CGRectMake(_keyboardX, SCREEN_HEIGHT, KEYBOARDWIDTH, CUSTOM_KEYBOARD_HEIGHT);
        
    } completion:^(BOOL finished) {
        [self.cTextField resignFirstResponder];
        [self setBackgroundColor:[UIColor clearColor]];
        self.hidden = YES;
    }];
}




- (void)numberDotSpaceAction:(UIButton *)sender {
    NSString *currentString = [sender titleForState:UIControlStateNormal];
    if (sender.tag == 12) {
        currentString = @" ";
    }
    [_cTextField insertText:currentString];
}


- (void)deleteSureAction:(UIButton *)sender {
    if (sender.tag == 0) {
        [self deleteContent];
    }else{
        [self hideNumKeyboardViewWithAnimateWithConfirm:YES];
    }
}


- (void)longPressDelete:(UIGestureRecognizer*)gesture{
        [self deleteContent];
}

- (void)dealloc{
    if (_cTextField) {
        _cTextField = nil;
    }
    
}



@end
