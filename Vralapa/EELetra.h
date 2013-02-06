//
//  EELetra.h
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EEPalavra.h"
#import "EEPosicao.h"

@interface EELetra : UILabel

@property(nonatomic, strong) EEPosicao* posicao;


-(id) initWithCaracter: (char) letra naView: (UIView*) view andPosicao: (EEPosicao*) posicao;

-(void) lidaComClique;

+(NSArray*) colocaPalavra: (EEPalavra*) palavra naView: (UIView*) view aPartirDaPosicao:(EEPosicao*) posicao;

@end
