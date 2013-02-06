//
//  EELetra.m
//  Vralapa
//
//  Created by Erich Egert on 2/6/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EELetra.h"


@implementation EELetra



-(id) initWithCaracter: (char) letra naView: (UIView*) view andX: (int) x andY: (int) y {
    self = [super initWithFrame:(CGRectMake(x, y, 30, 30))];

    if (self) {
        [self setText: [NSString stringWithFormat:@"%c", letra]];
        [self setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:self];
    }
    return self;
}



+(void) colocaPalavra: (EEPalavra*) palavra naView: (UIView*) view aPartirDaCoordenada: (int) x eAbssissa: (int) y {
    
    for (int i = 0; i< [[palavra original] length]; i++) {
        char caracter = [[palavra original] characterAtIndex:i];
        EELetra *letra = [[EELetra alloc] initWithCaracter:caracter naView:view andX:x+i*40 andY:y ];
        
        UITapGestureRecognizer *onTap = [[UITapGestureRecognizer alloc] initWithTarget:letra action:@selector(lidaComClique)];
        [onTap setNumberOfTapsRequired:1];
        
        [letra addGestureRecognizer:onTap];
        [letra setUserInteractionEnabled:YES];
    }
    
}

-(void) lidaComClique {
    NSLog(@"Clicado em: %@", [self text]);
}

@end
