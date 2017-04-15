//
//  Use this file to import your target's public headers that you would like to expose to Swift.
//

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *event;


@property (weak, nonatomic) IBOutlet UITextField *time;



- (IBAction)view:(id)sender;

- (IBAction)deleteEvent:(id)sender;


- (IBAction)addEvent:(id)sender;

- (IBAction)update:(id)sender;



@property (weak, nonatomic) IBOutlet UILabel *info;

@end
