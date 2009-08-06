//
//  «FILENAME»
//  «PROJECTNAME»
//
//  Created by «FULLUSERNAME» on «DATE».
//  Copyright «YEAR» «ORGANIZATIONNAME». All rights reserved.
//

«OPTIONALHEADERIMPORTLINE»

@implementation «FILEBASENAMEASIDENTIFIER»


#pragma mark -
#pragma mark NSObject


- (void)dealloc {
    [super dealloc];
}



#pragma mark -
#pragma mark UIView


- (void)viewDidLoad {
    [super viewDidLoad];
	
	// Set up the fetch parameters here
	//self.entityName = @"MyEntity";
	//self.sortKey = @"name";
	//self.sectionNameKeyPath = @"firstLetter";		// or nil
	
	// Perform other initialisations here
	
	// Fetch, ignoring any errors
	NSError *error;
	if (![self fetch:&error]) {
		// Handle the error
		//
		// For example:
		// NSString *message = [NSString stringWithFormat:@"There was an error fetching %@ objects.",
		// 					                           self.entityName];
		// UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Fetch error"
		// 													message:message
		// 												   delegate:nil
		// 										  cancelButtonTitle:@"OK"
		// 										  otherButtonTitles:nil];
		// [alertView show];
		// [alertView release];
	}
}



#pragma mark -
#pragma mark UITableViewDataSource


// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
									   reuseIdentifier:CellIdentifier] autorelease];
    }
    
	// Configure the cell here
	//
	// For example:
	// MyEntity *entity = [self.fetchedResultsController objectAtIndexPath:indexPath];
	// cell.textLabel.text = entity.name;
	
    return cell;
}



#pragma mark -
#pragma mark UITableViewDelegate


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Navigation logic may go here -- for example, create and push another view controller.
	// AnotherViewController *anotherViewController = [[AnotherViewController alloc] initWithNibName:@"AnotherView" bundle:nil];
    // NSManagedObject *selectedObject = [[self fetchedResultsController] objectAtIndexPath:indexPath];
    // Pass the selected object to the new view controller.
    /// ...
	// [self.navigationController pushViewController:anotherViewController animated:YES];
	// [anotherViewController release];
}


// Override to support editing the table view.
/*
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		// Delete the managed object for the given index path
		[self.managedObjectContext deleteObject:[self.fetchedResultsController objectAtIndexPath:indexPath]];
		
		// Save the context.
		NSError *error;
		if (![self.managedObjectContext save:&error]) {
			// Handle the error...
		}
		
		[tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }
}
*/


@end
