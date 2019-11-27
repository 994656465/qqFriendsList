//
//  ViewController.m
//  QQ好友列表
//
//  Created by dd luo on 2019/11/27.
//  Copyright © 2019 dd luo. All rights reserved.
//

#import "ViewController.h"
#import "GroupModel.h"
#import "ListDetailModel.h"
#import <MJExtension.h>
#import "TableviewSectionHeaderView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) NSMutableArray  * dataArr;
@property(nonatomic,strong) UITableView * tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    [self creatData];
    [self.tableView reloadData];

}

-(void)creatData{

    
    NSMutableArray * groupArr = [NSMutableArray array];
    for (NSInteger i = 0 ; i < 5; i++) {
        
        NSMutableDictionary * groupDic = [NSMutableDictionary dictionary];
        [groupDic setValue:[NSString stringWithFormat:@"%zd组",i] forKey:@"name"];
        
        
        NSMutableArray * list = [NSMutableArray array];
        for (NSInteger j = 0; j < 8; j++) {
            NSMutableDictionary * dic = [NSMutableDictionary dictionary];
            [dic setValue:[NSString stringWithFormat:@"%zd--%zd",i,j] forKey:@"name"];
            if (j % 2) {
                [dic setValue:@"action_love" forKey:@"icon"];
            }else{
                [dic setValue:@"action_love_selected" forKey:@"icon"];
            }
            [list addObject:dic];
        }
        
        [groupDic setValue:list forKey:@"list"];
        
        [groupArr addObject:groupDic];
    }
//  MARK: - 字典转模型
    
    for (NSInteger i = 0  ;  i < groupArr.count; i++) {
        NSDictionary * groupDic = groupArr[i];
        GroupModel * groupModel = [GroupModel mj_objectWithKeyValues:groupDic];
//        [groupModel setValue:[NSNumber numberWithBool:NO] forKey:@"isOpen"];
        [self.dataArr addObject:groupModel];
    }

    
    
}

//  MARK: - tableview datasource and delegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return  self.dataArr.count;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    GroupModel * groupModel = self.dataArr[section];
    
  return   groupModel.isOpen?groupModel.list.count:0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellID"];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cellID"];
    }
    GroupModel * groupModel = self.dataArr[indexPath.section];
    ListDetailModel * listModel = groupModel.list[indexPath.row];
    
    cell.textLabel.text = listModel.name;
    cell.imageView.image = [UIImage imageNamed:listModel.icon];
    return cell;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    TableviewSectionHeaderView  * sectionHeader = [[TableviewSectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, 40)];
    GroupModel * groupModel = self.dataArr[section];
    sectionHeader.groupModel =groupModel;
    __weak typeof (self)weakSelf = self;
    sectionHeader.sectionButtonClick = ^{
        [weakSelf sectionButtonClick];
    };
    return sectionHeader;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40;
}


-(void)sectionButtonClick{
    
    [self.tableView reloadData];
}

//  MARK: - 懒加载


-(NSMutableArray *)dataArr{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]init];
        _tableView.frame = self.view.bounds;
        _tableView.delegate =self;
        _tableView.dataSource  = self;
        [self.view addSubview:_tableView];
        
    }
    return _tableView;
}




@end
