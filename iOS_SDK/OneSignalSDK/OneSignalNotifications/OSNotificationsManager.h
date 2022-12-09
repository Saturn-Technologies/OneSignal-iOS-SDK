/*
 Modified MIT License

 Copyright 2022 OneSignal

 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:

 1. The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.

 2. All copies of substantial portions of the Software may only be used in connection
 with services provided by OneSignal.

 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

#import <Foundation/Foundation.h>
#import "OneSignalNotificationSettings.h"
#import "OSPermission.h"
#import <OneSignalCore/OneSignalCore.h>
#import <UIKit/UIKit.h>

// If the completion block is not called within 25 seconds of this block being called in notificationWillShowInForegroundHandler then the completion will be automatically fired.
typedef void (^OSNotificationWillShowInForegroundBlock)(OSNotification * _Nonnull notification, OSNotificationDisplayResponse _Nonnull completion);
typedef void (^OSNotificationOpenedBlock)(OSNotificationOpenedResult * _Nonnull result);

/**
 Public API.
 */
@protocol OSNotifications <NSObject>
+ (BOOL)permission;
+ (BOOL)canRequestPermission;
+ (void)setNotificationWillShowInForegroundHandler:(OSNotificationWillShowInForegroundBlock _Nullable)block;
+ (void)setNotificationOpenedHandler:(OSNotificationOpenedBlock _Nullable)block;
+ (void)requestPermission:(OSUserResponseBlock)block;
+ (void)requestPermission:(OSUserResponseBlock)block fallbackToSettings:(BOOL)fallback;
+ (void)registerForProvisionalAuthorization:(OSUserResponseBlock)block;
+ (void)addPermissionObserver:(NSObject<OSPermissionObserver>*)observer;
+ (void)removePermissionObserver:(NSObject<OSPermissionObserver>*)observer;
// clearAll

@end


@protocol OneSignalNotificationsDelegate <NSObject>
// set delegate before user
// can check responds to selector
- (void)setNotificationTypes:(int)notificationTypes;
- (void)setPushToken:(NSString * _Nonnull)pushToken;
- (void)setAccepted:(BOOL)inAccepted;

@end


@interface OSNotificationsManager : NSObject <OSNotifications>

@property (class, weak, nonatomic, nullable) id<OneSignalNotificationsDelegate> delegate;

+ (Class<OSNotifications>)Notifications;

+ (void)setColdStartFromTapOnNotification:(BOOL)coldStartFromTapOnNotification;
+ (BOOL)getColdStartFromTapOnNotification;
+ (void)setAppId:(NSString *)appId;
+ (NSString *_Nullable)getAppId;

@property (class, readonly) OSPermissionStateInternal* _Nonnull currentPermissionState;
@property (class) OSPermissionStateInternal* _Nonnull lastPermissionState;

+ (void)clearStatics; // Used by Unit Tests

// Indicates if the app provides its own custom Notification customization settings UI
// To enable this, set kOSSettingsKeyProvidesAppNotificationSettings to true in init.
+ (BOOL)providesAppNotificationSettings;
/* Used to determine if the app is able to present it's own customized Notification Settings view (iOS 12+) */
+ (void)setProvidesNotificationSettingsView:(BOOL)providesView;

+ (BOOL)registerForAPNsToken;
+ (void)sendPushTokenToDelegate;

+ (int)getNotificationTypes:(BOOL)pushDisabled;
+ (void)updateNotificationTypes:(int)notificationTypes;
+ (void)sendNotificationTypesUpdateToDelegate;

// Used to manage observers added by the app developer.
@property (class, readonly) ObservablePermissionStateChangesType* permissionStateChangesObserver;

@property (class, readonly) OneSignalNotificationSettings* _Nonnull osNotificationSettings;

// This is set by the user module
+ (void)setPushSubscriptionId:(NSString *)pushSubscriptionId;

// - Notification Opened
+ (void)lastMessageReceived:(NSDictionary*)message;

+ (void)handleWillShowInForegroundHandlerForNotification:(OSNotification *)notification completion:(OSNotificationDisplayResponse)completion;
+ (void)handleNotificationAction:(OSNotificationActionType)actionType actionID:(NSString*)actionID;

+ (BOOL)clearBadgeCount:(BOOL)fromNotifOpened;

+ (BOOL)receiveRemoteNotification:(UIApplication*)application UserInfo:(NSDictionary*)userInfo completionHandler:(void (^)(UIBackgroundFetchResult))completionHandler;
+ (void)notificationReceived:(NSDictionary*)messageDict wasOpened:(BOOL)opened;
+ (void)handleWillPresentNotificationInForegroundWithPayload:(NSDictionary *)payload withCompletion:(OSNotificationDisplayResponse)completion;
+ (void)didRegisterForRemoteNotifications:(UIApplication *)app deviceToken:(NSData *)inDeviceToken;
+ (void)handleDidFailRegisterForRemoteNotification:(NSError*)err;
+ (void)checkProvisionalAuthorizationStatus;
@end