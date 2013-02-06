//
//  EEPalavra.m
//  Vralapa
//
//  Created by Erich Egert on 1/28/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEPalavra.h"
#import "EEPrimos.h"


@implementation EEPalavra

@dynamic original;
@dynamic produtoPrimos;
@dynamic sanitizado;
@dynamic tamanho;

+(EEPalavra*) palavraComContext:(NSManagedObjectContext*) context eValor: (NSString*) palavra {
    EEPalavra *nova =  [NSEntityDescription insertNewObjectForEntityForName:@"EEPalavra"
                                                     inManagedObjectContext:context];
    
    [nova setOriginal: [palavra uppercaseString]];
    NSNumber *produtoDosPrimos = [EEPrimos produtoParaPalavra:palavra];
    [nova setProdutoPrimos:produtoDosPrimos];
    
    return nova;
}

-(void) colocaNaView: (UIView*) view aPartirDaCoordenada: (int) x eAbssissa: (int) y {
    for (int i = 0; i< [[self original] length]; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(x+i*40, y, 30, 30)];
        [label setText: [NSString stringWithFormat:@"%c", [[self original] characterAtIndex:i]]];
        [label setTextAlignment:NSTextAlignmentCenter];
        [view addSubview:label];
    }
}

+(NSArray*) todasPalavrasCompativeisCom: (NSString*) palavra andContext: (NSManagedObjectContext*) context{
    NSNumber *produto = [EEPrimos produtoParaPalavra:palavra];
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"modulus:by:(%@, produtoPrimos) == 0", [produto description]];
    NSFetchRequest *fetchRequest = [EEPalavra createFetch:context];
    [fetchRequest setPredicate:predicate];
    
    return [context executeFetchRequest: fetchRequest error:nil];
}

+(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EEPalavra"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    return fetchRequest;
}

@end
