//
//  EEPalavra.m
//  Vralapa
//
//  Created by Erich Egert on 1/28/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import "EEPalavra.h"

@implementation EEPalavra

@dynamic original;
@dynamic produtoPrimos;
@dynamic sanitizado;
@dynamic tamanho;

+(EEPalavra*) palavraWithContext:(NSManagedObjectContext*) context {
    return [NSEntityDescription insertNewObjectForEntityForName:@"EEPalavra"
                                         inManagedObjectContext:context];
}

+(NSArray*) todasPalavrasCompativeisCom: (EEPalavra*) palavra andContext: (NSManagedObjectContext*) context{
    NSFetchRequest *fetchRequest = [EEPalavra createFetch: context];
    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name='Jane'"];
//    [fetchRequest setPredicate:predicate];
    
//    NSString *clause = [NSString stringWithFormat:@"produtoPrimos %% %d = 0",
//                        [[palavra produtoPrimos] intValue]];
//
//    NSExpression *campo = [NSExpression expressionForKeyPath:@"produtoPrimos"];
//    
//    NSString *clause = [NSString stringWithFormat:@"%d MOD(produtoPrimos) == 0",
//                        [[palavra produtoPrimos] intValue]];
//    
//    NSExpression *exp = [NSExpression expressionWithFormat:clause
//                                             argumentArray:
//                         [NSArray arrayWithObject:campo]];
//    
//    NSPredicate *predicate = [NSPredicate predicateWithFormat:clause];
    
    
//    [fetchRequest setPredicate:predicate];
    
    
    
//    }
    
    
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
