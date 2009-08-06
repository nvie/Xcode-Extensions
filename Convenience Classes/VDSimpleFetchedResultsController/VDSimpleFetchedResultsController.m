//
// VDFetchedResultsTableViewController.m
//
// A simple subclass of UITableViewController with a pre set up
// NSFetchedResultsController, easily configurable if you're doing only
// straight-forward fetches.
//
// Created by Vincent Driessen
// Feel free to use this class in any way you like.
//

#import "VDSimpleFetchedResultsController.h"


@implementation VDSimpleFetchedResultsController

@synthesize fetchedResultsController = _fetchedResultsController;
@synthesize managedObjectContext = _managedObjectContext;
@synthesize entityName = _entityName;
@synthesize sectionNameKeyPath = _sectionNameKeyPath;
@synthesize sortKey = _sortKey;
@synthesize sortDescriptors = _sortDescriptors;


#pragma mark -
#pragma mark UITableViewDataSource


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [[self.fetchedResultsController sections] count];
}


// Customize the number of rows in the table view.
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	id <NSFetchedResultsSectionInfo> sectionInfo = [[self.fetchedResultsController sections] objectAtIndex:section];
    return [sectionInfo numberOfObjects];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSAssert(NO, @"Override this method in a subclass.");
	return nil;
}



#pragma mark -
#pragma mark NSFetchedResultsController support


- (NSFetchedResultsController *)fetchedResultsController {
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
	// Assert that the entity name is set for this instance
	NSAssert(_managedObjectContext != nil, @"Managed object context is nil.");
	NSAssert(_entityName != nil, @"Entity name not set for this instance of VDFetchedResultsTableViewController.");
	
	NSArray *sortDescriptors;
	if (_sortDescriptors == nil) {
		// Create an empty sortOrder array
		NSMutableArray *mutableSortDescriptors = [NSMutableArray array];
		
		// Create a sort descriptor array now if a quick sortKey is set
		if (_sortKey != nil) {
			NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:_sortKey
																		   ascending:YES];
			[mutableSortDescriptors addObject:sortDescriptor];
			[sortDescriptor release];
		}
		
		sortDescriptors = mutableSortDescriptors;
	} else {
		sortDescriptors = _sortDescriptors;
	}

	NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
	// Edit the entity name as appropriate.
	NSEntityDescription *entity = [NSEntityDescription entityForName:_entityName
											  inManagedObjectContext:self.managedObjectContext];
	
	// Set up the request
	[fetchRequest setEntity:entity];
	[fetchRequest setSortDescriptors:sortDescriptors];
	
	// Edit the section name key path and cache name if appropriate.
    // nil for section name key path means "no sections".
	NSFetchedResultsController *frc;
	frc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
											  managedObjectContext:self.managedObjectContext
												sectionNameKeyPath:_sectionNameKeyPath
														 cacheName:@"ListIndex"];
    frc.delegate = self;
	self.fetchedResultsController = frc;
	
	[frc release];
	[fetchRequest release];
	
	return _fetchedResultsController;
}



#pragma mark -
#pragma mark Custom methods


- (BOOL)fetch:(NSError **)error {
	return [[self fetchedResultsController] performFetch:error];
}


@end
