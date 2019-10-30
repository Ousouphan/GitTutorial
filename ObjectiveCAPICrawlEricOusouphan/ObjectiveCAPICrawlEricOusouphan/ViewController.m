//
//  ViewController.m
//  ObjectiveCAPICrawlEricOusouphan
//
//  Created by mcs on 10/27/19.
//  Copyright © 2019 EricOusouphan. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()



@property (weak, nonatomic) IBOutlet UITableView *pokemonTable;
@property NSArray *pokemonArray;
@property NSDictionary *jsonDictionary;
@property NSArray *sortedKeys;
@property NSString *nextAPI;
@end

@implementation ViewController

- (void)viewDidLoad {
  [super viewDidLoad];
  
  _pokemonTable.dataSource = self;
  _pokemonTable.delegate = self;
  
  if(!_nextAPI) {
    _nextAPI = @"https://pokeapi.co/api/v2";
  }
  
  NSURL *url = [NSURL URLWithString: _nextAPI];
  NSURLSession *task = [NSURLSession sharedSession];
  __weak typeof(self) weakSelf = self;
  NSURLSessionDataTask *dataTask = [task dataTaskWithURL:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
    NSData *dataResponse = data;
    id jsonObject = [NSJSONSerialization JSONObjectWithData:dataResponse options:kNilOptions error:nil];
    if([jsonObject isKindOfClass:[NSDictionary class]]) {
//      NSLog(@"is a dictionary");
      weakSelf.jsonDictionary = jsonObject;
    
    } else {
      weakSelf.pokemonArray = jsonObject;
    }
    dispatch_sync(dispatch_get_main_queue(), ^{
      [self.pokemonTable reloadData];
    });
  }];
  [dataTask resume];
  }


 - (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
   if(_pokemonArray.count == 0) {
     return _jsonDictionary.count;
   } else {
     return _pokemonArray.count;
   }
 }


 - (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   _sortedKeys = [_jsonDictionary.allKeys sortedArrayUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
   if (_pokemonArray.count == 0) {
     UITableViewCell *cell = [[UITableViewCell alloc]
                              initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
     NSArray *key = _sortedKeys[indexPath.row];
     cell.textLabel.text = [NSString stringWithFormat:@"%@", key];
     
     id value = _jsonDictionary[key];
     if ([value isKindOfClass:[NSNumber class]]) {
       cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", value];
     } else if ([value isKindOfClass:[NSString class]]) {
       cell.detailTextLabel.text = [NSString stringWithFormat:@"%@", value];
     } else if ([value isKindOfClass:[NSArray class]]) {
       NSArray *arrayValue = value;
       cell.detailTextLabel.text = [NSString stringWithFormat:@"Total Array: %li", arrayValue.count];
     } else if ([value isKindOfClass:[NSDictionary class]]) {
       NSDictionary *dictionaryValue = value;
       cell.detailTextLabel.text = [NSString stringWithFormat:@"@Total Dictionaries: %li", dictionaryValue.count];
     } else if ([value isKindOfClass:[NSNull class]]) {
       cell.detailTextLabel.text = @"Null Value";
     }
     return cell;
   } else {
     UITableViewCell *cell = [[UITableViewCell alloc]
                              initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
     cell.textLabel.text = [NSString stringWithFormat:@"Index[%li]", indexPath.row];
     return cell;
   }
 }


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
  UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
  ViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"secondView"];
//
  if (_pokemonArray == 0) {
    id value = _jsonDictionary[_sortedKeys[indexPath.row]];
    if ([value isKindOfClass: [NSString class]]) {
      NSString *string = value;
      if ([string containsString:@"http"]) {
        viewController.nextAPI = string;
        [self.navigationController pushViewController:viewController animated:true];
      }
    }
  }
}
  @end
  
