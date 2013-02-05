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
    
    NSString *busca = [NSString stringWithFormat:@"SELECT DISTINCT(ZORIGINAL) FROM ZEEPALAVRA WHERE %@ %% ZPRODUTOPRIMOS = 0",
                       [produto description]];
    
    NSArray *resultado = [database performQuery:busca];
    
    NSArray *palavras = [resultado map:^(id linha) {
        return (id) [[linha objectAtIndex:0] description];
    }];
    
    return palavras;
}

+(NSArray*) todasPalavrasCompativeisCom: (NSString*) palavra andContext: (NSManagedObjectContext*) context{
    NSNumber *produto = [EEPrimos produtoParaPalavra:palavra];
    
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
