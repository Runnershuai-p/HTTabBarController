//
//  BSLTabBar.m
//  AlipayDemo
//
//  Created by shuai pan on 2017/4/25.
//  Copyright © 2017年 foreveross. All rights reserved.
//

#import "HTTabBar.h"
#import "HexColors.h"
#import "HTBarModel.h"
#import "UIImage+HTTool.h"


@interface HTTabBar () {
    
}

@property (nonatomic ,strong) HTTabBarItem *item;
@end

@implementation HTTabBar

#pragma mark - Public Method

- (id)initWithFrame:(CGRect)frame {

    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor hx_colorWithHexRGBAString:@"#F5F5F5"];
//        [self htTabBarItemControls];
    }
    return self;
}
- (void)loadBundleSourceFile:(NSString *)sourceFile {

    NSArray *dataArray = [HTBarModelTool massProductionWithHTBarModels:sourceFile];
//    [self htTabBarItemControls:dataArray];
    __weak typeof(self) weakSelf = self;
    
    if (!dataArray && dataArray.count < 1) return;
    for (int i = 0; i < dataArray.count; i++) {
        
        HTTabBarItem *item = [[HTTabBarItem alloc] initWithFrame:CGRectZero];
        item.barModel = (HTBarModel*)dataArray[i];
        item.index = i;
        [self addSubview:item];
        [self.itemsArray addObject:item];
    }
    for (HTTabBarItem *item in self.itemsArray) {
        
        [item tabBarItemSelected:self.itemsArray selectCallBack:^{
            if (weakSelf.delegate && [weakSelf.delegate respondsToSelector:@selector(htTabBar:selectIndex:)]) {
                [weakSelf.delegate htTabBar:weakSelf selectIndex:item.index];
            }
        }];
    }

}

- (void)setSelectIndex:(NSInteger)selectIndex {
    _selectIndex = selectIndex;
    for (HTTabBarItem *tabBarItem  in self.itemsArray) {
        tabBarItem.selected = NO;
    }
    if (self.itemsArray.count > 0) {
        ((HTTabBarItem *)self.itemsArray[_selectIndex]).selected = YES;
    }
}
#pragma mark - Private Method

//- (void)htTabBarItemControls {
//    
//
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat self_w = CGRectGetWidth(self.frame);
    CGFloat self_h = CGRectGetHeight(self.frame);
    for (int i = 0; i < self.itemsArray.count; i++) {
        CGFloat item_w = self_w/self.itemsArray.count;
        HTTabBarItem *item = self.itemsArray[i];
        item.frame = CGRectMake(item_w*i, 0.f, item_w, self_h);
    }
    
    
}
- (void)drawRect:(CGRect)rect {
    
    CGFloat self_w = CGRectGetWidth(self.frame);
//    CGFloat self_h = CGRectGetHeight(self.frame);
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(0.f, 0.f)];
    [path addLineToPoint:CGPointMake(self_w, 0.f)];
    path.lineWidth = 0.3f;
    [[UIColor hx_colorWithHexRGBAString:@"#000000"] setStroke];
    [path stroke];
}


- (NSMutableArray *)itemsArray {
    if (!_itemsArray) {
        _itemsArray = [NSMutableArray arrayWithCapacity:2];
    }
    return _itemsArray;
}

@end





#define IMAGE_MARGIN_TOP 5.f

#define TITLE_HEIGHT 15.f

#define TITLE_MARGIN_LASTTOP 3.f


@interface HTTabBarItem  () {
    CGPoint _centerPoint;
}

@property (nonatomic ,strong) UIImageView *imageView;
@property (nonatomic ,strong) UILabel *titleLabel;

@property (nonatomic ,strong) UIColor *selectColor;
@property (nonatomic ,strong) UIColor *normalColor;


//@property (nonatomic ,strong) NSMutableArray *images;

@property (nonatomic ,strong) NSArray *itmesContainer;

@property (nonatomic ,copy) void(^selectCallBack)(void);



@end

@implementation HTTabBarItem

#pragma mark - Public Method
- (void)tabBarItemSelected:(NSArray *)tabBarItems selectCallBack:(void(^)(void))selectBlock {
    self.itmesContainer = tabBarItems;

    if (selectBlock) {
        self.selectCallBack = selectBlock;
    }
}
- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.imageView];
        [self addSubview:self.titleLabel];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickAction)];
        [self addGestureRecognizer:tap];
    }
    return self;
}
- (void)setBarModel:(HTBarModel *)barModel {
    _barModel = barModel;
    self.selected = NO;
}

- (void)setSelected:(BOOL)selected {
    _selected = selected;
    if (_selected) {
        self.imageView.image  = [UIImage imageNamed:self.barModel.select];
        self.titleLabel.textColor = self.selectColor;
    }
    else {
        self.imageView.image  = [UIImage imageNamed:self.barModel.normal];
        self.titleLabel.textColor = self.normalColor;
    }
    
    self.titleLabel.text  = self.barModel.title;
}


#pragma mark - Private Method
- (void)clickAction {
    for (HTTabBarItem *tabBarItem  in self.itmesContainer) {
        tabBarItem.selected = NO;
    }
    self.selected = !self.selected;
    if (self.selectCallBack) {
        self.selectCallBack();
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat self_w = CGRectGetWidth(self.frame);
    CGFloat self_h = CGRectGetHeight(self.frame);
    
    CGFloat imag_y = IMAGE_MARGIN_TOP;
    CGFloat imag_h = self_h - imag_y - (TITLE_HEIGHT + TITLE_MARGIN_LASTTOP);
    CGFloat imag_w = imag_h;
    CGFloat imag_x = (self_w-imag_w)/2;

    self.imageView.frame = CGRectMake(imag_x, imag_y, imag_w, imag_h);
    
    CGFloat title_y = CGRectGetMaxY(self.imageView.frame) + TITLE_MARGIN_LASTTOP;
    self.titleLabel.frame = CGRectMake(10.f, title_y , self_w-20.f, TITLE_HEIGHT-3.f);

   
}
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    }
    return _imageView;
}
- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.font = [UIFont systemFontOfSize:11.f];
        _titleLabel.textColor = self.normalColor;
    }
    return _titleLabel;
}


- (UIColor *)selectColor {
    if (self.barModel.select.length > 0) {
        return [[UIImage imageNamed:self.barModel.select] colorWithImage:1.f];
    }
    return [UIColor hx_colorWithHexRGBAString:@"#696969"];
}
- (UIColor *)normalColor {
    return [UIColor hx_colorWithHexRGBAString:@"#696969"];
}
@end
