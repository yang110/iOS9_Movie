//
//  BeginViewController.m
//  HWmovie
//
//  Created by Mac on 15/7/27.
//  Copyright (c) 2015年 杨梦佳. All rights reserved.
//

#import "BeginViewController.h"
#import "StartViewController.h"
@interface BeginViewController ()
{
    CGFloat width;
    CGFloat height;
    
    UIScrollView *_scrollView;

    
    
    
}
@end

@implementation BeginViewController

-(instancetype)init
{
    self=[super init];
    
    if (self) {
        
        [self createScrollView];
       
    }
    return self;
}

-(void)createScrollView
{
    width=self.view.bounds.size.width;
    height=self.view.bounds.size.height;
    
    

    
    
    
    _scrollView=[[UIScrollView alloc]initWithFrame:self.view.bounds];
    [self.view  addSubview:_scrollView];

    
    
    _scrollView.contentSize=CGSizeMake(width*5, height);
    
    
    _scrollView.pagingEnabled=YES;
    NSArray *imageNames=@[@"guide1",@"guide2",@"guide3",@"guide4",@"guide5"];
    NSArray *pageControllers=@[@"guideProgress1",@"guideProgress2",@"guideProgress3",@"guideProgress4",@"guideProgress5"];
    
    
    for (int i=0; i<5; i++) {
        UIImageView *imageView =[[UIImageView alloc]initWithFrame:CGRectMake(width*i, 0, width, height)];
        imageView.image=[UIImage imageNamed:imageNames[i]];
        [_scrollView addSubview:imageView];
        
        
        UIImageView *imageView1 =[[UIImageView alloc]initWithFrame:CGRectMake((width-100)/2, height*0.9, 100, 40)];
        imageView1.image=[UIImage imageNamed:pageControllers[i]];
        [imageView addSubview:imageView1];
        
        
        
        
        if (i==4) {
            UIButton *button=[[UIButton alloc]initWithFrame:CGRectMake((width-100)/2+width*4, height*0.8, 100, 40)];
            button.backgroundColor=[UIColor redColor];
       
            [button setTitle:@"开始" forState:    UIControlStateNormal];
            
            [button addTarget:self action:@selector(buttonAction) forControlEvents:  UIControlEventTouchUpInside ];
            
            [_scrollView addSubview:button];
            
        }
        
    }
    

}



-(void)buttonAction
{
   
    UIWindow *window=self.view.window;
    
    
    StartViewController     *myTabBar=[[    StartViewController   alloc]init];
    window.rootViewController=myTabBar;

    
    
    
    
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
