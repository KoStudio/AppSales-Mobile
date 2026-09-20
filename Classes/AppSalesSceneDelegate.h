//
//  AppSalesSceneDelegate.h
//  AppSales
//

//  旧 UIKit 项目的 Xcode 27 Scene 生命周期适配
//
//  Xcode 27 SDK 构建的应用必须声明 UIKit Scene 生命周期。此类只负责把新的
//  UIWindowScene 接到旧 AppDelegate + UIWindow 架构上；业务页面、数据迁移和
//  口令锁仍保留在 AppSalesAppDelegate，避免为适配 Scene 而重写旧业务。
//
//  单窗口约束：AppSales 及其遗留代码通过 AppDelegate.window 访问主窗口，因此
//  Info.plist 中明确关闭多 Scene。创建窗口后必须先回填 AppDelegate.window，
//  再构造根控制器，确保旧页面初始化时能取得正确的窗口。

#import <UIKit/UIKit.h>

@interface AppSalesSceneDelegate : UIResponder <UIWindowSceneDelegate>
{
	UIWindow *window;
}

@property (nonatomic, retain) UIWindow *window;

@end
