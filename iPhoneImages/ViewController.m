//
//  ViewController.m
//  iPhoneImages
//
//  Created by Jaison Bhatti on 2017-09-25.
//  Copyright © 2017 Jaison Bhatti. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *iPhoneImageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *url = [NSURL URLWithString:@"https://i.imgur.com/bktnImE.png"]; // 1
    
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration]; // 2
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration]; // 3
    
    NSURLSessionDownloadTask *downloadTask = [session downloadTaskWithURL:url completionHandler:^(NSURL* location, NSURLResponse* response, NSError* error){
        
        if (error) { // 1
            //Handle the error
            NSLog(@"error: %@", error.localizedDescription);
            return;
        }
        
        NSData *data = [NSData dataWithContentsOfURL:location];
        UIImage *image = [UIImage imageWithData:data]; // 2
        
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            //This will run on the main queue
            
            self.iPhoneImageView.image = image; //4
        }];
        
    }]; // 4
    
    [downloadTask resume];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
