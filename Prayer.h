//
//  Prayer.h
//  pbdbbuilder
//
//  Created by Arash Payan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Prayer : NSObject {
	NSString *title;
	NSString *citation;
	NSString *author;
	NSString *text;
	NSString *category;
	NSString *language;
	long prayerId;
}

@property(nonatomic, copy) NSString *title;
@property(nonatomic, copy) NSString *citation;
@property(nonatomic, copy) NSString *author;
@property(nonatomic, copy) NSString *text;
@property(nonatomic, copy) NSString *category;
@property(nonatomic, copy) NSString *language;
@property(nonatomic) long prayerId;

- (id)initWithId:(long)anId
		   title:(NSString*)aString
		category:(NSString*)aCategory
		  author:(NSString*)anAuthor
		language:(NSString*)aLanguage
		citation:(NSString*)aCitation
			text:(NSString*)aText;

@end
