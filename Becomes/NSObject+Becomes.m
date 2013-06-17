#import "NSObject+Becomes.h"
#import <objc/runtime.h>

@implementation NSObject (Becomes)

- (id)becomes:(Class)anClass
{
    objc_setAssociatedObject(self, &"_originalClass", isa, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    isa = anClass;
    return self;
}

- (NSMethodSignature *) methodSignatureForSelector:(SEL)selector {
    return [[self __originalClass__] methodSignatureForSelector:selector];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [invocation invokeWithTarget:[self __originalClass__]];
}

- (BOOL) respondsToSelector:(SEL)selector
{
    return [[self __originalClass__] respondsToSelector:selector];
}

- (id)__originalClass__
{
    return objc_getAssociatedObject(self, &"_originalClass");
}

@end
