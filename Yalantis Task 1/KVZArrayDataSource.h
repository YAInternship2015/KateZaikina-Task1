//
//  KVZArrayDataSource.h
//  Yalantis Task 1
//
//  Created by kateryna.zaikina on 15.08.15.
//  Copyright (c) 2015 kateryna.zaikina. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@class KVZArrayDataSource;

@protocol KVZArrayDataSourceDelegate <NSObject>

- (void)arrayDataSourceDidChange:(KVZArrayDataSource *)arrayDataSource;

@end

#warning тут получается., что у этого объекта аж три ответственности - он и данные хранит, и UITableViewDataSource, и UICollectionViewDataSource. Лучше разделить его на три отдельных объекта, либо убрать UITableViewDataSource и UICollectionViewDataSource в контроллеры (хотя лучше все-таки три объекта)

@interface KVZArrayDataSource : NSObject <UITableViewDataSource, UICollectionViewDataSource>

#warning зачем показывать массив в *.h? К нему вроде никто не обращается извне
@property (nonatomic, strong) NSArray *array;
@property (nonatomic, weak) id <KVZArrayDataSourceDelegate> delegate;

@end
