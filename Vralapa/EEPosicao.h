//
//  EEPosicao.h
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EEPosicao : NSObject

@property(nonatomic) float x;
@property(nonatomic) float y;
@property(nonatomic) float margin;
@property(nonatomic) float passo;

-(id) initWithX: (float) _x andY: (float) _y andMargin: (float) _margin andPasso: (float) passo;

-(EEPosicao*) deNumero: (int) numero;

-(EEPosicao*) proxima;

@end
