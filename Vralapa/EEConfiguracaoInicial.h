//
//  EEConfiguracaoInicial.h
//  Vralapa
//
//  Created by Erich Egert on 2/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EEConfiguracaoInicial : NSObject

@property AppDelegate *app;


-(id) initWithApplication: (AppDelegate*) application;

-(void) populaBancoSeNecessario;



@end
