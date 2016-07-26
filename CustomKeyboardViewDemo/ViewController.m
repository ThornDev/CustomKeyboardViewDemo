//
//  ViewController.m
//  CustomKeyboardViewDemo
//
//  Created by 思来氏 on 16/7/26.
//  Copyright © 2016年 ThornDemo. All rights reserved.
//

#import "ViewController.h"
#import "FlexibleKeyboardView.h"

@interface ViewController ()<UITextFieldDelegate>
@property (strong, nonatomic) FlexibleKeyboardView *flexibleKeyboardView;
@property (weak, nonatomic) IBOutlet UITextField *textFieldUp;
@property (weak, nonatomic) IBOutlet UITextField *textFieldDown;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (_flexibleKeyboardView) {
        [_flexibleKeyboardView setupKeyboardWithField:textField];
        [_flexibleKeyboardView setHidden:NO];
        [_flexibleKeyboardView showKeyboard];
    }else{
        _flexibleKeyboardView = [[FlexibleKeyboardView alloc] initWithFrame:self.view.frame];
        _flexibleKeyboardView.keyboardX = 0;
//        _flexibleKeyboardView.keyboardY = SCREEN_HEIGHT-KEYBOARDWIDTH;
        [self.view addSubview:_flexibleKeyboardView];
        [_flexibleKeyboardView setupKeyboardWithField:textField];
        [_flexibleKeyboardView setHidden:NO];
        [_flexibleKeyboardView showKeyboard];
    }
    
    
    
    return YES;
}


@end
