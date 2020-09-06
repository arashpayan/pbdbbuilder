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
//		[categories addObject:@""];
//        [categories addObject:@"Recently Added"];
//		[categories addObject:@"Uncategorized"];
//		[categories addObject:@"Aid and Assistance"];
//		[categories addObject:@"America"];
//		[categories addObject:@"Children"];
//		[categories addObject:@"The Departed"];
//		[categories addObject:@"Detachment"];
//		[categories addObject:@"Divine Springtime"];
//		[categories addObject:@"Evening"];
//		[categories addObject:@"Expectant Mothers"];
//		[categories addObject:@"Families"];
//		[categories addObject:@"The Fast"];
//		[categories addObject:@"Firmness in the Covenant"];
//		[categories addObject:@"Forgiveness"];
//		[categories addObject:@"The Fund"];
//		[categories addObject:@"Gatherings"];
//		[categories addObject:@"Grace at Table"];
//		[categories addObject:@"Healing"];
//		[categories addObject:@"Humanity"];
//		[categories addObject:@"Huqúqu'lláh"];
//		[categories addObject:@"Infants"];
//		[categories addObject:@"Joy and Ecstasy"];
//		[categories addObject:@"Manifestation of God"];
//		[categories addObject:@"Marriage"];
//		[categories addObject:@"Morning"];
//		[categories addObject:@"Nearness to God"];
//		[categories addObject:@"Obligatory"];
//		[categories addObject:@"Occasional Prayers"];
//		[categories addObject:@"Paradise"];
//		[categories addObject:@"Peace"];
//		[categories addObject:@"Praise and Gratitude"];
//		[categories addObject:@"Prison"];
//		[categories addObject:@"Protection"];
//		[categories addObject:@"Sacrifice"];
//		[categories addObject:@"Service"];
//		[categories addObject:@"Special Tablets"];
//		[categories addObject:@"Spiritual Assembly"];
//		[categories addObject:@"Spiritual Growth"];
//		[categories addObject:@"Steadfastness"];
//		[categories addObject:@"Teaching"];
//		[categories addObject:@"Tests and Difficulties"];
//		[categories addObject:@"Trials"];
//		[categories addObject:@"Triumph of the Cause"];
//		[categories addObject:@"Unity"];
//		[categories addObject:@"Women"];
//		[categories addObject:@"Youth"];
		
		// Spanish categories
		[categories addObject:@"Obligatorias"];
		[categories addObject:@"Agradecimiento y alabanza"];
		[categories addObject:@"Ayuda"];
        [categories addObject:@"Cercanía a Dios"];
		[categories addObject:@"Constancia"];
		[categories addObject:@"Cualidades espirituale"];
		[categories addObject:@"Curación"];
		[categories addObject:@"Desprendimiento"];
		[categories addObject:@"Difuntos"];
		[categories addObject:@"Enseñanza"];
		[categories addObject:@"Familia"];
		[categories addObject:@"Firmeza en la Alianza"];
		[categories addObject:@"Fondos"];
		[categories addObject:@"Humanidad"];
		[categories addObject:@"Iluminación"];
		[categories addObject:@"Jóvenes"];
		[categories addObject:@"Mañana"];
		[categories addObject:@"Matrimonio"];
		[categories addObject:@"Mujeres"];
		[categories addObject:@"Niños"];
		[categories addObject:@"Noche"];
        [categories addObject:@"Obediencia"];
		[categories addObject:@"Perdón"];
		[categories addObject:@"Protección"];
		[categories addObject:@"Pruebas y dificultades"];
		[categories addObject:@"Reuniones"];
		[categories addObject:@"Triunfo de la Causa"];
		[categories addObject:@"Unidad"];
        [categories addObject:@"Asamblea Espiritual"];
        [categories addObject:@"Ayuno"];
        [categories addObject:@"Días intercalares"];
        [categories addObject:@"Ḥuqúqu’lláh"];
        [categories addObject:@"Mártires y sus familias"];
        [categories addObject:@"Naw-Rúz"];
        [categories addObject:@"Tablas especiales"];
		
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
//		[authors addObject:@"'Abdu’l-Bahá"];
//		[authors addObject:@"The Báb"];
//		[authors addObject:@"Bahá’u’lláh"];
		
		// spanish authors
		[authors addObject:@"‘Abdu'l-Bahá"];
		[authors addObject:@"El Báb"];
		[authors addObject:@"Bahá’u’lláh"];
		
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
		[tmp appendString:@"body { background: #ffffff; }"];
		[tmp appendString:@"#prayer p.commentcaps {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; text-transform: uppercase; margin: 0 20px 20px 5px; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.comment {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; margin: 0 50px .825em 1.5em; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.noindent {text-indent: 0; margin-bottom: .25em;}"];
		[tmp appendString:@"#prayer h4#author { float: right; margin: 0 25px 25px 0; font: italic 1.03em/1.825em Georgia, \"Times New Roman\", Times, serif; color: #992222; text-indent: 0.325em; }"];
		[tmp appendString:@"span.versal {float: left; display: inline; position: relative; color: #992222; font: normal 3.5em/.75em \"Times New Roman\", Times, serif; margin: 0 .15em 0 .15em; padding: 0;}"];
		[tmp appendString:@"</style></head><body><div id=\"prayer\">"];
		htmlPrefix = tmp;
		htmlSuffix = @"</div></body></html>";
		
		languages = [[NSMutableArray alloc] init];
//        [languages addObject:@"pt-BR"];
//        [languages addObject:@"fa"];
//		[languages addObject:@"nl"];
//		[languages addObject:@"en"];
		[languages addObject:@"es"];
//		[languages addObject:@"fr"];
//		[languages addObject:@"de"];
//        [languages addObject:@"cs"];
//        [languages addObject:@"sk"];
//        [languages addObject:@"fj"];
        
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
	NSString *title_val = [NSString stringWithFormat:@"%@…", [text substringToIndex:50]];
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
