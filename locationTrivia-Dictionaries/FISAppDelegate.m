//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

    return YES;
}

/** 
 
 *  Write your method implementations here.
 
 */

// Return string containing beginning of location's name using submitted argument length
- (NSString *)stringByTruncatingNameOfLocation:(NSDictionary *)location toLength:(NSUInteger)length {
    NSMutableString *stringByTruncatingNameOfLocation ;
    if (length >= [location[@"name"] length]) {
        stringByTruncatingNameOfLocation = location[@"name"]
        ;    }
    else {
        stringByTruncatingNameOfLocation = [ location[@"name"] substringToIndex:(length)];
    }
    NSLog(@"%@", stringByTruncatingNameOfLocation);
    return stringByTruncatingNameOfLocation;
}

// return a dictionary containing 3 argument values stored in argument names
- (NSDictionary *)dictionaryForLocationWithName:(NSString *)name latitude:(CGFloat)latitude longitude:(CGFloat)longitude {
    NSDictionary *dictionaryForLocationWithName = @{
        @"name" : name ,
        @"latitude" : @(latitude) ,
        @"longitude" : @(longitude)
        };
    
    return dictionaryForLocationWithName;
}

//  return an array of all the values for the name key
- (NSArray *)namesOfLocations:(NSArray *)locations {
//    NSPredicate *names = [ NSPredicate predicateWithFormat:@"%@ IN locations", @"name"];
    NSArray *namesOfLocations = [ locations valueForKey:@"name" ];
    return namesOfLocations;
}

// returns YES only if location dictionary has exactly 3 keys by the names of @name, @latitude, and @longitude
- (BOOL)dictionaryIsValidLocation:(NSDictionary *)location {
    BOOL dictionaryIsValidLocation ;
    if ( [[location allKeys] isEqualToArray:@[ @"name", @"longitude", @"latitude",  ] ]) {
        dictionaryIsValidLocation = YES ;
    }
    else {
        dictionaryIsValidLocation = NO ;
    }
    return dictionaryIsValidLocation;
}

- (NSDictionary *)locationNamed:(NSString *)name inLocations:(NSArray *)locations {
    NSMutableDictionary *locationNamed = [ NSMutableDictionary dictionary ];
    NSPredicate *checkIfHas = [ NSPredicate predicateWithFormat:@"self CONTAINS %@", name] ;
    NSArray *location = [ locations filteredArrayUsingPredicate:checkIfHas ] ;
//    for ( NSString *key in location) {
//        [ locationNamed setObject:<#(nonnull id)#> forKey:<#(nonnull id<NSCopying>)#>];
//    }
//    
    if ([ location count ] > 0) {
        
    locationNamed = location[0] ;
    }
    else {
        locationNamed = nil ;
    }
    return locationNamed;
}
@end
