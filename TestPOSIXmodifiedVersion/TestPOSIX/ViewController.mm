/**
 Cosc345 Asn 2, ViewController.mm
 
 @author Xinru Chen, Luke Falvey, Molly Patterson
 @version 1.0 5/29/17
 */

#import "ViewController.h"
#import "sqlite_operations.hpp"

@interface ViewController ()
- (IBAction)button:(id)sender;
@property (strong, nonatomic) IBOutlet UITextField *lecture;
@property (strong, nonatomic) IBOutlet UITextField *time;
@property (strong, nonatomic) IBOutlet UITextField *location;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)button:(id)sender {
    
}
- (IBAction)store:(id)sender {
    insertAssignment(
           [self.lecture.text cStringUsingEncoding: NSASCIIStringEncoding],
           [self.time.text cStringUsingEncoding:NSASCIIStringEncoding],
           [self.location.text cStringUsingEncoding:NSASCIIStringEncoding]
            );
    
    view();
}
@end
