//
//  ZTViewController.m
//  老虎机
//
//  Created by ZT on 14-2-12.
//  Copyright (c) 2014年 zhaotian. All rights reserved.
//

#import "ZTViewController.h"

@interface ZTViewController ()
{
    UIPickerView * _pick;
    NSTimer * _timer;
    int _count;
    UIButton * _button;
    NSArray * _num;
}
@end

@implementation ZTViewController
- (void)dealloc
{
    [_num release];
    [super dealloc];
}
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        _count = 0;
        _num = [[NSArray alloc] initWithObjects:@"9.png",@"0.png",@"1.png",@"2.png",@"3.png",@"4.png",@"5.png",@"6.png",@"7.png",@"8.png",@"9.png",@"0.png",nil];
        NSLog(@"1111");
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _pick = [[UIPickerView alloc]initWithFrame:CGRectMake(0, 20, 320, 216)];
    _pick.dataSource = self;
    _pick.delegate = self;
    _pick.userInteractionEnabled = NO;
    [_pick selectRow:8 inComponent:0 animated:NO];
    [_pick selectRow:8 inComponent:1 animated:NO];
    [_pick selectRow:8 inComponent:2 animated:NO];
    [self.view addSubview:_pick];
    [_pick release];
    
    _button = [[UIButton alloc]initWithFrame:CGRectMake(100, 300, 120, 60)];
    _button.backgroundColor = [UIColor lightGrayColor];
    [_button addTarget:self action:@selector(action) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    [_button release];
    
    
}

- (void)action
{
    _timer = [NSTimer scheduledTimerWithTimeInterval:0.2 target:self selector:@selector(change) userInfo:nil repeats:YES];
    _button.userInteractionEnabled = NO;
}

- (void)change
{
    [_pick selectRow:(arc4random()%10+1) inComponent:0 animated:YES];
    [_pick selectRow:(arc4random()%10+1) inComponent:1 animated:YES];
    [_pick selectRow:(arc4random()%10+1) inComponent:2 animated:YES];
    if (_count == 5) {
        [_timer invalidate];
        _count = 0;
        _button.userInteractionEnabled = YES;
    }
    _count++;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 3;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 12;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 90;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView * aView = [[[UIView alloc]initWithFrame:CGRectMake(0, 0, 90, 90)]autorelease];
    
    UIImageView * image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:[_num objectAtIndex:row]]];
    image.frame = CGRectMake(0, 0, 90, 90);
    [aView addSubview:image];
    
    return  aView;
}








- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
