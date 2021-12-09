//
//  UINavigationBar+statusBar.m
//  AppSales
//
//  Created by huminghua on 2021/12/9.
//

#import "UINavigationBar+statusBar.h"

@implementation UINavigationBar(statusBar)

- (void)setStatusBgColor:(UIColor *)statusColor
{
    //iOs 15以上需要重新设置StatusBar的背景颜色
    
    //设置StatusBar的颜色
    NSInteger statusViewTag = 999999;
    UIView *statusView = nil;
    for (UIView *view in [self subviews]) {
        if (view.tag == statusViewTag) {
            statusView = view;
            break;
        }
    }
    if (statusView == nil) {
        
        NSInteger h = 50;
        statusView = [[UIView alloc] initWithFrame:CGRectMake(0, -h, [UIScreen mainScreen].bounds.size.width, h)];
        statusView.tag = statusViewTag;
        [self addSubview:statusView];
    }
    statusView.backgroundColor = statusColor;
}
@end
