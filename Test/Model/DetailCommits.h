//
//  DetailCommits.h
//  Test
//
//  Created by Kelbin on 11.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AuthorCommit.h"

@interface DetailCommits : NSObject

@property(nonatomic,strong) NSString *author;
@property(nonatomic,strong) NSString *message;
@property(nonatomic,strong) AuthorCommit *authored;

-(void)initClass;

@end
