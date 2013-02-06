//
//  ViewController.m
//  Vralapa
//
//  Created by Erich Egert on 1/28/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "EEPalavra.h"
#import "EELetra.h"
#import "EEPosicao.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize todasJogagas, palavraAtual;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
//    [EEPalavra palavraComContext:[self context] eValor:@"empada"];
//    [EEPalavra palavraComContext:[self context] eValor:@"zica"];
//    [EEPalavra palavraComContext:[self context] eValor:@"zebra"];
//    [EEPalavra palavraComContext:[self context] eValor:@"nuca"];
//    [EEPalavra palavraComContext:[self context] eValor:@"mapa"];
//    [EEPalavra palavraComContext:[self context] eValor:@"ema"];
//    [EEPalavra palavraComContext:[self context] eValor:@"dado"];
//    [self saveManagedContext];
    

    NSArray *compativeis = [EEPalavra todasPalavrasCompativeisCom:@"empada" andContext:[self context]];

    for (int i =0; i<[compativeis count]; i++) {
        EEPalavra *palavra = [compativeis objectAtIndex:i];
        
        EEPosicao *posicao = [[EEPosicao alloc] initWithX:30 andY:30*(i) andMargin:10 andPasso:30];
        
        [EELetra colocaPalavra:palavra naView:[self view] aPartirDaPosicao:posicao];
    }

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
