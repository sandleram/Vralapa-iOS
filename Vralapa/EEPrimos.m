//
//  EEPrimes.m
//  Vralapa
//
//  Created by Erich Egert on 2/4/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEPrimos.h"

@implementation EEPrimos


+(NSNumber*) produtoParaPalavra: (NSString*) palavra {
    NSString *palavraMaiuscula = [palavra uppercaseString];
    
    static NSArray * primos = nil;
    
    if (!primos) {
        primos = [NSArray arrayWithObjects:
            [NSNumber numberWithLong:2],  [NSNumber numberWithLong:3],  [NSNumber numberWithLong:5],
            [NSNumber numberWithLong:7],  [NSNumber numberWithLong:11], [NSNumber numberWithLong:13],
            [NSNumber numberWithLong:17], [NSNumber numberWithLong:19], [NSNumber numberWithLong:23],
            [NSNumber numberWithLong:29], [NSNumber numberWithLong:31], [NSNumber numberWithLong:37],
            [NSNumber numberWithLong:41], [NSNumber numberWithLong:43], [NSNumber numberWithLong:47],
            [NSNumber numberWithLong:53], [NSNumber numberWithLong:59], [NSNumber numberWithLong:61],
            [NSNumber numberWithLong:67], [NSNumber numberWithLong:71], [NSNumber numberWithLong:73],
            [NSNumber numberWithLong:97], [NSNumber numberWithLong:101],[NSNumber numberWithLong:103],
            [NSNumber numberWithLong:107], [NSNumber numberWithLong:109],[NSNumber numberWithLong:113],
                                            nil];
    }
    
    NSMutableDictionary *primosPorLetra = nil;
    if (!primosPorLetra) {
        primosPorLetra = [[NSMutableDictionary alloc] init];
        
        NSString *letras =  @"AEIOUBCDSFGLMNPÇRTVHQJKZYXW";

        for (int i = 0; i < [letras length]; i++) {
            [primosPorLetra setObject:[primos objectAtIndex:i] forKey:[ NSString stringWithFormat:@"%c",[letras characterAtIndex:i]]];
        }

    }
    
    long produto = 1;
    
    for (int i = 0; i < [palavraMaiuscula length]; i++) {
        NSNumber *primo = [ primosPorLetra objectForKey:
                           [NSString stringWithFormat:@"%c", [palavraMaiuscula characterAtIndex:i]] ];
                           
        produto *= [primo longValue];
    }
    
    return [NSNumber numberWithLong: produto];
}

@end
