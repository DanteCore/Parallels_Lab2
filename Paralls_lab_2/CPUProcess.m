//
//  CPUProcess.m
//  Paralls_lab_2
//
//  Created by Serhii Onopriienko on 4/27/15.
//  Copyright (c) 2015 com.purchase.test1. All rights reserved.
//

#import "CPUProcess.h"


@implementation CPUProcess



-(instancetype)initWithId:(NSInteger)procId {
    
    self = [super init];
    
    if (self) {
        
        self.procId = procId;
    }
    
    return self;
}



@end
