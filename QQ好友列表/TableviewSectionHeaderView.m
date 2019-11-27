//
//  TableviewSectionHeaderView.m
//  QQ好友列表
//
//  Created by dd luo on 2019/11/27.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "TableviewSectionHeaderView.h"


@implementation TableviewSectionHeaderView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
                [self creatButton];

    }
    return self;
}



-(void)creatButton{
    
    UIButton * button = [UIButton buttonWithType:0];
    self.button = button;
    button.frame = self.bounds;
    [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
    
}

-(void)setGroupModel:(GroupModel *)groupModel{
    _groupModel = groupModel;
    self.button.selected = groupModel.isOpen;
    [self.button setTitle:groupModel.name forState:UIControlStateNormal];
}
-(void)buttonClick:(UIButton *)button{
    button.selected = !button.selected;
    self.groupModel.isOpen = button.selected;

    if (self.sectionButtonClick) {
        self.sectionButtonClick();
    }
    
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
