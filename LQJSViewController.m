//
//  LQJSViewController.m
//  JSPatchDemo
//
//  Created by liqi on 16/9/17.
//  Copyright © 2016年 liqi. All rights reserved.
//

#import "LQJSViewController.h"

@interface LQJSViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UITableView *table;

@property (nonatomic,strong) NSMutableArray *dataArray;

@end

@implementation LQJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    self.automaticallyAdjustsScrollViewInsets = NO;
    [self setUpVCWithContent];
}

- (void)setUpVCWithContent {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    label.text = @"JSPatchDemo";
    label.textColor = [UIColor yellowColor];
    label.font = [UIFont systemFontOfSize:20];
    self.navigationItem.titleView = label;
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeContactAdd];
    button.backgroundColor = [UIColor yellowColor];
    [button addTarget:self action:@selector(addData) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc]initWithCustomView:button];
    
    self.navigationItem.rightBarButtonItem= rightButton;
    
    UITableView  *table = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, self.view.frame.size.width, self.view.frame.size.height - 64)];
    
    self.table= table;
    
    table.dataSource=self;
    
    [self.view addSubview:table];
}

- (void)addData {
    NSString *datas =@"test-22";
    
    [self.dataArray addObject:datas];
    
    [self.table reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ID = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        cell.textLabel.textColor= [UIColor redColor];
        
        cell.textLabel.textAlignment=NSTextAlignmentCenter;
        
        cell.textLabel.font= [UIFont systemFontOfSize:20];
        
        if(indexPath.row>4)
            
        {
            
            cell.textLabel.textColor= [UIColor orangeColor];
            
            cell.textLabel.textAlignment=NSTextAlignmentRight;
            
            cell.textLabel.font= [UIFont boldSystemFontOfSize:25];
            
        }
        
    }
    
    cell.textLabel.text=self.dataArray[indexPath.row];
    
    return cell;
}


- (NSMutableArray *)dataArray {
    if (_dataArray == nil) {
        _dataArray = [NSMutableArray array];
        [_dataArray addObjectsFromArray:@[@"test-1",@"test-2",@"test-3",@"test-4",@"test-5"]];
    }
    return _dataArray;
}


@end
