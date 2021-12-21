//
//  Plumber.h
//  Plumber
//
//  Created by Jerry Marino on 12/16/21.
//

#import <Foundation/Foundation.h>

@protocol PlumberProvider3;
@class Plumber;

@protocol PlumberProvider <NSObject>

// Type annotation is always violated
- (nonnull Plumber *)plumber;

@end

@interface Plumber : NSObject <PlumberProvider>

@end

