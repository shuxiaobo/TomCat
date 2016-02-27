//
//  ViewController.m
//  TomCat
//
//  Created by 书 山 on 15/3/30.
//  Copyright (c) 2015年 书 山. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    NSDictionary *dict;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSBundle *nsb = [NSBundle mainBundle];
    
    NSString *path = [nsb pathForResource:@"imageDic" ofType:@"plist"];
    
    dict = [NSDictionary dictionaryWithContentsOfFile:path];
    
}
- (IBAction)doRun:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self animationRun:@"angry" count:26];
            break;
        case 2:
            [self animationRun:@"scratch" count:56];
            break;
        case 3:
            [self animationRun:@"pie" count:24];
            break;
        case 4:
            [self animationRun:@"cymbal" count:13];
            break;
        case 5:
            [self animationRun:@"drink" count:81];
            break;
        case 6:
            [self animationRun:@"fart" count:28];
            break;
    }
    
}

- (void)animationRun:(NSString *)name count:(int)count{
    
    if(_coreImage.isAnimating)
        return;
    
    NSMutableArray *images = [NSMutableArray array];
    
    for (int i = 0; i < count; ++i) {
        
        [images addObject:[UIImage imageNamed:[NSString stringWithFormat:@"%@_%02d.jpg", name, i]]];
        
    }
    
    _coreImage.animationImages = images;
    
    _coreImage.animationRepeatCount = 1;
    
    _coreImage.animationDuration = 0.1 * count;
    
    [_coreImage startAnimating];
    
    

}
- (IBAction)anotherRunMethod:(UIButton *)sender {
    
    NSString *ind = [NSString stringWithString:[sender titleForState:UIControlStateNormal]];
    [self animationRun:[sender titleForState:UIControlStateNormal]
                 count:[dict[ind] intValue]+1];
}


@end
