//
//  MyDocument.h
//  pbdbbuilder
//
//  Created by Arash Payan on 3/8/09.
//  Copyright __MyCompanyName__ 2009 . All rights reserved.
//


#import <Cocoa/Cocoa.h>
#import <WebKit/WebKit.h>
#import "Prayer.h"

@interface MyDocument : NSDocument
{
	NSMutableArray *categories;
	NSMutableArray *authors;
	NSMutableArray *prayers;
	NSMutableArray *languages;
	NSString *htmlPrefix;
	NSString *htmlSuffix;
	
	// IBOutlets
	IBOutlet WebView *previewWebView;
	IBOutlet NSPopUpButton *categoryPopUpButton;
	IBOutlet NSPopUpButton *authorPopUpButton;
	IBOutlet NSPopUpButton *languagePopUpButton;
	IBOutlet NSTextView *textView;
	IBOutlet NSTableView *prayersTable;
	IBOutlet NSTextField *titleTextField;
	IBOutlet NSTextField *citationTextField;
	IBOutlet NSTextField *prayerIdTextField;
	IBOutlet NSButton *addPrayerButton;
	IBOutlet NSButton *deletePrayerButton;
	IBOutlet NSButton *formatButton;
	IBOutlet NSButton *markupButton;
}

- (IBAction)addPrayer:(id)sender;
- (IBAction)deletePrayer:(id)sender;
- (IBAction)categoryChanged:(id)sender;
- (IBAction)languageChanged:(id)sender;
- (IBAction)authorChanged:(id)sender;
- (IBAction)citationChanged:(id)sender;
- (IBAction)titleChanged:(id)sender;
- (IBAction)markupPrayer:(id)sender;

@end
