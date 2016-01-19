//
//  ViewController.m
//  MCMS
//
//  Created by Joseph Mouer on 1/19/16.
//  Copyright © 2016 Joseph Mouer. All rights reserved.
//

#import "ViewController.h"
#import "MagicalCreature.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>
@property NSMutableArray *creatures;
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    MagicalCreature *creatureOne = [[MagicalCreature alloc]initWithName:@"Pokemon"];
    MagicalCreature *creatureTwo = [[MagicalCreature alloc]initWithName:@"Deathclaw"];
    MagicalCreature *creatureThree = [[MagicalCreature alloc]initWithName:@"Paarthumax"];
    self.creatures = [NSMutableArray arrayWithObjects:creatureOne,creatureTwo, creatureThree, nil];
    
}

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


@end
