//
//  ViewController.m
//  BottomBarViewDemo
//
//  Created by ug on 2020/6/19.
//  Copyright © 2020 yy. All rights reserved.
//

#import "ViewController.h"
#import "MessageUnderMenuView.h"
#import "Masonry.h"
#import "UIControl+YYAdd.h"
#import "NSObject+Utils.h"

#define WeakSelf __weak typeof(self) weakSelf = self;



@interface ViewController ()
@property (nonatomic, strong)MessageUnderMenuView *underMenu; /**<   下边栏 */
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIView *iphoneXBottomView;/**<iphoneX的t底部*/
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.underMenu = [[MessageUnderMenuView alloc] initView];
    [self.view addSubview:self.underMenu];
    
    
    [self.underMenu  mas_remakeConstraints:^(MASConstraintMaker *make) {
         make.left.equalTo(self.view.mas_left).with.offset(0);
         make.right.equalTo(self.view.mas_right).with.offset(0);
//         make.top.equalTo(self.view.mas_bottom).offset(-36);
         make.top.equalTo(self.iphoneXBottomView.mas_top).offset(-36);//==>在x以上的会显示👇安全位置
         make.height.mas_equalTo(96);
         
     }];

    
    
      
    WeakSelf
    __block BOOL isok = YES;
    [self.underMenu.showBtn addBlockForControlEvents:UIControlEventTouchUpInside block:^(__kindof UIControl *sender) {
        if (OBJOnceToken(self)) {
            self.underMenu.oldFrame = self.underMenu.frame;
        }
        if (isok) {
            [UIView animateWithDuration:0.35 animations:^{
                weakSelf.underMenu.y = weakSelf.underMenu.oldFrame.origin.y -(96-36);
                self.underMenu.arrowImg.transform = CGAffineTransformMakeRotation(M_PI*2);//旋转
            } completion:^(BOOL finished) {
                isok = NO;
            }];
        } else {
            [UIView animateWithDuration:0.35 animations:^{
                weakSelf.underMenu.y =  weakSelf.underMenu.oldFrame.origin.y;
                self.underMenu.arrowImg.transform = CGAffineTransformMakeRotation(M_PI*1);//旋转
            } completion:^(BOOL finished) {
                isok = YES;
            }];
        }
    }];
    self.underMenu.delclickBllock = ^{
        NSLog(@"delclickBllock");
    };
    self.underMenu.readedclickBllock = ^{
        NSLog(@"readedclickBllock");
    };

    [self.view bringSubviewToFront:self.iphoneXBottomView];
}


@end
