//
//  MoreViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/17.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "MoreViewController.h"
#import "MoreCell.h"
#import "MoreModal.h"
#import "common.h"
#import "UIImageView+WebCache.h"
@interface MoreViewController ()<UIAlertViewDelegate>

@end

@implementation MoreViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    
    
    self=[super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title=@"更多";
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    [self loadData];
    [self createTableView];
    
    
    
    
    
}

-(void)loadData
{
    
    
    
    
    _array=[[NSMutableArray alloc]init];
    
    
    NSArray *array1=@[@"yang1",@"yang2",@"yang3",@"yang4",@"yang5",@"yang6"];
    NSArray *array2=@[@"清楚缓存",@"给个评价",@"检查心版本",@"商务合作",@"欢迎页",@"关于"];
    
    
    for (int i=0; i<6; i++) {
        MoreModal *modal=[[MoreModal alloc]init  ];
        modal.image=array1[i];
        modal.text1=array2[i];
     
        
        [_array addObject:modal];
        
        
        
    }
    
}

-(void)createTableView
{
    _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kwidth, kheight) style:UITableViewStyleGrouped] ;
    _tableView.dataSource=self;
    _tableView.delegate=self;

    [self.view addSubview:_tableView];
    
    
    UINib *nib=[UINib nibWithNibName:@"MoreCell" bundle:nil];
    [ _tableView registerNib:nib forCellReuseIdentifier:@"cell"];
    

    _tableView.backgroundColor=[UIColor blackColor];

    
   
    
}





//2
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
{
    
    
    return _array.count;
    
    
    
    
}


//3
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
    
    MoreCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];


    
       // cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    
    if (indexPath.row==0) {
        
        
        
        
        UILabel *laber=(UILabel*)[cell.contentView viewWithTag:100 ];
        
        
        SDImageCache *cache=[SDImageCache sharedImageCache];
        
        CGFloat size=[cache getSize];
        
        
        laber.text=[NSString stringWithFormat:@"%.1f",size/1000/1000];
        

        
    }
  else
  {
      UILabel *laber=(UILabel*)[cell.contentView viewWithTag:100 ];
      laber.hidden=YES;
      
      
  }
    cell.modal =_array[indexPath.row];

    return cell;
    
    
}

//选中时候执行代码
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row==0)
    {
        
    
   
    //07  UIAlertView
    UIAlertView *alter=[[UIAlertView alloc]initWithTitle:@"提示"
                                                 message:@"是否清楚缓存"
                                                delegate:self
                                       cancelButtonTitle:@"取消"
                                       otherButtonTitles:@"确定" ,nil];
    [alter show];

    }
    
    
    
    
    
    
    
    
    
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex==1) {
        
        
        SDImageCache *cache=[SDImageCache sharedImageCache];
        [cache clearDisk];
        
        [_tableView reloadData];
        
    }
    
}

-(void)viewWillAppear:(BOOL)animated
{
    
    [_tableView reloadData];
    
    
}

@end
