//
//  ASAlertPresenter.h
//  AppSales
//
//  Xcode 27 的 Scene 应用中 UIAlertView 已不可用。旧项目的纯提示统一走这里，
//  以便确保从当前 Scene 的顶层控制器展示 UIAlertController。
//

#import <UIKit/UIKit.h>

FOUNDATION_EXPORT void ASShowAlert(UIViewController *presenter, NSString *title, NSString *message);
FOUNDATION_EXPORT void ASConfirmAlert(UIViewController *presenter, NSString *title, NSString *message, NSString *confirmTitle, void (^confirmHandler)(void));
