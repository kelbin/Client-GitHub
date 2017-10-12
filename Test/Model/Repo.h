//
//  Repo.h
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Owner.h"

@class Owner;
@interface Repo : NSObject

@property(nonatomic, strong) NSString *name;
@property(nonatomic, strong) NSString *descrip;
@property(nonatomic, strong) NSNumber *fork;
@property(nonatomic, strong) NSNumber *watchers;
@property(nonatomic, strong) Owner *owner;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;


@end
