//
//  MJProductViewController.m
//  00-彩票01-搭建基本框架_mp4_01
//
//  Created by Song on 17/4/7.
//  Copyright © 2017年 Song. All rights reserved.
//


// 'UICollectionView must be initialized with a non-nil layout parameter'
// 必须用一个非 nil 得 layout 参数来初始化 UICollectionView


#define MJProductCellID @"product"

#import "MJProductViewController.h"
#import "MJProduct.h"
#import "MJProductCell.h"

@interface MJProductViewController ()

@property(nonatomic,strong) NSArray *products;

@end

@implementation MJProductViewController

-(NSArray *)products {
    if (_products == nil) {
        
        // json文件的路径
        NSString *path = [[NSBundle mainBundle] pathForResource:@"products.json" ofType:nil];
        
        // 加载json文件
        NSData *data = [NSData dataWithContentsOfFile:path];
        
        // 将json数据转为NSArray 或者 NSDictionary
        NSArray *dictArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        // 将字典转成模型
        NSMutableArray *productArray = [NSMutableArray array];
        for (NSDictionary *dict in dictArray) {
            MJProduct *p = [MJProduct productWithDict:dict];
            [productArray addObject:p];
        }
        
        _products = productArray;
    }
    return _products;
}

-(instancetype)init {
    
    // 1.流水布局
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
//    self.products;
    layout.itemSize = CGSizeMake(80, 80);
    
    // 2.水平间距
    layout.minimumInteritemSpacing = 0;
    
    // 3.垂直间距
    layout.minimumLineSpacing = 10;
    
    // 四周间距：逆时针，上左下右
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 0, 10);
    
    
    return [super initWithCollectionViewLayout:layout];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Register cell classes
    // 注册cell(告诉collectionView将来创建怎样的cell)
    
    UINib *nib = [UINib nibWithNibName:@"MJProductCell" bundle:nil];
    
    // 注册
    [self.collectionView registerNib:nib forCellWithReuseIdentifier:MJProductCellID];
    
//    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:MJProductCellID];
    
    self.collectionView.backgroundColor = [UIColor yellowColor];
    
}



#pragma mark - 数据源方法
// 组
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {

    return 1;
}

// 组中的格子数
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return self.products.count;
}

// 格子的样式
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
//    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
//    static NSString *ID = @"product";
    
    // 1.获得cell
    MJProductCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:MJProductCellID forIndexPath:indexPath];
    
//    cell.backgroundColor = [UIColor blueColor];
    
    // 2.传递模型
    cell.product = self.products[indexPath.item];
    
    return cell;
}

#pragma mark - 代理方法

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    MJProduct *p = self.products[indexPath.item];
    NSLog(@"点击了 --- %@",p.title);
}

@end
