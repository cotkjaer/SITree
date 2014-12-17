//
//  SITree.h
//  Pods
//
//  Created by Christian Otkjær on 17/12/14.
//
//

@import Foundation;

@interface SITree : NSObject

@property (nonatomic, strong) id value;

@property (nonatomic, strong) SITree * parent;

@property (nonatomic, readonly, getter=isLeaf) BOOL leaf;

@property (nonatomic, readonly, getter=isRoot) BOOL root;

@property (nonatomic, readonly) NSUInteger height;

- (instancetype)initWithValue:(id)value;

- (instancetype)initWithValue:(id)value parent:(SITree *)parent;

- (void)addChild:(SITree *)child;

- (void)enumerateChildrenUsingBlock:(void (^)(SITree * child, BOOL *stop))block;

- (NSArray *)pathToTree:(SITree *)tree;

@end
