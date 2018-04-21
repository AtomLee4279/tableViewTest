//
//  ViewController.m
//  tableViewTest
//
//  Created by 李一贤 on 2018/4/10.
//  Copyright © 2018年 李一贤. All rights reserved.
//

#import "ViewController.h"
#import "HeroModel.h"
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property(nonatomic,strong) NSArray *herosArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //设置数据源
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
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
    return 3;
}

//每一行显示怎样的数据
//indexPath:代表唯一的一行
//indexPath.section:获取对应的组号
//indexPath.row:获取对应的行号 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    //创建一个cell
    UITableViewCell* cell = [[UITableViewCell alloc]initWithStyle:(UITableViewCellStyleDefault) reuseIdentifier:nil];
//    设置数据
    cell.textLabel.text = [NSString stringWithFormat:@"第%ld组，第%ld行",(long)indexPath.section,(long)indexPath.row];

    return cell;
}

- (nullable NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.herosArray[section] valueForKeyPath:@"name"];
}


#pragma getter&&setter
//懒加载
-(NSArray*)herosArray
{
    if (_herosArray==nil) {
        NSString* path = [[NSBundle mainBundle] pathForResource:@"TableViewData.plist" ofType:nil];
        NSArray *dictArray = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *tempArray = [NSMutableArray array];
        for (NSDictionary* dict in dictArray) {
            HeroModel *hero = [HeroModel heroWithDict:dict];
            [tempArray addObject:hero];
            
        }
        _herosArray = tempArray;
    }
    return _herosArray;
}
@end
