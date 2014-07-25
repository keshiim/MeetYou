//
//  CommendViewController.m
//  MeetYou
//
//  Created by Curry on 14-5-24.
//  Copyright (c) 2014年 MeetYou. All rights reserved.
//

#import "CommendViewController.h"
#import "CommendLikeViewController.h"
#import "UserInfoViewController.h"
#import "CommendTermFindViewController.h"

@interface CommendViewController ()
@property (nonatomic,weak)IBOutlet UIButton *dataButton;
@property (nonatomic,weak)IBOutlet UIButton *dislikeButton;
@property (nonatomic,weak)IBOutlet UIButton *likeButton;
@property (nonatomic,weak)IBOutlet UIButton *flowersButton;


@property (nonatomic,strong) CommendLikeViewController *likeViewController; //喜欢
@property (nonatomic,strong) UserInfoViewController *userInfoViewController; //个人资料
@property (nonatomic,strong) CommendTermFindViewController *termFindViewController; //筛选
@end

@implementation CommendViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"推荐";
    
    // Do any additional setup after loading the view from its nib.

}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewDidAppear:YES];
    self.navigationController.navigationBarHidden = YES;
}

//- (void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:YES];
//    self.navigationController.navigationBarHidden = NO;
//}
/**
 *  资料
 *
 *  @param sender
 */
- (IBAction)clickDataButton:(id)sender {
    if (!_userInfoViewController) {
        self.userInfoViewController = [[UserInfoViewController alloc]init];
    }
    [self.navigationController pushViewController:_userInfoViewController animated:YES];
}
/**
 *  不稀饭
 *
 *  @param sender
 */
- (IBAction)clickDisLikeButton:(id)sender {
        [[[MTiToast makeText:@"你已把某某某添加到黑名单中"] setGravity:iToastGravityCenter] show];
}
/**
 *  稀饭
 *
 *  @param sender
 */
- (IBAction)clickLikeButton:(id)sender {
    if (!_likeViewController) {
        self.likeViewController = [[CommendLikeViewController alloc]init];
    }
    [self.navigationController pushViewController:_likeViewController animated:YES];
}
/**
 *  送花
 *
 *  @param sender
 */
- (IBAction)sendFlowersButton:(id)sender {
    [[[MTiToast makeText:@"你已送某某一朵花"] setGravity:iToastGravityCenter] show];
}
/**
 *  返回左边栏
 *
 *  @param sender
 */
- (IBAction)backHome:(id)sender {
    [[SliderViewController sharedSliderController] leftItemClick];
}
/**
 *  条件查找 筛选
 *
 *  @param sender
 */
- (IBAction)termFind:(id)sender {
    if (!_termFindViewController) {
        self.termFindViewController = [[CommendTermFindViewController alloc]init];
    }
    [self presentViewController:_termFindViewController animated:YES completion:^{
        
    }];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
