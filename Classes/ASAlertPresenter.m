//
//  ASAlertPresenter.m
//  AppSales
//

#import "ASAlertPresenter.h"

static UIViewController *ASTopViewController(UIViewController *viewController)
{
	while (viewController.presentedViewController) {
		viewController = viewController.presentedViewController;
	}
	if ([viewController isKindOfClass:[UINavigationController class]]) {
		return ASTopViewController([(UINavigationController *)viewController topViewController]);
	}
	if ([viewController isKindOfClass:[UITabBarController class]]) {
		return ASTopViewController([(UITabBarController *)viewController selectedViewController]);
	}
	return viewController;
}

void ASShowAlert(UIViewController *presenter, NSString *title, NSString *message)
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIViewController *host = ASTopViewController(presenter);
		if (!host) {
			host = ASTopViewController([UIApplication sharedApplication].delegate.window.rootViewController);
		}
		if (!host) {
			return;
		}

		UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:nil]];
		[host presentViewController:alert animated:YES completion:nil];
	});
}

void ASConfirmAlert(UIViewController *presenter, NSString *title, NSString *message, NSString *confirmTitle, void (^confirmHandler)(void))
{
	dispatch_async(dispatch_get_main_queue(), ^{
		UIViewController *host = ASTopViewController(presenter);
		UIAlertController *alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
		[alert addAction:[UIAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:nil]];
		[alert addAction:[UIAlertAction actionWithTitle:confirmTitle style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) { if (confirmHandler) confirmHandler(); }]];
		[host presentViewController:alert animated:YES completion:nil];
	});
}
