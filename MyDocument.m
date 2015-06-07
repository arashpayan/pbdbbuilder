//
//  MyDocument.m
//  pbdbbuilder
//
//  Created by Arash Payan on 3/8/09.
//  Copyright __MyCompanyName__ 2009 . All rights reserved.
// The comment has been removed

#import "MyDocument.h"
#import "RegexKitLite.h"
#import "Prayer.h"
#import <sqlite3.h>

@implementation MyDocument

- (id)init
{
    self = [super init];
    if (self) {
    
        // Create our array of categories
		categories = [[NSMutableArray alloc] init];
		
		// English categories
		[categories addObject:@""];
		[categories addObject:@"Uncategorized"];
		[categories addObject:@"Aid and Assistance"];
		[categories addObject:@"America"];
		[categories addObject:@"Children"];
		[categories addObject:@"The Departed"];
		[categories addObject:@"Detachment"];
		[categories addObject:@"Divine Springtime"];
		[categories addObject:@"Evening"];
		[categories addObject:@"Expectant Mothers"];
		[categories addObject:@"Families"];
		[categories addObject:@"The Fast"];
		[categories addObject:@"Firmness in the Covenant"];
		[categories addObject:@"Forgiveness"];
		[categories addObject:@"The Fund"];
		[categories addObject:@"Gatherings"];
		[categories addObject:@"Grace at Table"];
		[categories addObject:@"Healing"];
		[categories addObject:@"Humanity"];
		[categories addObject:@"Huqúqu'lláh"];
		[categories addObject:@"Infants"];
		[categories addObject:@"Joy and Ecstasy"];
		[categories addObject:@"Manifestation of God"];
		[categories addObject:@"Marriage"];
		[categories addObject:@"Morning"];
		[categories addObject:@"Nearness to God"];
		[categories addObject:@"Obligatory"];
		[categories addObject:@"Occasional Prayers"];
		[categories addObject:@"Paradise"];
		[categories addObject:@"Peace"];
		[categories addObject:@"Praise and Gratitude"];
		[categories addObject:@"Prison"];
		[categories addObject:@"Protection"];
		[categories addObject:@"Sacrifice"];
		[categories addObject:@"Service"];
		[categories addObject:@"Special Tablets"];
		[categories addObject:@"Spiritual Assembly"];
		[categories addObject:@"Spiritual Growth"];
		[categories addObject:@"Steadfastness"];
		[categories addObject:@"Teaching"];
		[categories addObject:@"Tests and Difficulties"];
		[categories addObject:@"Trials"];
		[categories addObject:@"Triumph of the Cause"];
		[categories addObject:@"Unity"];
		[categories addObject:@"Women"];
		[categories addObject:@"Youth"];
		
		// Spanish categories
		//[categories addObject:@"Obligatorias"];
//		[categories addObject:@"Agradecimiento"];
//		[categories addObject:@"Alabanza"];
//		[categories addObject:@"Alegría y Paz"];
//		[categories addObject:@"Amor a Dios"];
//		[categories addObject:@"Asamblea Espiritual"];
//		[categories addObject:@"Ayuda"];
//		[categories addObject:@"Ayuno"];
//		[categories addObject:@"Constancia"];
//		[categories addObject:@"Cualidades Espirituales"];
//		[categories addObject:@"Curación"];
//		[categories addObject:@"Desprendimiento"];
//		[categories addObject:@"Difuntos"];
//		[categories addObject:@"Enseñanza"];
//		[categories addObject:@"Familia"];
//		[categories addObject:@"Firmeza"];
//		[categories addObject:@"Fondos"];
//		[categories addObject:@"Humanidad"];
//		[categories addObject:@"Iluminación"];
//		[categories addObject:@"Jóvenes"];
//		[categories addObject:@"Mañana"];
//		[categories addObject:@"Matrimonio"];
//		[categories addObject:@"Mujeres"];
//		[categories addObject:@"Niños"];
//		[categories addObject:@"Noche"];
//		[categories addObject:@"Oraciones Especiales"];
//		[categories addObject:@"Perdón"];
//		[categories addObject:@"Protección"];
//		[categories addObject:@"Pruebas y Dificultades"];
//		[categories addObject:@"Reuniones"];
//		[categories addObject:@"Tablas Especiales"];
//		[categories addObject:@"Triunfo de la Causa"];
//		[categories addObject:@"Unidad"];
		
		// French categories
//		[categories addObject:@"Détachement"];
//		[categories addObject:@"Matin"];
//		[categories addObject:@"Soir"];
//		[categories addObject:@"Louange"];
//		[categories addObject:@"Qualités spirituelles"];
//		[categories addObject:@"Pardon"];
//		[categories addObject:@"Guérison"];
//		[categories addObject:@"Protection"];
//		[categories addObject:@"Epreuves et difficultés"];
//		[categories addObject:@"Assistance"];
//		[categories addObject:@"Enseignement"];
//		[categories addObject:@"Unité"];
//		[categories addObject:@"Justice"];
//		[categories addObject:@"Mariage"];
//		[categories addObject:@"Morts"];
//		[categories addObject:@"Tablettes spécial"];
//		[categories addObject:@"Prières obligatoires"];
//		[categories addObject:@"Jeûne"];
//		[categories addObject:@"Minuit"];
//		[categories addObject:@"Prières pour les Jeunes"];
//		[categories addObject:@"Enfants"];
//		[categories addObject:@"Réunion"];
//		[categories addObject:@"Assemblée spirituelle"];
//		[categories addObject:@"Joy"];
//		[categories addObject:@"Prières occasionnelles"];
		
		// Dutch categories
//		[categories addObject:@"Verplichte Gebeden"];				// Compulsory Prayers
//		[categories addObject:@"Algemene Gebeden"];					// General Prayers
//		[categories addObject:@"Avond"];							// Evening
//		[categories addObject:@"Beproevingen en Moeilijkheden"];	// Tests and Difficulties
//		[categories addObject:@"Bescherming"];						// Protection
//		[categories addObject:@"Bijeenkomst"];						// Meeting
//		[categories addObject:@"Eenheid"];							// Unit(y?)
//		[categories addObject:@"Fonds"];							// Fund
//		[categories addObject:@"Geestelijke Groei"];				// Spiritual Growth
//		[categories addObject:@"Geestelijke Raad"];					// Spiritual Assembly
//		[categories addObject:@"Genezing"];							// Healing
//		[categories addObject:@"Gezin"];							// Family
//		[categories addObject:@"Handen Van de Zaak Gods"];			// Hands of the Cause of God
//		[categories addObject:@"Hulp en Bijstand"];					// Aid and Assistance
//		[categories addObject:@"Huwelijk"];							// Marriage
//		[categories addObject:@"Jongeren"];							// Youth
//		[categories addObject:@"Kinderen"];							// Children
//		[categories addObject:@"Lof en Dankbaarheid"];				// Praise and Gratitude
//		[categories addObject:@"Martelaren"];						// Martyrs
//		[categories addObject:@"Naw-Rúz"];
//		[categories addObject:@"Ochtend"];							// Morning
//		[categories addObject:@"Onderricht"];						// Teaching
//		[categories addObject:@"Onderricht: Tafelen van het Goddelijk Plan"];	// Teaching: Tablets of the Divine Plan
//		[categories addObject:@"Onthechting"];						// Detachment
//		[categories addObject:@"Overledenen"];						// Deaths
//		[categories addObject:@"Schrikkeldagen"];					// Intercalary Days
//		[categories addObject:@"Standvastigheid"];					// Steadfastness
//		[categories addObject:@"Tafelgebeden"];						// Table Prayers
//		[categories addObject:@"Vasten"];							// Fast
//		[categories addObject:@"Vergeving"];						// Forgiveness
//		[categories addObject:@"Bijzondere Gebeden"];				// Special Tablets
        
        // Persian categories
//        [categories addObject:@"ستایش"];								// Praise
//        [categories addObject:@"حقیقت جویی"];							// Truth
//        [categories addObject:@"رستگاری و هدایت"];						// Redemption and Hedayat
//        [categories addObject:@"بندگی"];								// Bondage
//        [categories addObject:@"عشق و شادی"];							// Love and Happiness
//        [categories addObject:@"پاکی و خلوص"];							// ? and Clearance
//        [categories addObject:@"وارستگی"];								// Philosophy
//        [categories addObject:@"اخلاق روحانی"];							// Spiritual Ethics
//        [categories addObject:@"خدمت"];								// Service
//        [categories addObject:@"یگانگی"];								// Unity
//        [categories addObject:@"صلح"];								// Reconciliation
//        [categories addObject:@"درخواست یاری"];							// Request Help
//        [categories addObject:@"شُکر"];								// Thanked
//        [categories addObject:@"رزق و روزی"];							// Provisions, one (??)
//        [categories addObject:@"حفظ و حمایت"];							// Save and ?
//        [categories addObject:@"عفو و بخشش"];							// Forgiveness
//        [categories addObject:@"پدر و مادر"];							// Parents
//        [categories addObject:@"کودکان"];								// Children
//        [categories addObject:@"نوجوانان"];								// Teenagers (Youth)
//        [categories addObject:@"دختران"];								// Girls
//        [categories addObject:@"ازدواج"];								// Marriage
//        [categories addObject:@"شفای بیماران"];							// Healing Patients
//        [categories addObject:@"ترک آلودگی و اعتیاد"];						// Pollution and drug addiction withdrawal
//        [categories addObject:@"درگذشتگان"];							// Deaths
//        [categories addObject:@"ایران"];								// Iran
        
        // Brazilian Portuguese categories
//        [categories addObject:@"Ajuda"];
//        [categories addObject:@"Amanhecer"];
//        [categories addObject:@"Beneplácito"];
//        [categories addObject:@"Casamento"];
//        [categories addObject:@"Contribuição aos Fundos"];
//        [categories addObject:@"Convênio"];
//        [categories addObject:@"Criança"];
//        [categories addObject:@"Cura"];
//        [categories addObject:@"Desprendimento"];
//        [categories addObject:@"Dia de Deus"];
//        [categories addObject:@"Ensino"];
//        [categories addObject:@"Família"];
//        [categories addObject:@"Firmeza e Constância"];
//        [categories addObject:@"Humanidade"];
//        [categories addObject:@"Jovem"];
//        [categories addObject:@"Louvor e Gratidão"];
//        [categories addObject:@"Pelos Mortos"];
//        [categories addObject:@"Mulher"];
//        [categories addObject:@"Noite"];
//        [categories addObject:@"Perdão"];
//        [categories addObject:@"Pré-Jovem"];
//        [categories addObject:@"Proteção"];
//        [categories addObject:@"Provações e dificuldades"];
//        [categories addObject:@"Qualidades Espirituais"];
//        [categories addObject:@"Remoção de dificuldades"];
//        [categories addObject:@"Reuniões"];
//        [categories addObject:@"Serviço à Causa"];
//        [categories addObject:@"Unidade"];
//        [categories addObject:@"Ocasiões Especiais"];
//        [categories addObject:@"Epístolas"];
        
		
		// english authors
		authors = [[NSMutableArray alloc] init];
		[authors addObject:@""];
		[authors addObject:@"'Abdu’l-Bahá"];
		[authors addObject:@"The Báb"];
		[authors addObject:@"Bahá’u’lláh"];
		
		// spanish authors
		//[authors addObject:@"'Abdu’l-Bahá"];
//		[authors addObject:@"El Báb"];
//		[authors addObject:@"Bahá’u’lláh"];
		
		// french authors
		//[authors addObject:@"'Abdu’l-Bahá"];
//		[authors addObject:@"Le Bab"];
//		[authors addObject:@"Bahá’u’lláh"];
		
		// dutch authors
//		[authors addObject:@"'Abdu’l-Bahá"];
//		[authors addObject:@"de Báb"];
//		[authors addObject:@"Bahá’u’lláh"];
        
        // brazilian portuguese authors
//        [authors addObject:@"'Abdu’l-Bahá"];
//        [authors addObject:@"O Báb"];
//        [authors addObject:@"Bahá’u’lláh"];
		
		
		prayers = [[NSMutableArray alloc] init];
		NSMutableString *tmp = [[NSMutableString alloc] init];
		[tmp appendString:@"<html><head>"];
		[tmp appendString:@"<style type=\"text/css\">"];
		[tmp appendString:@"#prayer p {margin: 0 0px .75em 5px; color: #330000; font: normal 1em/1.375em Georgia, \"Times New Roman\", Times, serif; clear: both; text-indent: 1em;}"];
		[tmp appendString:@"#prayer p.opening {text-indent: 0;}"];
		[tmp appendString:@"body { background: #e2ded5 url(data:image/jpeg;base64,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%3D%3D) repeat-y; }"];
		[tmp appendString:@"#prayer p.commentcaps {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; text-transform: uppercase; margin: 0 20px 20px 5px; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.comment {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; margin: 0 50px .825em 1.5em; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.noindent {text-indent: 0; margin-bottom: .25em;}"];
		[tmp appendString:@"#prayer h4#author { float: right; margin: 0 25px 25px 0; font: italic 1.03em/1.825em Georgia, \"Times New Roman\", Times, serif; color: #992222; text-indent: 0.325em; }"];
		[tmp appendString:@"span.versal {float: left; display: inline; position: relative; color: #992222; font: normal 3.5em/.75em \"Times New Roman\", Times, serif; margin: 0 .15em 0 .15em; padding: 0;}"];
		[tmp appendString:@"</style></head><body><div id=\"prayer\">"];
		htmlPrefix = tmp;
		htmlSuffix = [NSString stringWithString:@"</div></body></html>"];
		
		languages = [[NSMutableArray alloc] init];
//        [languages addObject:@"pt-BR"];
//        [languages addObject:@"fa"];
//		[languages addObject:@"nl"];
		[languages addObject:@"en"];
//		[languages addObject:@"es"];
//		[languages addObject:@"fr"];
//		[languages addObject:@"de"];
        [languages addObject:@"cs"];
        [languages addObject:@"sk"];
        [languages addObject:@"fj"];
        
    }
    return self;
}

- (void)awakeFromNib
{
	[self tableViewSelectionDidChange:nil];
    
    [textView setBaseWritingDirection:NSWritingDirectionLeftToRight];
    textView.automaticQuoteSubstitutionEnabled = NO;
    textView.automaticSpellingCorrectionEnabled = NO;
    textView.automaticDashSubstitutionEnabled = NO;
    textView.automaticTextReplacementEnabled = NO;
    textView.automaticLinkDetectionEnabled = NO;
    textView.automaticDashSubstitutionEnabled = NO;
//    [titleTextField setBaseWritingDirection:NSWritingDirectionRightToLeft];
//    [citationTextField setBaseWritingDirection:NSWritingDirectionRightToLeft];
}

- (NSString*)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *)aController
{
    [super windowControllerDidLoadNib:aController];
    // Add any code here that needs to be executed once the windowController has loaded the document's window.
	[categoryPopUpButton removeAllItems];
	[categoryPopUpButton addItemsWithTitles:categories];
	
	[authorPopUpButton removeAllItems];
	[authorPopUpButton addItemsWithTitles:authors];
	
	[languagePopUpButton removeAllItems];
	[languagePopUpButton addItemsWithTitles:languages];
}

- (NSData *)dataOfType:(NSString *)typeName error:(NSError **)outError
{
    int rc;
	
	// create a temporary file name
	NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"db"]];
	
	sqlite3 *db;
	rc = sqlite3_open([path UTF8String], &db);
	if (rc != SQLITE_OK)
		NSLog(@"Can't open the database (%d): %s", rc, sqlite3_errmsg(db));
	
	// create the prayers table
	const char *createPrayerTable = "CREATE TABLE prayers (id INTEGER PRIMARY KEY, category TEXT NOT NULL, prayerText TEXT NOT NULL, openingWords TEXT NOT NULL, citation TEXT NOT NULL, author TEXT NOT NULL, language TEXT NOT NULL)";
	char *zErrMsg = NULL;
	rc = sqlite3_exec(db, createPrayerTable, NULL, 0, &zErrMsg);
	if (rc != SQLITE_OK)
	{
		NSLog(@"Error creating prayers table when writing out (%d): %s", rc, zErrMsg);
		sqlite3_free(zErrMsg);
	}
	
	// insert the prayers
	NSString *insertPrayer = @"INSERT INTO prayers (id, category, prayerText, openingWords, citation, author, language) VALUES (?, ?, ?, ?, ?, ?, ?)";
	sqlite3_stmt *insertStmt;
	int numPrayers = [prayers count];
	for (int i=0; i<numPrayers; i++)
	{
		Prayer *currPrayer = [prayers objectAtIndex:i];
		
		rc = sqlite3_prepare_v2(db, [insertPrayer UTF8String], [insertPrayer lengthOfBytesUsingEncoding:NSUTF8StringEncoding], &insertStmt, NULL);
		if (rc != SQLITE_OK)
			NSLog(@"Problem preparing insert statement");
		
		rc = sqlite3_bind_int(insertStmt, 1, currPrayer.prayerId);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding prayer id");
		
		NSString *category = currPrayer.category;
		rc = sqlite3_bind_text(insertStmt, 2, [category UTF8String], [category lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding category");
		
		NSString *prayerText = currPrayer.text;
		rc = sqlite3_bind_text(insertStmt, 3, [prayerText UTF8String], [prayerText lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding prayer text");
		
		NSString *openingWords = currPrayer.title;
		rc = sqlite3_bind_text(insertStmt, 4, [openingWords UTF8String], [openingWords lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding opening words");
		
		NSString *citation = currPrayer.citation;
		rc = sqlite3_bind_text(insertStmt, 5, [citation UTF8String], [citation lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding citation");
		
		NSString *author = currPrayer.author;
		rc = sqlite3_bind_text(insertStmt, 6, [author UTF8String], [author lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding author");
		
		NSString *language = currPrayer.language;
		rc = sqlite3_bind_text(insertStmt, 7, [language UTF8String], [language lengthOfBytesUsingEncoding:NSUTF8StringEncoding], SQLITE_STATIC);
		if (rc != SQLITE_OK)
			NSLog(@"Problem binding language");

		
		// execute the insertion
		rc = sqlite3_step(insertStmt);
		if (rc != SQLITE_DONE)
			NSLog(@"Problem executing insertion: %s", sqlite3_errmsg(db));
		
		// reset the statement for the next loop
		rc = sqlite3_reset(insertStmt);
		if (rc != SQLITE_OK)
			NSLog(@"Problem resetting the statement (%d): %s", rc, sqlite3_errmsg(db));
	}
	
	// clean up
	rc = sqlite3_finalize(insertStmt);
	if (rc != SQLITE_OK)
		NSLog(@"Problem finalizing insert statement: %s", sqlite3_errmsg(db));
	
	sqlite3_close(db);
	
	NSData *theData = [NSData dataWithContentsOfFile:path];
	
    // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.
	
    if ( outError != NULL )
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	
	return theData;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // dump the NSData to a temporary file
	// create the temp filename
	NSString *path = [NSTemporaryDirectory() stringByAppendingPathComponent:[NSString stringWithFormat: @"%.0f.%@", [NSDate timeIntervalSinceReferenceDate] * 1000.0, @"db"]];
	
	[data writeToFile:path options:0 error:nil];
	
	prayers = [[NSMutableArray alloc] init];
	
	// open the database
	sqlite3 *db;
	int rc = sqlite3_open([path UTF8String], &db);
	if (rc != SQLITE_OK)
		NSLog(@"Can't open the database (%d): %s", rc, sqlite3_errmsg(db));
	
	NSString *prayersQuery = @"SELECT id, category, prayerText, openingWords, citation, author, language FROM prayers";
	sqlite3_stmt *prayersStmt;
	
	rc = sqlite3_prepare_v2(db,
							[prayersQuery UTF8String],
							[prayersQuery length],
							&prayersStmt,
							0);
	if (rc != SQLITE_OK)
		NSLog(@"Problem preparing statement when reading in file");
	
	while ((rc = sqlite3_step(prayersStmt)) == SQLITE_ROW)
	{
		long prayerId = sqlite3_column_int(prayersStmt, 0);
		NSString *category;
		const unsigned char* categoryConst = sqlite3_column_text(prayersStmt, 1);
		if (categoryConst != NULL)
		{
			category = [NSString stringWithUTF8String:(const char*)categoryConst];
			if (category == nil)
				NSLog(@"Category (%s) for prayer %ld is nil", categoryConst, prayerId);
		}
		//else
		//			NSLog(@"Category for prayer %d is NULL", prayerId);
		
		NSString *prayerText;
		const unsigned char* prayerTextConst = sqlite3_column_text(prayersStmt, 2);
		if (prayerTextConst != NULL)
		{
			prayerText = [NSString stringWithUTF8String:(const char*)prayerTextConst];
			if (prayerText == nil)
				NSLog(@"Prayer text for %ld is nil", prayerId);
		}
		//else
		//			NSLog(@"Prayer text for prayer %d is NULL", prayerId);
		
		NSString *openingWords;
		const unsigned char* openingWordsConst = sqlite3_column_text(prayersStmt, 3);
		if (openingWordsConst != NULL)
		{
			openingWords = [NSString stringWithUTF8String:(const char*)openingWordsConst];
			if (openingWords == nil)
				NSLog(@"Opening (%s) words for prayer %ld is nil", openingWordsConst, prayerId);
		}
		//else
		//			NSLog(@"Opening words (%s) for prayer %d is NULL", prayerId);
		
		NSString *citation;
		const unsigned char *citationConst = sqlite3_column_text(prayersStmt, 4);
		if (citationConst != NULL)
		{
			citation = [NSString stringWithUTF8String:(const char*)citationConst];
			if (citation == nil)
				NSLog(@"Citation (%s) for prayer %ld is nil", citationConst, prayerId);
		}
		//else
		//			NSLog(@"Citation for prayer %d is NULL", prayerId);
		
		NSString *author;
		const unsigned char* authorConst = sqlite3_column_text(prayersStmt, 5);
		if (authorConst != NULL)
		{
			author = [NSString stringWithUTF8String:(const char*)authorConst];
			if (author == nil)
				NSLog(@"Author (%s) for prayer %ld is nil", authorConst, prayerId);
		}
		//else
		//			NSLog(@"Author for prayer %d is NULL", prayerId);
		
		NSString *language;
		const unsigned char* languageConst = sqlite3_column_text(prayersStmt, 6);
		if (languageConst != NULL)
			language = [NSString stringWithUTF8String:(const char*)languageConst];
		//else
		//			NSLog(@"Language (%s) for prayer %d is NULL", languageConst, prayerId);
		
		Prayer *newPrayer = [[Prayer alloc] initWithId:prayerId
												 title:openingWords
											  category:category
												author:author
											  language:language
											  citation:citation
												  text:prayerText];
		
		[prayers addObject:newPrayer];
	}
	
	return YES;
}

- (IBAction)addPrayer:(id)sender
{
	Prayer *prayer = [[Prayer alloc] init];
	prayer.title = @"New Prayer Title";
	[prayers addObject:prayer];
	[prayersTable reloadData];
	[prayersTable selectRow:[prayers count]-1 byExtendingSelection:NO];
}

- (IBAction)deletePrayer:(id)sender
{
	NSAlert *alert = [NSAlert alertWithMessageText:@"Confirm Deletion"
									 defaultButton:nil
								   alternateButton:@"Cancel"
									   otherButton:nil
						 informativeTextWithFormat:@"Are you sure?"];
	
	// 0 means cancel, 1 means ok
	int rVal = [alert runModal];
	if (rVal)
	{
		[prayers removeObjectAtIndex:[prayersTable selectedRow]];
		[prayersTable reloadData];
	}
}

- (IBAction)categoryChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.category = [[categoryPopUpButton selectedItem] title];
	[prayersTable reloadData];
}

- (IBAction)authorChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.author = [[authorPopUpButton selectedItem] title];
}

- (IBAction)citationChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.citation = [citationTextField stringValue];
}

- (IBAction)titleChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.title = [titleTextField stringValue];
	[prayersTable reloadData];
}

- (IBAction)languageChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.language = [[languagePopUpButton selectedItem] title];
}

- (void)textDidChange:(NSNotification *)aNotification
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	
	// update the preview first (for snapiness)
	NSMutableString *previewHTML = [[NSMutableString alloc] init];
	[previewHTML appendString:htmlPrefix];
	[previewHTML appendString:[textView string]];
	[previewHTML appendString:htmlSuffix];
	[[previewWebView mainFrame] loadHTMLString:previewHTML baseURL:[NSURL URLWithString:@"file:///"]];
	
	// update the data model
	selected.text = [textView string];
}

- (IBAction)markupPrayer:(id)sender
{
	NSString *text = [textView string];
	NSString *title_val = [NSString stringWithFormat:@"%@...", [text substringToIndex:50]];
	[titleTextField setStringValue:title_val];
	[self titleChanged:self];
	text = [text stringByReplacingOccurrencesOfRegex:@"(\\n|\\r)" withString:@"</p>\n\n<p>"];
	NSMutableString *mutable = [[NSMutableString alloc] init];
	[mutable appendString:@"<p class=\"opening\"><span class=\"versal\">"];
	NSString *versal = [text substringToIndex:1];
	NSString *postVersal = [text substringFromIndex:1];
	if ([versal isEqual:@"¡"] || [versal isEqual:@"¿"])
	{
		versal = [text substringToIndex:2];
		postVersal = [text substringFromIndex:2];
	}
		
	[mutable appendString:versal];
	[mutable appendString:@"</span>"];
	[mutable appendString:postVersal];
	[mutable appendString:@"</p>"];
	[textView setString:mutable];
	
	[self textDidChange:nil];
}

#pragma mark Table Delegate and Data Source
- (NSInteger)numberOfRowsInTableView:(NSTableView*)aTableView
{
	return [prayers count];
}

- (id)tableView:(NSTableView *)aTableView objectValueForTableColumn:(NSTableColumn *)aTableColumn row:(NSInteger)rowIndex
{
	if (aTableView == prayersTable)
	{
		Prayer *currPrayer = [prayers objectAtIndex:rowIndex];
		return [NSString stringWithFormat:@"%@:%@", currPrayer.category, currPrayer.title];
	}
	else
		return nil;
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
{
	int selectedRow = [prayersTable selectedRow];
	if (selectedRow == -1 || aNotification == nil)
	{
		[prayerIdTextField setStringValue:@""];
		[authorPopUpButton setEnabled:NO];
		[authorPopUpButton selectItemWithTitle:@""];
		[categoryPopUpButton setEnabled:NO];
		[categoryPopUpButton selectItemWithTitle:@""];
		[languagePopUpButton setEnabled:NO];
		[textView setEditable:NO];
		[textView setString:@""];
		[citationTextField setEnabled:NO];
		[citationTextField setStringValue:@""];
		[titleTextField setEnabled:NO];
		[titleTextField setStringValue:@""];
		[deletePrayerButton setEnabled:NO];
		[[previewWebView mainFrame] loadHTMLString:@"" baseURL:[NSURL URLWithString:@"file:///"]];
	}
	else
	{
		Prayer *selectedPrayer = [prayers objectAtIndex:selectedRow];
		[prayerIdTextField setIntValue:selectedPrayer.prayerId];
		[authorPopUpButton setEnabled:YES];
		if (selectedPrayer.author)
			[authorPopUpButton selectItemWithTitle:[selectedPrayer author]];
		else
		{
			[authorPopUpButton selectItemWithTitle:@""];
			NSLog(@"Just populated from a null author");
		}
		
		[categoryPopUpButton setEnabled:YES];
		if (selectedPrayer.category)
			[categoryPopUpButton selectItemWithTitle:[selectedPrayer category]];
		else
		{
			[categoryPopUpButton selectItemWithTitle:@""];
			NSLog(@"Just populated from a null category");
		}
		
		[languagePopUpButton setEnabled:YES];
		if (selectedPrayer.language)
			[languagePopUpButton selectItemWithTitle:selectedPrayer.language];
		else
		{
			[languagePopUpButton selectItemWithTitle:@""];
			NSLog(@"Just populated from a null language");
		}
		
		[textView setEditable:YES];
		if (selectedPrayer.text)
			[textView setString:selectedPrayer.text];
		else
		{
			[textView setString:@""];
			NSLog(@"Just populated from a null prayerText");
		}
		
		[citationTextField setEnabled:YES];
		if (selectedPrayer.citation)
			[citationTextField setStringValue:[selectedPrayer citation]];
		else
		{
			[citationTextField setStringValue:@""];
			NSLog(@"Just populated from a null citation");
		}
		
		[titleTextField setEnabled:YES];
		if (selectedPrayer.title)
			[titleTextField setStringValue:selectedPrayer.title];
		else
		{
			[titleTextField setStringValue:@""];
			NSLog(@"Just populated from a null opening words");
		}
		
		[deletePrayerButton setEnabled:YES];
		// update the preview
		[self textDidChange:nil];
	}
}

@end
