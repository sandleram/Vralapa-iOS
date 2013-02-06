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
    
    [nova setOriginal:palavra];
    
    NSNumber *produtoDosPrimos = [EEPrimos produtoParaPalavra:palavra];
    
    [nova setProdutoPrimos:produtoDosPrimos];
    
    return nova;
}

+(NSArray*) todasPalavrasCompativeisCom: (NSString*) palavra andContext: (NSManagedObjectContext*) context{
    NSNumber *produto = [EEPrimos produtoParaPalavra:palavra];
    
    NSLog(@"PRODUTO: %@", [produto description]);
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"modulus:by:(%@, produtoPrimos) == 0", [produto description]];
    
    NSFetchRequest *fetchRequest = [EEPalavra createFetch:context];
    
    [fetchRequest setPredicate:predicate];
    
    NSArray *resultado = [context executeFetchRequest: fetchRequest error:nil];
    
    NSArray *palavras = [resultado map:^(id linha) {
        return (id) [linha original];
    }];
    
    return palavras;
}

+(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EEPalavra"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    return fetchRequest;
}

@end
