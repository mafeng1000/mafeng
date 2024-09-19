//
//  HTTabBarController.m
//  AnimePlay
//
//  Created by daqi meng on 2024/9/18.
//

#import "HTTabBarController.h"
#import "HTCustomTabBar.h"
#import "HTHomeRootViewController.h"
#import "HTBrowseViewController.h"
#import "HTMyLibraryViewController.h"
#import "HTPremiumViewController.h"
#import "HTNavigationViewController.h"



@interface HTTabBarController ()<UITabBarControllerDelegate, UITabBarDelegate>

@end

@implementation HTTabBarController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.tabBar.tintColor = HTMainColor;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.tabBar.translucent = NO;

    [self setTabBar];
    self.selectedIndex = 0;
    self.delegate = self;
    // 设置一个自定义 View,大小等于 tabBar 的大小
    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HT_SCREEN_WIDTH, HT_SCREEN_HEIGHT)];
    // 给自定义 View 设置颜色
    bgView.backgroundColor = HTMainColor;
    // 将自定义 View 添加到 tabBar 上
    [self.tabBar insertSubview:bgView atIndex:0];
//    //未选择颜色设置
//    if (@available(iOS 10.0, *)) {
//        [self.tabBar setUnselectedItemTintColor:HTMainColor];
//    }
//    //设置选择颜色
//    self.tabBar.tintColor = HTMainColor;
//    
    [self.tabBar setBackgroundImage:[UIImage new]];
    [self.tabBar setShadowImage:[UIImage new]];
    self.tabBar.layer.shadowColor = [UIColor lightGrayColor].CGColor;
    self.tabBar.layer.shadowOffset = CGSizeMake(0, -1);
    self.tabBar.layer.shadowOpacity = 0.3;
}

- (void)setTabBar {
    /**** 添加子控制器 ****/
//    [self setValue:[[CustomTabBar alloc] init] forKeyPath:@"tabBar"];
    [self setupOneChildViewController:[[HTHomeRootViewController alloc] init] title:@"Home".ht_localized image:@"home_nor" selectedImage:@"home_select"];
    [self setupOneChildViewController:[[HTBrowseViewController alloc] init] title:@"Browse".ht_localized image:@"browse_nor" selectedImage:@"browse_select"];
//    // QiuZhuViewController
    [self setupOneChildViewController:[[HTMyLibraryViewController alloc] init] title:@"Library".ht_localized image:@"myLibrary_nor" selectedImage:@"myLibrary_select"];
    [self setupOneChildViewController:[[HTPremiumViewController alloc] init] title:@"Premium".ht_localized image:@"premium_nor" selectedImage:@"premium_select"];
}

- (void)setupOneChildViewController:(UIViewController *)vc title:(NSString *)title image:(NSString *)image selectedImage:(NSString *)selectedImage {
    if (image.length) { // 图片名有具体值，判断图片传入值是空还是nil
        UIImage *tabImage = [UIImage imageNamed:image];
        tabImage = [tabImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.image = tabImage;
        UIImage *selecttabImage = [UIImage imageNamed:selectedImage];
        
        selecttabImage = [selecttabImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        vc.tabBarItem.selectedImage = selecttabImage;
        NSMutableDictionary *attributes = [NSMutableDictionary dictionary];
        //颜色属性
        attributes[NSForegroundColorAttributeName] = HTMainTextColor;
        //字体大小属性
        //还有一些其他属性的key可以去NSAttributedString.h文件里去找
        attributes[NSFontAttributeName] = [UIFont systemFontOfSize:11 weight:UIFontWeightRegular];
        
        NSMutableDictionary *selectAttri = [NSMutableDictionary dictionary];
        selectAttri[NSForegroundColorAttributeName] = HTMainSelectTextColor;
        selectAttri[NSFontAttributeName] = [UIFont systemFontOfSize:11 weight:UIFontWeightBold];
        vc.tabBarItem.title = title;
        //设置为选中状态的文字属性
        [vc.tabBarItem setTitleTextAttributes:attributes forState:UIControlStateNormal];
        //设置选中状态的属性
        [vc.tabBarItem setTitleTextAttributes:selectAttri forState:UIControlStateSelected];
        
    }
    
    HTNavigationViewController *nav = [[HTNavigationViewController alloc] initWithRootViewController:vc];
    [self addChildViewController:nav];
}

//判断是否跳转
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{

    return YES;
}


@end
