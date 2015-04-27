//
//  CPU1.h
//  Paralls_lab_2
//
//  Created by Serhii Onopriienko on 4/27/15.
//  Copyright (c) 2015 com.purchase.test1. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CPUProcess.h"



@interface CPU : NSObject


-(instancetype)initWithId:(NSInteger)cpuId
                   queque:(dispatch_queue_t)queue
                    group:(dispatch_group_t) group;



- (void)excecuteProcess:(CPUProcess *)process
              onSuccess:(void(^)(void))success;

@end
