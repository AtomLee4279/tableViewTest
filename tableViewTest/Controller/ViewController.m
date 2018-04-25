//
//  ViewController.m
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/10.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"
#import "HeroGroup.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *heroGroups;
@property(nonatomic,strong) NSMutableDictionary *selectedDict;//记录选中的行组
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置数据源
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.allowsMultipleSelection = YES;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma 返回组中行数
//设置每一组返回多少行
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
   else if (section ==1)
   {
       return 2;
   }
    else
    {
        return 3;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
{
    return self.heroGroups.count;
}

//每一行显示怎样的数据，当有一个cell出现在用户视野范围的时候调用
//indexPath:代表唯一的一行
//indexPath.section:获取对应的组号
//indexPath.row:获取对应的行号 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"hero";//使用静态局部变量static，避免每次调用该方法时都重复创建该局部变量,保证该变量的内存只分配一次
    //1.首先根据标识符去重用池中取cell
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:ID];
    //2.如果不存在cell,才根据标识符新创建cell
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:ID];
    }
    cell.accessoryType = UITableViewCellAccessoryNone;
//设置cell选中状态
    if ([self.selectedDict objectForKey:@(indexPath.section)]) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    }
//设置数据
    NSLog(@"%ld==%ld",(long)indexPath.section,(long)indexPath.row);
    HeroGroup * group = self.heroGroups[indexPath.section];
    cell.textLabel.text = [group getHeroParamWithIndex:indexPath.row andkey:@"name"];
    cell.detailTextLabel.text = [group getHeroParamWithIndex:indexPath.row andkey:@"info"];
    cell.imageView.image = [UIImage imageNamed:[group getHeroParamWithIndex:indexPath.row andkey:@"icon"]];
    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.heroGroups[section] valueForKeyPath:@"GroupTitle"];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
    //如果之前是选中状态
//    if(cell.accessoryType==UITableViewCellAccessoryCheckmark)
//    {
//        //点击后设置为非选中状态
//        cell.accessoryType = UITableViewCellAccessoryNone;
//        //从记录选中的数组中移除该项
//        if ([self.selectedDict objectForKey:@(indexPath.section)]) {
//            [self.selectedDict removeObjectForKey:@(indexPath.section)];
//        }
//    }
    //如果之前是非选中状态
    if(cell.accessoryType==UITableViewCellAccessoryNone)
    {
        //点击后设置为选中状态
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
        //从记录选中的数组中添加该该项
        if (![self.selectedDict objectForKey:indexPath]) {
            [self.selectedDict setObject:@(indexPath.row) forKey:@(indexPath.section)];
        }
        NSLog(@"%@",[NSString stringWithFormat:@"选中了第%ld组，第%ld行",(long)indexPath.section+1,(long)indexPath.row+1]);
    }
    
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =  [tableView cellForRowAtIndexPath:indexPath];
//    cell.accessoryType = UITableViewCellAccessoryNone;
    //如果之前是选中状态
    if(cell.accessoryType==UITableViewCellAccessoryCheckmark)
    {
        //点击后设置为非选中状态
        cell.accessoryType = UITableViewCellAccessoryNone;
        //从记录选中的数组中移除该项
        if ([self.selectedDict objectForKey:@(indexPath.section)]) {
            [self.selectedDict removeObjectForKey:@(indexPath.section)];
        }
    }
    //如果之前是非选中状态
//    if(cell.accessoryType==UITableViewCellAccessoryNone)
//    {
//        //点击后设置为选中状态
//        cell.accessoryType = UITableViewCellAccessoryCheckmark;
//        //从记录选中的数组中添加该该项
//        if (![self.selectedDict objectForKey:indexPath]) {
//            [self.selectedDict setObject:@(indexPath.row) forKey:@(indexPath.section)];
//        }
//        NSLog(@"%@",[NSString stringWithFormat:@"选中了第%ld组，第%ld行",(long)indexPath.section+1,(long)indexPath.row+1]);
//    }
}

//设置cell样式
//cell.accessoryType = UITableViewCellAccessoryCheckmark;//带点击选中打勾效果
//根据具体不同cell需求设置不同的行高
#pragma getter&&setter
//懒加载
-(NSArray*)heroGroups
{
    if (_heroGroups==nil) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"TableViewData.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary* dict in array) {
            HeroGroup *heroGroups = [HeroGroup heroGroupWithDict:dict];
            [tempArray addObject:heroGroups];
        }
        _heroGroups = tempArray;
    }
    return _heroGroups;
}

-(NSMutableDictionary*)selectedDict
{
    if (_selectedDict==nil) {
        NSMutableDictionary * dict = [NSMutableDictionary dictionary];
        _selectedDict = dict;
    }
    return _selectedDict;
    
}

-（void）printDict:(NSDictionary*)dict
{
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"%ld,%ld",key,obj);
    }
     ];
    
}


@end
