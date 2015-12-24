//
//  CustomAlertView.m
//  Booya Fitness
//
//  Created by Vasyl Khmil on 8/23/15.
//  Copyright (c) 2015 MEV. All rights reserved.
//

#import "KVIAlertView.h"

@interface KVIAlertView () <UIAlertViewDelegate>

@property (nonatomic, strong) NSMutableArray *actions;
@property (nonatomic, strong) NSMutableArray *buttonsTitle;

@property (nonatomic, strong) UIAlertView *displayingAlertView;

@property (nonatomic, strong) UIView *selfKeeping;

@end

@implementation KVIAlertView

#pragma mark - Intializers

- (instancetype)init {
    self = [super init];
    
    if (self != nil) {
        _actions = [NSMutableArray new];
        _buttonsTitle = [NSMutableArray new];
    }
    
    return self;
}

#pragma mark - Public Methods

- (void)addButtonWithTitle:(NSString *)title action:(void (^)())buttonAction {
    NSString *realTitle = title == nil ? @"" : title;
    void (^realAction)() = buttonAction == nil ? ^{} : buttonAction;
    
    [self.buttonsTitle addObject:realTitle];
    [self.actions addObject:realAction];
}

- (void)addCancelButtonWithTitle:(NSString *)title action:(void (^)())buttonAction {
    self.cancelButtonTitle = title;
    self.cancelButtonAction = buttonAction;
}

#pragma mark - Overrided Methods

- (void)show {
    self.displayingAlertView = [[UIAlertView alloc] initWithTitle:self.title message:self.message delegate:self cancelButtonTitle:self.cancelButtonTitle otherButtonTitles:nil];
    
    for (NSString *title in self.buttonsTitle) {
        [self.displayingAlertView addButtonWithTitle:title];
    }
    
    self.selfKeeping = self;
    
    [self.displayingAlertView show];
}

#pragma mark - UIAlertViewDelegate Methods

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex {
    
    if (buttonIndex == alertView.cancelButtonIndex) {
        if (self.cancelButtonAction != nil) {
            self.cancelButtonAction();
        }
    } else {
        NSInteger buttonActionIndex = buttonIndex - (alertView.cancelButtonIndex + 1);
        if (buttonActionIndex < self.actions.count) {
            void (^buttonAction)() = self.actions[buttonActionIndex];
            buttonAction();
        }
    }
    
    self.selfKeeping = nil;
    
}

@end
