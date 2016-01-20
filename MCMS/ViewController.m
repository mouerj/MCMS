//
//  ViewController.m
//  MCMS
//
//  Created by Joseph Mouer on 1/19/16.
//  Copyright © 2016 Joseph Mouer. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"
#import "CreatureViewController.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textField;

@end

@implementation ViewController

//instantiated mutable array "creatures" with objects of MagicalCreature type
- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *creatureOne = [[MagicalCreature alloc] initWithName:@"Pokemon" andImageNamed:@"creature1.png"];
    MagicalCreature *creatureTwo = [[MagicalCreature alloc]initWithName:@"Deathclaw" andImageNamed:@"creature2.png"];
    MagicalCreature *creatureThree = [[MagicalCreature alloc]initWithName:@"Parrthumax" andImageNamed:@"creature3.png"];
    self.creatures = [NSMutableArray arrayWithObjects:creatureOne,creatureTwo, creatureThree, nil];
}
-(void)viewWillAppear:(BOOL)animated {
    [self.tableView reloadData];
    NSLog([self.creatures description]);
}
//Mandatory TableView Delegate Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.creatures.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell = [tableView dequeueReusableCellWithIdentifier:@"CellID"];
    MagicalCreature *creature = [self.creatures objectAtIndex:indexPath.row];
    cell.textLabel.text = creature.name;
    return cell;
}
//Add new creature to the mutable array
- (IBAction)onButtonAdd:(UIBarButtonItem *)sender {
    if (self.textField.text.length > 0) {
        NSString *newCreature = self.textField.text;
        MagicalCreature *creature = [[MagicalCreature alloc]initWithName:newCreature andImageNamed:@"creature1"];
        [self.creatures addObject:creature];
        [self.tableView reloadData];
        [self.tableView resignFirstResponder];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    CreatureViewController *cvc = [segue destinationViewController];
    NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
    cvc.title = [[self.creatures objectAtIndex:indexPath.row]name];
    cvc.creature = [self.creatures objectAtIndex:indexPath.row];
}
//allow editing to occur
-(BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

@end
