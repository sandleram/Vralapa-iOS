//
//  EELetra.h
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "EEPalavra.h"

@interface EELetra : UILabel


-(id) initWithCaracter: (char) letra naView: (UIView*) view andX: (int) x andY: (int) y;

-(void) lidaComClique;

+(NSArray*) colocaPalavra: (EEPalavra*) palavra naView: (UIView*) view aPartirDaCoordenada: (int) x eAbssissa: (int) y;

@end
