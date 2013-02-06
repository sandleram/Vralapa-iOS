//
//  EEPosicao.m
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEPosicao.h"

@implementation EEPosicao

@synthesize x,y,margin, passo;

-(id) initWithX: (float) _x andY: (float) _y andMargin: (float) _margin andPasso:(float) _passo{
    self =[super init];
    
    if (self){
        x = _x;
        y = _y;
        margin = _margin;
        passo = _passo;
    }
    
    return self;
}

-(EEPosicao*) proxima {
    return [[EEPosicao alloc] initWithX:[self x]+[self passo]+[self margin] andY:[self y] andMargin:[self margin] andPasso:[self passo]];
}

-(EEPosicao*) deNumero: (int) numero {
    if (numero == 0) return  self;
    return [[EEPosicao alloc] initWithX:[self x]+([self passo]+[self margin])*numero andY:[self y] andMargin:[self margin] andPasso:[self passo]];
}
@end
