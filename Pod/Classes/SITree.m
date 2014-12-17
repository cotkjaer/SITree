//
//  SITree.m
//  Pods
//
//  Created by Christian Otkjær on 17/12/14.
//
//

#import "SITree.h"

@interface SITree ()

@property (nonatomic, strong) NSMutableSet * children;

@end

@implementation SITree

- (instancetype)init
{
    return [self initWithValue:nil parent:nil];
}

- (instancetype)initWithValue:(id)value
{
    return [self initWithValue:value parent:nil];
}

- (instancetype)initWithValue:(id)value parent:(SITree *)parent
{
    self = [super init];
    
    if (self)
    {
        _value = value;
        //        _parent = parent;
        _children = [NSMutableSet new];
        [parent addChild:self];
    }
    
    return self;
}

- (BOOL)isLeaf
{
    return self.children.count == 0;
}

- (BOOL)isRoot
{
    return self.parent == nil;
}

- (void)enumerateChildrensUsingBlock:(void (^)(SITree *, BOOL *))block
{
    [self.children enumerateObjectsUsingBlock:block];
}

- (void)addChild:(SITree *)child
{
    if ([child isKindOfClass:[SITree class]])
    {
        [self.children addObject:child];
        child.parent = self;
    }
}

- (NSArray *)pathToTree:(SITree *)tree
{
    if ([tree isEqual:self])
    {
        return @[self];
    }
    
    __block NSMutableArray * path = nil;
    
    [self enumerateChildrensUsingBlock:^(SITree *child, BOOL *stop)
     {
         NSArray * pathFromChild = [child pathToTree:tree];
         
         if (pathFromChild != nil)
         {
             path = [pathFromChild mutableCopy];
             *stop = YES;
         }
     }];
    
    [path insertObject:self atIndex:0];
    return [path copy];
}

@end

