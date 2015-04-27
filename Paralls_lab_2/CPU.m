//
//  CPU1.m
//  Paralls_lab_2
//
//  Created by Serhii Onopriienko on 4/27/15.
//  Copyright (c) 2015 com.purchase.test1. All rights reserved.
//

#import "CPU.h"


@interface CPU()

@property dispatch_queue_t queue;
@property dispatch_group_t group;
@property NSInteger cpuId;

@end




@implementation CPU

-(instancetype)initWithId:(NSInteger)cpuId
                   queque:(dispatch_queue_t)queue
                    group:(dispatch_group_t) group {
    
    self = [super init];
    
    if (self) {
        
        self.queue = queue;
        self.group = group;
        self.cpuId = cpuId;
    }
    
    return self;
}





- (void)excecuteProcess:(CPUProcess *)process
              onSuccess:(void(^)(void))success {
    
    dispatch_group_async(self.group, self.queue, ^{
        
        NSLog(@"CPU %ld is executing process %ld", (long)self.cpuId, (long)process.procId);
        [NSThread sleepForTimeInterval:(arc4random_uniform(100) + 50) / 50];
        NSLog(@"CPU %ld finished process %ld",(long)self.cpuId, (long)process.procId);
        
        success();
    });
}




@end
