//
//  CustomAlertView.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 8/23/15.
//  Copyright (c) 2015 MEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVIAlertView : UIAlertView

@property (nonatomic, copy, nullable) NSString *cancelButtonTitle;
@property (nonatomic, copy, nullable) void (^cancelButtonAction)();

- (void)addButtonWithTitle:(nonnull NSString *)title action:(nonnull void (^)())buttonAction;

- (void)addCancelButtonWithTitle:(nonnull NSString *)title action:(nonnull void (^)())buttonAction;

@end
