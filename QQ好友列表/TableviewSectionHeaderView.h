//
//  TableviewSectionHeaderView.h
//  QQ好友列表
//
//  Created by dd luo on 2019/11/27.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GroupModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableviewSectionHeaderView : UIView
@property(nonatomic,strong) UIButton * button ;
@property(nonatomic,copy)void (^sectionButtonClick)(void);

@property(nonatomic,strong) GroupModel * groupModel;

@end

NS_ASSUME_NONNULL_END
