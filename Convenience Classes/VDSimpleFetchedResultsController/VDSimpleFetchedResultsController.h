//
// VDFetchedResultsTableViewController.h
//
// A simple subclass of UITableViewController with a pre set up
// NSFetchedResultsController, easily configurable if you're doing only
// straight-forward fetches.
//
// Created by Vincent Driessen
// Feel free to use this class in any way you like.
//

#import <UIKit/UIKit.h>


@interface VDSimpleFetchedResultsController : UITableViewController <UITableViewDelegate, UITableViewDataSource, NSFetchedResultsControllerDelegate> {
	NSFetchedResultsController *_fetchedResultsController;
	NSManagedObjectContext *_managedObjectContext;
	
	NSString *_entityName;
	NSString *_sectionNameKeyPath;
	NSString *_sortKey;					// Quick NSString key to sort ascending against
	NSArray *_sortDescriptors;			// Set this instead if you would like more advanced sorting
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (BOOL)fetch:(NSError **)error;

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, retain) NSString *entityName;
@property (nonatomic, retain) NSString *sectionNameKeyPath;
@property (nonatomic, retain) NSString *sortKey;
@property (nonatomic, retain) NSArray *sortDescriptors;

@end
