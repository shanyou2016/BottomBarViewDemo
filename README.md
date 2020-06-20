最近公司要做下部栏，现在总结下技术点，让以后有点记忆；


1：UIStoryboard 的调用

    UIStoryboard *story = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];

    UIViewController *myView = [story instantiateViewControllerWithIdentifier:@"ViewController"];

2：BLock 作为属性

typedefvoid(^MessageUnderMenuViewDelClickBlcok)(void);

@property (nonatomic, copy) MessageUnderMenuViewDelClickBlcok delclickBllock;

 if (self.delclickBllock) {

        self.delclickBllock();

    }

    self.underMenu.delclickBllock = ^{

        NSLog(@"delclickBllock");

    };

3：动画的切换

    WeakSelf

    __blockBOOLisok =YES;

    [self.underMenu.showBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(__kindof UIControl *sender) {

        if(OBJOnceToken(self)) {

            self.underMenu.oldFrame = self.underMenu.frame;

        }

        if(isok) {

            [UIView animateWithDuration:0.35 animations:^{

                weakSelf.underMenu.y= weakSelf.underMenu.oldFrame.origin.y-(96-36);

                self.underMenu.arrowImg.transform = CGAffineTransformMakeRotation(M_PI*2);//旋转

            }completion:^(BOOLfinished) {

                isok =NO;

            }];

        }else{

            [UIView animateWithDuration:0.35 animations:^{

                weakSelf.underMenu.y=  weakSelf.underMenu.oldFrame.origin.y;

                self.underMenu.arrowImg.transform = CGAffineTransformMakeRotation(M_PI*1);//旋转

            }completion:^(BOOLfinished) {

                isok =YES;

            }];

        }

    }];

4：把控件加都最上层

 [self.view bringSubviewToFront:self.iphoneXBottomView];

5：只调用一次

 if (OBJOnceToken(self)) {

            self.underMenu.oldFrame = self.underMenu.frame;

    }



二：做的过程发现的问题

自定义控件，在使用的时候，使用

setFrame  没用，控件的frame 不对，已不知道是为啥，也许是ios的源代码bug，

只能使用以下的办法

    [self.underMenu  mas_remakeConstraints:^(MASConstraintMaker *make) {

         make.left.equalTo(self.view.mas_left).with.offset(0);

         make.right.equalTo(self.view.mas_right).with.offset(0);

//        make.top.equalTo(self.view.mas_bottom).offset(-36);

         make.top.equalTo(self.iphoneXBottomView.mas_top).offset(-36);//==>在x以上的会显示👇安全位置

         make.height.mas_equalTo(96);

     }];



在刚执行完mas_remakeConstraints:frame 是拿不到的，这个要注意；
