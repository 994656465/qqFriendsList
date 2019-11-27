//
//  GroupModel.m
//  QQ好友列表
//
//  Created by dd luo on 2019/11/27.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "GroupModel.h"

@implementation GroupModel


+ (NSDictionary *)objectClassInArray

{

    return @{@"list":[ListDetailModel class]};

}

@end
