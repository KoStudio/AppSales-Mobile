//
//  ReportImportOperation.h
//  AppSales
//
//  Created by Ole Zorn on 09.07.11.
//  Copyright 2011 omz:software. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ASAccount;

@interface ReportImportOperation : NSOperation {

	ASAccount *_account;
	NSPersistentStoreCoordinator *psc;
	NSManagedObjectID *accountObjectID;
	
	NSString *importDirectory;
	NSURL *importDirectoryURL;
	BOOL deleteOriginalFilesAfterImport;
}

@property (retain) NSString *importDirectory;
// Files 目录通过安全作用域 URL 提供；任务执行期间必须持有并访问该 URL。
@property (retain) NSURL *importDirectoryURL;
@property (assign) BOOL deleteOriginalFilesAfterImport;

// 兼容旧的 Documents 根目录导入入口。
+ (BOOL)filesAvailableToImport;
// 检查指定目录的第一层是否包含可导入的报告文件（.txt 或 .txt.gz）。
+ (BOOL)filesAvailableToImportInDirectory:(NSString *)directory;
+ (BOOL)filesAvailableToImportInDirectory:(NSString *)directory;
- (id)initWithAccount:(ASAccount *)account;

@end
