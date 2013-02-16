//
//  EEPalavra.h
//  Vralapa
//
//  Created by Erich Egert on 1/28/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EEPalavra : NSManagedObject

@property (nonatomic, retain) NSString * original;
@property (nonatomic, retain) NSNumber * produtoPrimos;
@property (nonatomic, retain) NSString * sanitizado;
@property (nonatomic, retain) NSNumber * tamanho;

+(EEPalavra*) palavraComContext:(NSManagedObjectContext*) context eValor: (NSString*) palavra;

+(NSArray*) todasPalavrasCompativeisCom: (NSString*) palavra andContext: (NSManagedObjectContext*) context;

+(BOOL) semPalavrasSalvasNoContext: (NSManagedObjectContext*)  context;

-(void) colocaNaView: (UIView*) view aPartirDaCoordenada: (int) x eAbssissa: (int) y;

@end
