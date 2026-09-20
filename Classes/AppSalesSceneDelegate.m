//
//  AppSalesSceneDelegate.m
//  AppSales
//

#import "AppSalesSceneDelegate.h"
#import "AppSalesAppDelegate.h"

@implementation AppSalesSceneDelegate

@synthesize window;

- (void)scene:(UIScene *)scene willConnectToSession:(UISceneSession *)session options:(UISceneConnectionOptions *)connectionOptions
{
	// 本应用只声明 UIWindowScene；若系统连接其他类型的 Scene，不创建无效窗口。
	if (![scene isKindOfClass:[UIWindowScene class]]) {
		return;
	}

	// iOS 13+ 的主窗口必须绑定当前 UIWindowScene，不能继续使用 initWithFrame:。
	UIWindow *window = [[[UIWindow alloc] initWithWindowScene:(UIWindowScene *)scene] autorelease];
	AppSalesAppDelegate *appDelegate = (AppSalesAppDelegate *)[UIApplication sharedApplication].delegate;

	// 先回填旧入口，再构造根控制器。部分遗留页面会在初始化时访问 AppDelegate.window。
	appDelegate.window = window;
	self.window = window;
	[appDelegate configureMainWindow:window];

	// Scene 启动 URL 不会走旧的 launchOptions；连接完成后由这里统一转交原处理逻辑。
	[self handleURLContexts:connectionOptions.URLContexts];
}

- (void)sceneDidDisconnect:(UIScene *)scene
{
	AppSalesAppDelegate *appDelegate = (AppSalesAppDelegate *)[UIApplication sharedApplication].delegate;
	if (appDelegate.window == self.window) {
		appDelegate.window = nil;
	}
	self.window = nil;
}

- (void)sceneDidEnterBackground:(UIScene *)scene
{
	// Scene 生命周期下不会再可靠地调用 AppDelegate 的同名回调，保留旧保存逻辑。
	[(AppSalesAppDelegate *)[UIApplication sharedApplication].delegate applicationDidEnterBackground:[UIApplication sharedApplication]];
}

- (void)sceneWillEnterForeground:(UIScene *)scene
{
	[(AppSalesAppDelegate *)[UIApplication sharedApplication].delegate applicationWillEnterForeground:[UIApplication sharedApplication]];
}

- (void)sceneDidBecomeActive:(UIScene *)scene
{
	[(AppSalesAppDelegate *)[UIApplication sharedApplication].delegate applicationDidBecomeActive:[UIApplication sharedApplication]];
}

- (void)sceneWillResignActive:(UIScene *)scene
{
	[(AppSalesAppDelegate *)[UIApplication sharedApplication].delegate applicationWillResignActive:[UIApplication sharedApplication]];
}

- (void)scene:(UIScene *)scene openURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts
{
	// 已启动 App 的 URL 会通过 Scene 回调到达，而不是 application:handleOpenURL:。
	[self handleURLContexts:URLContexts];
}

- (void)handleURLContexts:(NSSet<UIOpenURLContext *> *)URLContexts
{
	AppSalesAppDelegate *appDelegate = (AppSalesAppDelegate *)[UIApplication sharedApplication].delegate;
	for (UIOpenURLContext *context in URLContexts) {
		[appDelegate handleOpenURL:context.URL];
	}
}

- (void)dealloc
{
	[window release];
	[super dealloc];
}

@end
