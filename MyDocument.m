//
//  MyDocument.m
//  pbdbbuilder
//
//  Created by Arash Payan on 3/8/09.
//  Copyright __MyCompanyName__ 2009 . All rights reserved.
// This is a comment that I'm adding to test

#import "MyDocument.h"

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
		
		prayers = [[NSMutableArray alloc] init];
		NSMutableString *tmp = [[NSMutableString alloc] init];
		[tmp appendString:@"<html><head>"];
		[tmp appendString:@"<style type=\"text/css\">"];
		[tmp appendString:@"#prayer p {margin: 0 0px .75em 5px; color: #330000; font: normal 1em/1.375em Georgia, \"Times New Roman\", Times, serif; clear: both; text-indent: 1em;}"];
		[tmp appendString:@"#prayer p.opening {text-indent: 0;}"];
		[tmp appendString:@"#prayer p.commentcaps {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; text-transform: uppercase; margin: 0 20px 20px 5px; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.comment {font: normal .8em Arial, Helvetica, sans-serif; color: #444433; margin: 0 50px .825em 1.5em; text-indent: 0; }"];
		[tmp appendString:@"#prayer p.noindent {text-indent: 0; margin-bottom: .25em;}"];
		[tmp appendString:@"#prayer h4#author { float: right; margin: 0 25px 25px 0; font: italic 1.03em/1.825em Georgia, \"Times New Roman\", Times, serif; color: #992222; text-indent: 0.325em; }"];
		[tmp appendString:@"span.versal {float: left; display: inline; position: relative; color: #992222; font: normal 3.5em/.75em \"Times New Roman\", Times, serif; margin: 0 .15em 0 .15em; padding: 0;}"];
		[tmp appendString:@"</style></head><body><div id=\"prayer\">"];
		htmlPrefix = tmp;
		htmlSuffix = [NSString stringWithString:@"</div></body></html>"];
		
		languages = [[NSMutableArray alloc] init];
		[languages addObject:@"en"];
		[languages addObject:@"es"];
		[languages addObject:@"fr"];
		[languages addObject:@"de"];
    }
    return self;
}

- (void)awakeFromNib
{
	[self tableViewSelectionDidChange:nil];
}

- (NSString *)windowNibName
{
    // Override returning the nib file name of the document
    // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this method and override -makeWindowControllers instead.
    return @"MyDocument";
}

- (void)windowControllerDidLoadNib:(NSWindowController *) aController
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
    // Insert code here to write your document to data of the specified type. If the given outError != NULL, ensure that you set *outError when returning nil.

    // You can also choose to override -fileWrapperOfType:error:, -writeToURL:ofType:error:, or -writeToURL:ofType:forSaveOperation:originalContentsURL:error: instead.

    // For applications targeted for Panther or earlier systems, you should use the deprecated API -dataRepresentationOfType:. In this case you can also choose to override -fileWrapperRepresentationOfType: or -writeToFile:ofType: instead.

    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
	}
	return nil;
}

- (BOOL)readFromData:(NSData *)data ofType:(NSString *)typeName error:(NSError **)outError
{
    // Insert code here to read your document from the given data of the specified type.  If the given outError != NULL, ensure that you set *outError when returning NO.

    // You can also choose to override -readFromFileWrapper:ofType:error: or -readFromURL:ofType:error: instead. 
    
    // For applications targeted for Panther or earlier systems, you should use the deprecated API -loadDataRepresentation:ofType. In this case you can also choose to override -readFromFile:ofType: or -loadFileWrapperRepresentation:ofType: instead.
    
    if ( outError != NULL ) {
		*outError = [NSError errorWithDomain:NSOSStatusErrorDomain code:unimpErr userInfo:NULL];
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
	selected.category = (NSString*)[categoryPopUpButton selectedItem];
}

- (IBAction)authorChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.author = (NSString*)[authorPopUpButton selectedItem];
}

- (IBAction)citationChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.title = (NSString*)[citationTextField stringValue];
}

- (IBAction)titleChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.title = [titleTextField stringValue];
}

- (IBAction)languageChanged:(id)sender
{
	Prayer *selected = [prayers objectAtIndex:[prayersTable selectedRow]];
	selected.language = (NSString*)[languagePopUpButton selectedItem];
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
