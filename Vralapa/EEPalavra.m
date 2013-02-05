//
//  EEPalavra.m
//  Vralapa
//
//  Created by Erich Egert on 1/28/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEPalavra.h"
#import "SQLiteDatabase.h"
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

+(NSArray*) todasPalavrasCompativeisCom: (NSString*) palavra{
    SQLiteDatabase *database = [[SQLiteDatabase alloc] init];
    
    NSNumber *produto = [EEPrimos produtoParaPalavra:palavra];
    NSLog(@"PRODUTO CALCULADO: %@", [produto description]);
    
    NSString *busca = [NSString stringWithFormat:@"SELECT ZORIGINAL FROM ZEEPALAVRA WHERE %@ %% ZPRODUTOPRIMOS = 0", [produto description]];
    
    return [database performQuery:busca];
}

+(NSArray*) todasPalavrasCompativeisCom: (EEPalavra*) palavra andContext: (NSManagedObjectContext*) context{

    return nil;
}

+(NSFetchRequest*) createFetch:(NSManagedObjectContext*) context{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"EEPalavra"
                                              inManagedObjectContext:context];
    [fetchRequest setEntity:entity];
    
    return fetchRequest;
}

@end
