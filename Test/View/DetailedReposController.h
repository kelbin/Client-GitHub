//
//  DetailedReposController.h
//  Test
//
//  Created by Kelbin on 10.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CommitCells.h"
#import "Commits.h"
#import "ServiceController.h"

@interface DetailedReposController : UIViewController

@property(nonatomic, strong) UITableView *tableView;
@property(nonatomic, strong) NSString *login;
@property(nonatomic, strong) NSNumber *forks;
@property(nonatomic, strong) NSNumber *watchers;
@property(nonatomic, strong) NSString *avatar;
@property(nonatomic, strong) NSMutableArray<Commits*> *commitArray;
@property(nonatomic, strong) ServiceController *servCon;

@end
