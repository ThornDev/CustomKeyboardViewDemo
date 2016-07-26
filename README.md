# CustomKeyboardViewDemo

####自定义数字键盘，目前只支持UITextField
<https://github.com/ThornDev/CustomKeyboardViewDemo.git>

* 使用方法：

	为UITextField设置代理、然后设置键盘
	

		 - (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    		if (_flexibleKeyboardView) {
        		[_flexibleKeyboardView setupKeyboardWithField:textField];
      		  	[_flexibleKeyboardView setHidden:NO];
        		[_flexibleKeyboardView showKeyboard];
    		}else{
       			 _flexibleKeyboardView = [[FlexibleKeyboardView alloc] initWithFrame:self.view.frame];
       			 _flexibleKeyboardView.keyboardX = 0;
        		[self.view addSubview:_flexibleKeyboardView];
        		[_flexibleKeyboardView setupKeyboardWithField:textField];
        		[_flexibleKeyboardView setHidden:NO];
        		[_flexibleKeyboardView showKeyboard];
   			 }
 		   	 return YES;
		}
