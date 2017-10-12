//
//  ListOfRepositoriesController.m
//  Test
//
//  Created by Kelbin on 07.10.17.
//  Copyright © 2017 Kelbin. All rights reserved.
//

#import "ListOfRepositoriesController.h"

@interface ListOfRepositoriesController () {}

@end

@implementation ListOfRepositoriesController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self logOutButton];
    [self.navigationItem setTitle:@"Список репозиториев"];
    self.navigationItem.hidesBackButton = YES;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"RepoCell"];
}

- (void)logOutButton {
    UIBarButtonItem *rightbutton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"logOutIcon.png"]
                                                                    style:UIBarButtonItemStylePlain target:self action:@selector(logOutAction)];
    rightbutton.tintColor = [UIColor blackColor];
    [self.navigationItem setRightBarButtonItem:rightbutton];
}

- (void)logOutAction {
   [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _servCon.reposArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"RepoCell" forIndexPath:indexPath];
    
    cell.textLabel.text = _servCon.reposArray[indexPath.row].name;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

-(void)transition {
    CATransition* transition = [CATransition animation];
    transition.duration = 0.5;
    transition.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    transition.type = kCATransitionFade;
    [self.navigationController.view.layer addAnimation:transition forKey:nil];
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DetailedReposController *detailCon = [[DetailedReposController alloc] init];
    detailCon.login = _servCon.reposArray[indexPath.row].owner.login;
    detailCon.forks = _servCon.reposArray[indexPath.row].fork;
    detailCon.watchers = _servCon.reposArray[indexPath.row].watchers;
    detailCon.avatar = _servCon.reposArray[indexPath.row].owner.avatarUrl;
    //detailCon.desc = _servCon.reposArray[indexPath.row].descrip;
    _servCon.repositories = _servCon.reposArray[indexPath.row].name;
    [_servCon requestCommit:^(NSMutableArray<Commits *> *internalblock) {
        detailCon.commitArray = internalblock;
        [detailCon.tableView reloadData];
    }];
    [self.navigationController pushViewController:detailCon animated:YES];
    [self transition];
}

@end
