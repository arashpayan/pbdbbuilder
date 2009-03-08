//
//  Prayer.m
//  pbdbbuilder
//
//  Created by Arash Payan on 3/8/09.
//  Copyright 2009 __MyCompanyName__. All rights reserved.
//

#import "Prayer.h"


@implementation Prayer

@synthesize title;
@synthesize citation;
@synthesize author;
@synthesize text;
@synthesize category;
@synthesize language;
@synthesize prayerId;

- (id)init
{
	static long prayerIdStart = 0;
	if (prayerIdStart == 0)
		prayerIdStart = time(NULL);
	
	if (self = [super init])
	{
		self.title = @"";
		self.citation = @"";
		self.author = @"";
		self.text = @"";
		self.category = @"";
		self.language = @"en";
		self.prayerId = prayerIdStart++;
	}
	
	return self;
}

- (id)initWithId:(long)anId
		   title:(NSString*)aString
		category:(NSString*)aCategory
		  author:(NSString*)anAuthor
		language:(NSString*)aLanguage
		citation:(NSString*)aCitation
			text:(NSString*)aText
{
	if (self = [self init])
	{
		if (anId < 1)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a prayer id less than 1 (%d)", anId];
		}
		self.prayerId = anId;
		
		if (category == nil)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a nil category (prayer %d)", anId];
		}
		self.category = aCategory;
		
		if (author == nil)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a nil author (prayer %d)", anId];
		}
		self.author = anAuthor;
		
		if (aLanguage == nil)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a nil language (prayer %d)", anId];
		}
		self.language = aLanguage;
		
		if (citation == nil)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a nil citation (prayer %d)", anId];
		}
		self.citation = aCitation;
		
		if (text == nil)
		{
			[NSException raise:@"PrayerInputException" format:@"Encountered a nil text (prayer %d)", anId];
		}
		self.text = aText;
	}
	
	return self;
}

@end
