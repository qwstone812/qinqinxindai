

#import "VerifyNumberView.h"
#define kTextCount 3//3个字
@interface VerifyNumberView()

@property(nonatomic,strong)NSArray* changeArray;//数字
@property(nonatomic,strong)NSArray* typeArray;//加减乘除
@end

@implementation VerifyNumberView{
    NSString* _str;
    NSInteger _index1;
    NSInteger _index2;
    NSInteger _index3;//加减乘

}

- (instancetype)init
{
    self = [super init];
    if (self) {
//        self.layer.cornerRadius = 3;
//        self.layer.masksToBounds = YES;
        
        self.backgroundColor = kRandomColor;
//        UIImageView * imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"vertify_number_bg"]];
//        [self addSubview:imageView];
//        [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
//            make.top.bottom.left.right.equalTo(self);
//
//           }];
        [self changeCaptcha];
    }
    return self;
}

-(void)changeCaptcha{
    
    _index1 = arc4random() % (self.changeArray.count);
    _index2 = arc4random() % (self.changeArray.count);
     _index3 = arc4random() % 2;
    if (_index3 == 0) {
        _result = _index1+_index2;
    }else if (_index3 == 1){
        if(_index1 < _index2){
            NSInteger temp = _index1;
            _index1 = _index2;
            _index2 = temp;
        }
        _result = _index1-_index2;
    }
    
    _str = self.changeArray[_index1];
    
   
    _str = [_str stringByAppendingString:self.typeArray[_index3]];
    
    _str = [_str stringByAppendingString:self.changeArray[_index2]];
    
    
//    NSLog(@"%zd",_result);
}

-(void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    
    self.backgroundColor = kRandomColor;
    
    CGSize cSize = [@"S" sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]}];
    int width = rect.size.width/kTextCount - cSize.width;
    int height = rect.size.height - cSize.height;
    CGPoint point;
    
    float pX,pY;
    //绘制每个字
    for (int i =0 ; i < kTextCount ; i++) {
        pX = arc4random() % width + rect.size.width / kTextCount * i;
        pY = arc4random() % height;
        point = CGPointMake(pX, pY);
        
        NSString* strDraw = [_str substringWithRange:NSMakeRange(i, 1)];
        [strDraw drawAtPoint:point withAttributes:@{NSFontAttributeName:kRandomFontSize}];
    }
    
    //
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(ctx, 1.0);
    //干扰的彩色直线
    for (int i =0 ; i < 2 ; i++) {
        UIColor* color = kRandomColor;
        CGContextSetStrokeColorWithColor(ctx, color.CGColor);
        //设置线的起点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextMoveToPoint(ctx, pX, pY);
        //设置线终点
        pX = arc4random() % (int)rect.size.width;
        pY = arc4random() % (int)rect.size.height;
        CGContextAddLineToPoint(ctx, pX, pY);

        CGContextStrokePath(ctx);
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self changeCaptcha];
    
    [self setNeedsDisplay];
}

#pragma mark - 懒加载
-(NSArray *)changeArray{
    if (!_changeArray) {
        _changeArray = @[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9"];
    }
    return _changeArray;
}
-(NSArray *)typeArray{
    if (!_typeArray) {
        _typeArray = @[@"加",@"减"];
    }
    return _typeArray;
}

@end
