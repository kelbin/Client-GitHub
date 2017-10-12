//
//  ListOfRepositoriesController.h
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ServiceController.h"
#import "Repo.h"
#import "Commits.h"
#import "AuthorizationController.h"
#import "DetailedReposController.h"

@class ServiceController;
@interface ListOfRepositoriesController : UITableViewController

@property(nonatomic,strong) ServiceController *servCon;


@end
