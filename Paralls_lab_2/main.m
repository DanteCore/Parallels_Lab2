//
//  main.m
//  Paralls_lab_2
//
//  Created by Serhii Onopriienko on 4/27/15.
//  Copyright (c) 2015 com.purchase.test1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPU.h"
#import "CPUProcess.h"



#define QUEQUE_MAX_SIZE 5
int queue_size;
dispatch_semaphore_t semaphore;




int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        semaphore = dispatch_semaphore_create(1);
        
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue1 = dispatch_queue_create("queue1", DISPATCH_QUEUE_SERIAL);
        dispatch_queue_t queue2 = dispatch_queue_create("queue2", DISPATCH_QUEUE_SERIAL);
        
        CPU *cpu1 = [[CPU alloc]initWithId:1 queque:queue1 group:group];
        CPU *cpu2 = [[CPU alloc]initWithId:2 queque:queue2 group:group];
        
        
        __block int queue_size = 0;
        NSObject *syncObj = [[NSObject alloc] init];
        
        
        
        
        
        for (int i = 0; i < 20; i++) {
            
            CPUProcess *process = [[CPUProcess alloc]initWithId:i];
            
            if (queue_size < QUEQUE_MAX_SIZE) {
                
                @synchronized(syncObj) {
                    queue_size++;
                }
                
                NSLog(@"------>process %ld forced to cpu1", (long)process.procId);
                [cpu1 excecuteProcess:process onSuccess:^{
                    
                    @synchronized(syncObj) {
                        queue_size--;
                    }
                }];
                
                
            } else {
                NSLog(@"------>process %ld goes to cpu2", (long)process.procId);
                [cpu2 excecuteProcess:process onSuccess:^{}];
            }
            
            
            [NSThread sleepForTimeInterval:0.2];
        }
        
        
        
        
        NSLog(@"==========All tasks are launched");
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"==========Well done");
    }
    
    return 0;
}
