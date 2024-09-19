//
//  HTBaseViewController.h
//  AnimePlay
//
//  Created by MAC on 2024/9/17.
//

#import <UIKit/UIKit.h>


NS_ASSUME_NONNULL_BEGIN

@interface HTBaseViewController : UIViewController



- (void)backItemClicked;

- (void)ht_showNavBarBottomLine;
- (void)ht_hideNavBarBottomLine;


-(void)ht_setNagtionBarBgViewColor:(UIColor *)color;

- (UIButton *)ht_rightButtonWithTitle:(NSString *)title
                     andTitleColor:(UIColor *)titleColor
                andImageNameString:(NSString *)imageName
                         andTarget:(id)target
                            action:(SEL)action;
@end

NS_ASSUME_NONNULL_END
