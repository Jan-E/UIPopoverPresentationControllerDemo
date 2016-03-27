//
//  ViewController.m
//  ObjPopoverPresentationController
//
//  Created by Kai Windle on 26/10/2015.
//  Copyright © 2015 Kai Windle. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"

@interface ViewController ()

@property (nonatomic, weak) IBOutlet UILabel *lblSelectedInformation;

@end

@implementation ViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender {
    
    // Note the terrible method name
    TableViewController *tableVC = (TableViewController *)[self.storyboard instantiateViewControllerWithIdentifier:@"tableVC"];
    
    tableVC.modalPresentationStyle = UIModalPresentationPopover;
    tableVC.delegateid = self;

    tableVC.fieldValues = [[NSMutableArray alloc] init];
    [tableVC.fieldValues addObject:[NSString stringWithFormat:@"ASU"]];
    [tableVC.fieldValues addObject:[NSString stringWithFormat:@"PMTO.nl"]];
    
    UIPopoverPresentationController *popPC = tableVC.popoverPresentationController;
    popPC.barButtonItem = sender;
    popPC.permittedArrowDirections = UIPopoverArrowDirectionAny;
    popPC.delegate = self;
    
    [self presentViewController:tableVC animated:YES completion:nil];
}

-(void)barButtonDonePressed:(UIBarButtonItem *)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark - UIPopoverPresentationControllerDelegate
-(UIModalPresentationStyle)adaptivePresentationStyleForPresentationController:(UIPresentationController *)controller{
    
//    return UIModalPresentationFullScreen;
    return UIModalPresentationNone;
}

-(UIViewController *)presentationController:(UIPresentationController *)controller viewControllerForAdaptivePresentationStyle:(UIModalPresentationStyle)style {
    
    UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:controller.presentedViewController];
    UIBarButtonItem *barButtonDone = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(barButtonDonePressed:)];
    
    navController.topViewController.navigationItem.rightBarButtonItem = barButtonDone;
    
    return navController;
}

#pragma UpdatePresentingViewControllerWithData
-(void)updateViewWithSelectedData:(NSString *)selectedString {
    
    NSLog(@"Delegate called");
    self.lblSelectedInformation.text = selectedString;
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"segue destinationViewController %@",[segue destinationViewController]);
    if ([[segue destinationViewController] isKindOfClass:[TableViewController class]])
    {
        TableViewController *tableVC = segue.destinationViewController;
        tableVC.modalPresentationStyle = UIModalPresentationPopover;
        tableVC.delegateid = self;
        
        tableVC.fieldValues = [[NSMutableArray alloc] init];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Alpha"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Beta"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Gamma"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Delta"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Epsilon"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Zeta"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Eta"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Theta"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Iota"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Kappa"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Lambda"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Mu"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Nu"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Xi"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Omicron"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Pi"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Rho"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Sigma"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Tau"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Upsilon"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Phi"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Chi"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Psi"]];
        [tableVC.fieldValues addObject:[NSString stringWithFormat:@"Omega"]];

        UIPopoverPresentationController *popPC = tableVC.popoverPresentationController;
        //popPC.barButtonItem = sender;
        popPC.permittedArrowDirections = UIPopoverArrowDirectionAny;
        popPC.delegate = self;

        self.popSegue = (UIStoryboardPopoverSegue*)segue;
    }
}

@end
