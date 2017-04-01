//
//  ViewController.m
//  coreImage
//
//  Created by 侯孟杰 on 17/4/1.
//  Copyright © 2017年 迈时科技. All rights reserved.
//

#import "ViewController.h"

@interface ViewController (){
    UIImageView *_imageView;
    UIButton *_button;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _imageView= [[UIImageView alloc]initWithFrame:self.view.frame];
    
    _imageView.image= [UIImage imageNamed:@"启动页.png"];
    
    _imageView.contentMode=UIViewContentModeScaleAspectFill;
    
    [self.view addSubview:_imageView];
    
    _button= [UIButton buttonWithType:UIButtonTypeCustom];
    
    _button.frame=CGRectMake(100,600,50,50);
    
    [_button setTitle:@"TICK"forState:UIControlStateNormal];
    
    _button.backgroundColor= [UIColor brownColor];
    
    [_button addTarget:self action:@selector(addBlurFilter)forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_button];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)addBlurFilter{
    
    //1、原图 （注意：图片的形式要转化成CIImage的形式，否则会找不到图片）
    
    CIImage *inputImage = [CIImage imageWithCGImage:_imageView.image.CGImage];
    
    //2、滤镜
    
    CIFilter *filter = [CIFilter filterWithName:@"CIBoxBlur"];
    
    //NSLog(@"%@",[CIFilter filterNamesInCategory:kCICategoryBlur]);
    
    NSLog(@"%@",filter.attributes);
    
    [filter setValue:inputImage forKey:kCIInputImageKey];
    
    [filter setValue:@5 forKey:kCIInputRadiusKey];
    
    //3、CIContext图像的上下文
    
    CIContext*context = [CIContext contextWithOptions:nil];
    
    CIImage*outupImage = filter.outputImage;
    
    CGImageRef imageRef = [context createCGImage:outupImage fromRect:outupImage.extent];
    
    _imageView.image= [UIImage imageWithCGImage:imageRef];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
