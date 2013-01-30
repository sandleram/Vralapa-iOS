//
//  SQLiteDatabase.h
//  Vralapa
//
//  Created by Vitor Venturin Linhalis on 29/01/13.
//  Copyright (c) 2013 Starfuckers Inc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>

@interface SQLiteDatabase : NSObject {
    sqlite3 *database;
}

- (id)initWithPath:(NSString *)path;
- (NSArray *)performQuery:(NSString *)query;

@end