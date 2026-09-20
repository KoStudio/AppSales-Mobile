//
//  AppSalesAppDelegate.h
//  AppSales
//
//  Created by Ole Zorn on 30.06.11.
//  Copyright 2011 omz:software. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AccountsViewController.h"
#import "KKPasscodeLock.h"

@class ASAccount;

@interface AppSalesAppDelegate : NSObject <UIApplicationDelegate, UIActionSheetDelegate, AccountsViewControllerDelegate, KKPasscodeViewControllerDelegate>
{
	UIWindow *window;
	
	AccountsViewController *accountsViewController;
	
	NSManagedObjectContext *managedObjectContext;
	NSManagedObjectModel *managedObjectModel;
	NSPersistentStoreCoordinator *persistentStoreCoordinator;
	
	UIPopoverController *accountsPopover;
}

@property (nonatomic, retain) UIWindow *window;
@property (nonatomic, retain) AccountsViewController *accountsViewController;
@property (nonatomic, retain) UIPopoverController *accountsPopover;
@property (nonatomic, retain, readonly) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain, readonly) NSManagedObjectModel *managedObjectModel;
@property (nonatomic, retain, readonly) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (BOOL)migrateDataIfNeeded;
- (void)saveContext;
- (NSString *)applicationDocumentsDirectory;
- (NSURL *)applicationSupportDirectory;
// Scene 创建并绑定 UIWindowScene 后调用。这里保留原有根控制器和启动后业务逻辑。
- (void)configureMainWindow:(UIWindow *)window;
// 供 Scene 的冷启动和热启动 URL 回调复用原有下载入口。
- (BOOL)handleOpenURL:(NSURL *)url;
- (void)loadAccount:(ASAccount *)account;
- (void)selectAccount:(id)sender;
- (void)showPasscodeLockIfNeeded;

@end
