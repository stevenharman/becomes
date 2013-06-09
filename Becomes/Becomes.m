//
//  Becomes.m
//  Becomes
//
//  Created by Steven Harman on 6/8/13.
//  Copyright (c) 2013 Steven Harman. All rights reserved.
//

#import "Becomes.h"

@interface Becomes()
{
    id _originalObject;
}

@end

@implementation Becomes

- (id)becomes:(Class)anClass
{
    _originalObject = isa;
    isa = anClass;
    return self;
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)selector {
    NSMethodSignature *signature = [super methodSignatureForSelector:selector];
    
    if (!signature) {
        signature = [_originalObject methodSignatureForSelector:selector];
    }
    
    return signature;
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:_originalObject];
}

- (BOOL) respondsToSelector:(SEL)selector
{
    return [super respondsToSelector:selector] || [_originalObject respondsToSelector:selector];
}

@end
