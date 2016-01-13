//
//  GGListMoviesViewController.m
//  GGMovie
//
//  Created by viethq on 12/30/15.
//  Copyright © 2015 viethq. All rights reserved.
//

#import "GGListMoviesViewController.h"
#import "WSApi.h"
#import "GGDiscoverInfo.h"
#import "GGDiscoverListCell.h"
#import "GGDetailMovieViewController.h"

@interface GGListMoviesViewController () <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *mTblView;
@property (strong, nonatomic) NSMutableArray<GGDiscoverModel*> *mDatasource;

@end

@implementation GGListMoviesViewController

#pragma mark - Init
-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self)
    {
        self.mDatasource = [[NSMutableArray alloc] initWithCapacity:50];
    }
    
    return self;
}


#pragma mark - View life circle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /* title */
    self.title = @"Movies";
    
    /* tbv */
    NSString *pNibName = NSStringFromClass([GGDiscoverListCell class]);
    [self.mTblView registerNib: [UINib nibWithNibName:pNibName bundle:nil]
        forCellReuseIdentifier: pNibName];
    
    self.mTblView.delegate = self;
    self.mTblView.dataSource = self;
    
    /* get data */
    [self getListMoviesWithRefresh: NO];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    /* title view */
    self.title = @"Movies";
}

#pragma mark - Get list
- (void)getListMoviesWithRefresh:(BOOL)isRefresh
{
    SHOW_LOADING;
    [WSApi getListMoviesWithComplete:^(WSObjectBase * _Nullable response, NSError * _Nullable error) {
        
        dispatch_async(dispatch_get_main_queue(), ^{
            HIDE_LOADING;
        });

        if (response)
        {
            GGDiscoverInfo *pInfo = (GGDiscoverInfo*)response;
            [self.mDatasource addObjectsFromArray: pInfo.mDatasource];
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [self.mTblView reloadData];
            });
        }
        else
        {
        
        }
    }];
}

#pragma mark - TableView delegate & datasource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.mDatasource.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 206.0f;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *pNibName = NSStringFromClass([GGDiscoverListCell class]);
    GGDiscoverListCell *pCell = [tableView dequeueReusableCellWithIdentifier:pNibName];
    
    GGDiscoverModel *pCellData = self.mDatasource[indexPath.row];
    [pCell.mImage sd_setImageWithURL:[NSURL URLWithString: [NSString stringWithFormat: @"%@%@", BG_BACKDROP_PATH, pCellData.backdrop_path]]];
    pCell.mLabel.text = pCellData.original_title;
    
    return pCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGDetailMovieViewController *pDetailViewController = [[GGDetailMovieViewController alloc] initWithNibName:nil bundle:nil];
    pDetailViewController.mDetailModel = self.mDatasource[indexPath.row];
    [MAIN_NAV pushViewController:pDetailViewController animated:YES];
}

@end
