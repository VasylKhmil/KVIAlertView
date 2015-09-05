//
//  CustomAlertView.h
//  Booya Fitness
//
//  Created by Vasyl Khmil on 8/23/15.
//  Copyright (c) 2015 MEV. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KVIAlertView : UIAlertView

@property (nonatomic, copy) NSString *cancelButtonTitle;
@property (nonatomic, copy) void (^cancelButtonAction)();

- (void)addButtonWithTitle:(NSString *)title action:(void (^)())buttonAction;
- (void)addCancelButtonWithTitle:(NSString *)title action:(void (^)())buttonAction;

@end
