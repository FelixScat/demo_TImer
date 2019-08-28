//
//  ViewController.m
//  demo
//
//  Created by FelixPlus on 2019/8/28.
//  Copyright © 2019 Felix. All rights reserved.
//

#import "ViewController.h"
#import "TimerProxy.h"

@interface ViewController ()

@property (nonatomic, strong) NSTimer *t;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)startTImer {
    
    _t = [NSTimer timerWithTimeInterval:1.0f target:[TimerProxy proxyWithObject:self] selector:@selector(someBussiness) userInfo:nil repeats:true];
    
    [[NSRunLoop currentRunLoop] addTimer:_t forMode:NSRunLoopCommonModes];
}

- (void)someBussiness {
    
    NSLog(@"timer triggered");
}

- (void)dealloc {
    
    NSLog(@"Controller dealloc");
    
    if (self.t) {
        
        [self.t invalidate];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.presentingViewController) {
        [self dismissViewControllerAnimated:true completion:nil];
    }else {
        
        ViewController *vc = ViewController.new;
        vc.view.backgroundColor = UIColor.grayColor;
        [self presentViewController:vc animated:true completion:nil];
        [vc startTImer];
    }
}


@end
