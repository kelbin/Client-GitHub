//
//  Commits.h
//  Test
//
//  Created by Kelbin on 11.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetailCommits.h"

@interface Commits : NSObject

@property(nonatomic,strong) NSString *sh;
@property(nonatomic,strong) DetailCommits *detail;

- (instancetype)initWithDictionary:(NSDictionary *)dictionary;

@end
