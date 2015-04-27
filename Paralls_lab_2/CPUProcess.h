//
//  CPUProcess.h
//  Paralls_lab_2
//
//  Created by Serhii Onopriienko on 4/27/15.
//  Copyright (c) 2015 com.purchase.test1. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CPUProcess : NSObject


@property (nonatomic,assign) NSInteger procId;


-(instancetype)initWithId:(NSInteger)id;


@end
