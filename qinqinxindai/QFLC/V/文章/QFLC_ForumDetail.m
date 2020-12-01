//
//  QFLC_ForumDetail.m
//  DiShuiManager
//
//  Created by zrmac on 27.11.20.
//  Copyright © 2020 Eiu. All rights reserved.
//

#import "QFLC_ForumDetail.h"

@interface QFLC_ForumDetail ()


@end

@implementation QFLC_ForumDetail

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    self.title = _qflc_title;
    
    NSAttributedString *attrStr = [[NSAttributedString alloc] initWithData:[_content dataUsingEncoding:NSUnicodeStringEncoding] options:@{NSDocumentTypeDocumentAttribute:NSHTMLTextDocumentType} documentAttributes:nil error:nil];
    self.textView.attributedText = attrStr;

}
-(UITextView *)textView{
    
    if (!_textView) {
        self.textView = [[UITextView alloc] initWithFrame:CGRectMake(20, NaviHeight, KScreenWidth-40, KScreenHeight - NaviHeight)];
        _textView.backgroundColor = hexColor(f2f2f2);
        [self.view addSubview:_textView];
    }
    return _textView;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
