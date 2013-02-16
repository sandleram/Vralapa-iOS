//
//  EEConfiguracaoInicial.m
//  Vralapa
//
//  Created by Erich Egert on 2/16/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEConfiguracaoInicial.h"
#import "EEPalavra.h"
#import "AppDelegate.h"

@implementation EEConfiguracaoInicial

@synthesize app;

-(id) initWithApplication:(AppDelegate*) application {
    self = [super init];

    if (self) {
        app = application;
    }
    
    return self;
}
-(void) populaBancoSeNecessario {
    NSManagedObjectContext *ctx = [app managedObjectContext];
    
    if ([EEPalavra semPalavrasSalvasNoContext: ctx]) {
        NSString *localArquivo = [[NSBundle mainBundle] pathForResource:@"palavras" ofType:@"txt"];
        NSString *conteudoArquivo = [[NSString alloc] initWithContentsOfFile:localArquivo encoding:nil error:nil];
        
        NSArray *palavras = [conteudoArquivo componentsSeparatedByString: @"\n"];
        
        for (NSString *p in palavras) {
            EEPalavra *palavra = [EEPalavra palavraComContext:ctx eValor:p];
            NSLog(@"Salvando palavra: %@", [palavra description]);
        }
        
        [app saveContext];
    }
}

@end
