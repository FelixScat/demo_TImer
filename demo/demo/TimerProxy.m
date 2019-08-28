//
//  TimerProxy.m
//  demo
//
//  Created by FelixPlus on 2019/8/28.
//  Copyright © 2019 Felix. All rights reserved.
//

#import "TimerProxy.h"

@interface TimerProxy ()

@property (nonatomic, weak) id object;

@end

@implementation TimerProxy

- (instancetype)withProxy:(id)obj {
    
    _object = obj;
    
    return self;
}

+ (instancetype)proxyWithObject:(id)obj {
    
    return [[self alloc] withProxy:obj];
}

- (void)forwardInvocation:(NSInvocation *)invocation {
    
    SEL selector = invocation.selector;
    
    if ([_object respondsToSelector:selector]) {
        
        [invocation invokeWithTarget:_object];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)sel {
    return [_object methodSignatureForSelector:sel];
}

@end
