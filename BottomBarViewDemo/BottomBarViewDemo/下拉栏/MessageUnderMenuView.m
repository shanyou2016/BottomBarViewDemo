//
//  MessageUnderMenuView.m
//  UGBWApp
//
//  Created by ug on 2020/6/19.
//  Copyright © 2020 ug. All rights reserved.
//

#import "MessageUnderMenuView.h"
#import "Masonry.h"

#define RGBA(_R,_G,_B,_A) \
[UIColor colorWithRed:((_R) / 255.0) green:((_G) / 255.0) blue:((_B) / 255.0) alpha:_A]

@interface MessageUnderMenuView ()
@property (weak, nonatomic) IBOutlet UIView *readView;
@property (weak, nonatomic) IBOutlet UIView *delView;

@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

@implementation MessageUnderMenuView


- (instancetype)MessageUnderMenuView {
    NSBundle *bundle=[NSBundle mainBundle];
    NSArray *objs=[bundle loadNibNamed:@"MessageUnderMenuView" owner:nil options:nil];
    return [objs firstObject];
}


- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (!self.subviews.count) {
        MessageUnderMenuView *v = [[MessageUnderMenuView alloc] initView];
        [self addSubview:v];
        [v mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
    }
    return self;
}

- (instancetype)initView {
    if (self = [super init]) {
        self = [self MessageUnderMenuView];
        
        
        
        self.readView.layer.cornerRadius = 5;
        self.readView.layer.masksToBounds = YES;
        
        self.delView.layer.cornerRadius = 5;
        self.delView.layer.masksToBounds = YES;
        
        [self.bottomView setBackgroundColor:RGBA(60, 136, 247, 1)];
        
        
    }
    return self;
}


- (IBAction)readAction:(id)sender {
    if (self.readedclickBllock) {
        self.readedclickBllock();
    }
}
- (IBAction)delAction:(id)sender {
    
    if (self.delclickBllock) {
        self.delclickBllock();
    }
}



@end
