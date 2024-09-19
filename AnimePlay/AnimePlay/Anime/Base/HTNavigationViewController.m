//
//  HTNavigationViewController.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTNavigationViewController.h"

@interface HTNavigationViewController ()

@end

@implementation HTNavigationViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationBar.translucent = NO;
    
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    //保证在ios13 下也是全屏
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    // iOS 15适配
    if (@available(iOS 15.0, *)) {
        UINavigationBarAppearance *appearance = [[UINavigationBarAppearance alloc] init];
        // 背景色
        [appearance setBackgroundColor:[UIColor whiteColor]];
        // 去掉半透明效果
        appearance.backgroundEffect = nil;
        // 背景图片 优先显示
        [appearance setBackgroundImage:[UIImage ht_imageWithColor:HTMainColor]];
        // 设置导航栏下边界分割线颜色
        [appearance setShadowImage:[UIImage ht_imageWithColor:HTMainColor]];
        // 标题字体颜色及大小
        appearance.titleTextAttributes = @{
            NSFontAttributeName:[UIFont systemFontOfSize:18.0f weight:UIFontWeightSemibold],
            NSForegroundColorAttributeName:HTMainTextColor
        };
        // scrollEdgeAppearance：被scrollview向下拉的状态, 滚动时外观，不设置的时候，使用标准外观
        [[UINavigationBar appearance] setScrollEdgeAppearance: appearance];
        // standardAppearance：常规状态, 标准外观，iOS15之后不设置的时候，导航栏背景透明
        [[UINavigationBar appearance] setStandardAppearance:appearance];
    }
    else {
        //导航栏背景颜色
        [[UINavigationBar appearance] setBarTintColor:[UIColor whiteColor]];
        //导航栏左右按钮字体颜色
//        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
        //修改标题字体颜色及大小
        [[UINavigationBar appearance] setTitleTextAttributes:@{
            NSFontAttributeName:[UIFont systemFontOfSize:18 weight:UIFontWeightSemibold],
            NSForegroundColorAttributeName:HTMainTextColor}
        ];
        [[UINavigationBar appearance] setShadowImage:[UIImage ht_imageWithColor:HTMainColor size:CGSizeMake([UIScreen mainScreen].bounds.size.width, 1)]];
    }
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleDarkContent;
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count >= 1) {
        //如果没这行代码，是正常显示的
        viewController.hidesBottomBarWhenPushed = YES;
        if ([viewController isKindOfClass:[UITableViewController class]]) {
            UIImage *image = [UIImage imageNamed:@"back"];
            image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
            UIBarButtonItem *back = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(back)];
            viewController.navigationItem.leftBarButtonItems = @[back];
            viewController.navigationItem.leftItemsSupplementBackButton = NO;
        }
    }
    [super pushViewController:viewController animated:animated];
}

- (void)back {
//    if ([self.uiNaviDelegate respondsToSelector:@selector(navigationControllerDidClickLeftButton:)]) {
//        [self.uiNaviDelegate navigationControllerDidClickLeftButton:self];
//    }
    [self popViewControllerAnimated:YES];
}

@end
