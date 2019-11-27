//
//  GroupModel.h
//  QQ好友列表
//
//  Created by dd luo on 2019/11/27.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListDetailModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GroupModel : NSObject
@property(nonatomic,copy)NSString * name;
@property(nonatomic,strong) NSArray <ListDetailModel *>  * list;
@property (nonatomic, assign) BOOL  isOpen;

@end

NS_ASSUME_NONNULL_END
