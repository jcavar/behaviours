//
//  JCABehaviour.m
//
//  Created by Josip Ćavar on 17/06/14.
//  Copyright (c) 2014 Josip Ćavar. All rights reserved.
//

#import "JCABehaviour.h"
#import "objc/runtime.h"

@implementation JCABehaviour

- (void)setOwner:(id)owner {
    
    if (_owner != owner) {
        [self releaseLifetimeFromObject:_owner];
        _owner = owner;
        [self bindLifetimeToObject:_owner];
    }
}

- (void)bindLifetimeToObject:(id)object {
    
    objc_setAssociatedObject(object, (__bridge void *)self, self, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)releaseLifetimeFromObject:(id)object {
    
    objc_setAssociatedObject(object, (__bridge void *)self, nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
