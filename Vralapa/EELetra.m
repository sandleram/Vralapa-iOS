//
//  EELetra.m
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EELetra.h"


@implementation EELetra



-(id) initWithCaracter: (char) letra naView: (UIView*) view andPosicao: (EEPosicao*) posicao {

    
    self = [super initWithFrame:(CGRectMake([posicao x], [posicao y], [posicao passo], [posicao passo]))];

    if (self) {
        [self setText: [NSString stringWithFormat:@"%c", letra]];
        [self setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:self];
        
        UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(lidaComClique)];
        [onTap setNumberOfTapsRequired:1];
        
        [self addGestureRecognizer:onTap];
        [self setUserInteractionEnabled:YES];
    }
    return self;
}

+(NSArray*) colocaPalavra: (EEPalavra*) palavra naView: (UIView*) view aPartirDaPosicao:(EEPosicao *)posicao {
    NSMutableArray *letras = [[NSMutableArray alloc] init];
    for (int i = 0; i< [[palavra original] length]; i++) {
        char caracter = [[palavra original] characterAtIndex:i];
        [letras addObject: [[EELetra alloc] initWithCaracter:caracter naView:view andPosicao:[posicao deNumero:i]] ];
    }
    
    return letras;
}

-(void) lidaComClique {
    [self setAlpha: 0.0];
    
    [UIView animateWithDuration:1.0 delay:0 options:UIViewAnimationOptionAllowUserInteraction animations:^(void) {
        [self setAlpha:1.0];
    }completion:^(BOOL finished) {
        [self setAlpha:1.0];        
    }];
}

@end
