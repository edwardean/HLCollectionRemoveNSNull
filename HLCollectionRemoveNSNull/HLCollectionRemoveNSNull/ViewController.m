//
//  ViewController.m
//  HLCollectionRemoveNSNull
//
//  Created by lihang on 2017/11/2.
//  Copyright © 2017年 HerryLee. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+HLCollectionRemoveNSNull.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSString *rawJsonString = @"{\"myName\":null,\"vailedString\":\"I'm OK\",\"Date\":{\"useDay\":1,\"weekday\":\"\",\"null\":{\"null_1\":1,\"null_2\":[null,{\"null_3\":null,\"null_4\":[null, null],\"null_5\":[\"null_5_1\",[\"null_5_1_1\",{\"null_6\":{\"null_7\":null}}]]}]},\"dateItems\":[{\"endDate\":\"2017-11-04\",\"startDate\":\"2017-11-04\"},null]}}";
    NSError *error = nil;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:[rawJsonString
                                                             dataUsingEncoding:NSUTF8StringEncoding]
                                                    options:NSJSONReadingAllowFragments
                                                      error:&error];
    if (error) {
        NSLog(@"error: %@", error);
        return;
    }
    
    if (![jsonObject isKindOfClass:[NSDictionary class]]) {
        return;
    }
    
    NSLog(@"null object: %@", jsonObject);
    NSDictionary *removeNullObject = [jsonObject HLRemoveNullKeyValues];
    NSLog(@"removeNullObject object: %@", jsonObject);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
