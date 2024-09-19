//
//  HTBaseViewController.m
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#import "HTBaseViewController.h"

@interface HTBaseViewController ()

@end
@implementation HTBaseViewController

- (instancetype)init
{
    if (self = [super init]) {
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.modalPresentationStyle = UIModalPresentationFullScreen;
    
    UIImage *image = [UIImage imageNamed:@"back"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationController.interactivePopGestureRecognizer.delegate=(id)self;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStyleDone target:self action:@selector(backItemClicked)];
    
    if (self.navigationController.viewControllers.count < 2) {
        self.navigationItem.leftBarButtonItem = nil;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
//    if (self.navigationController.viewControllers.firstObject == self) {
//        self.navigationController.interactivePopGestureRecognizer.enabled = false;
//    }else{
//        self.navigationController.interactivePopGestureRecognizer.enabled = true;
//    }
}

//设置状态栏颜色
- (UIStatusBarStyle)preferredStatusBarStyle {
    if (@available(iOS 13.0, *)) {
        return UIStatusBarStyleDarkContent;
    } else {
        return UIStatusBarStyleDefault;
    }
}

#pragma mark - Function
#pragma mark -- 返回事件
- (void)backItemClicked
{
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}


#pragma mark -- 控制导航栏底部黑线的显示与隐藏
//隐藏底部横线
- (void)ht_hideNavBarBottomLine {
    UIImageView *bottomLine = [self foundNavigationBarBottomLine:self.navigationController.navigationBar];
    if (bottomLine) {
        bottomLine.hidden = YES;
    }
}

//显示底部横线
- (void)ht_showNavBarBottomLine {
    UIImageView *bottomLine = [self foundNavigationBarBottomLine:self.navigationController.navigationBar];
    if (bottomLine) {
        bottomLine.hidden = NO;
        return;
    }
}

//寻找底部横线
- (UIImageView *)foundNavigationBarBottomLine:(UIView *)view {
    if ([view isKindOfClass:UIImageView.class] && view.bounds.size.height <= 1.0) {
        return (UIImageView *)view;
    }
    for (UIView *subview in view.subviews) {
        UIImageView *imageView = [self foundNavigationBarBottomLine:subview];
        if (imageView) {
            return imageView;
        }
    }
    return nil;
}



#pragma mark - Touch事件
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma mark - 懒加载
- (void)ht_setNagtionBarBgViewColor:(UIColor *)color{
    
    //ios 15系统
      if (@available(iOS 15.0, *)) {
          UINavigationBarAppearance *appperance = [[UINavigationBarAppearance alloc]init];
          //添加背景色
          appperance.backgroundColor = color;
          appperance.shadowImage = [[UIImage alloc]init];
          appperance.shadowColor = nil;
          self.navigationController.navigationBar.standardAppearance = appperance;
          self.navigationController.navigationBar.scrollEdgeAppearance = appperance;

      }else{
          
          self.navigationController.navigationBar.barTintColor = color;
      }
    
}
- (UIButton *)ht_rightButtonWithTitle:(NSString *)title
                     andTitleColor:(UIColor *)titleColor
                andImageNameString:(NSString *)imageName
                         andTarget:(id)target
                            action:(SEL)action
{
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 40, 40)];
    if (imageName) {
        [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    }
    if (title) {
        [button setTitle:title forState:UIControlStateNormal];
    }
    if (titleColor) {
        [button setTitleColor:titleColor forState:UIControlStateNormal];
    }
    
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentRight;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:button];
    return button;
}
#pragma mark - 释放
- (void)dealloc{
    NSString  *ctrl_controller = NSStringFromClass([self class]);
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    NSLog(@"释放控制器:%@",ctrl_controller);
}


@end
