//
//  SSSCard.m
//
//  Description:
//  SSSCard implementation.
//
//  Author: K. Hashim
//

#import "SSSCard.h"

@implementation SSSCard


- (instancetype) initWithSuit:(SSSCardSuit) suit andValue:(SSSCardValue) value {
    self = [super init];
    if (self) {
        _suit = suit;
        _value = value;
    }
    
    return self;
}




// description method for SSSCard
- (NSString *) description {
    NSString *suitName;
    if (self.suit == kSuitClub) {
        suitName = @"C";
    } else if (self.suit == kSuitDiamond) {
        suitName = @"D";
    } else if (self.suit == kSuitHeart) {
        suitName = @"H";
    } else if (self.suit == kSuitSpade) {
        suitName = @"S";
    } else {
        suitName = @"X";
    }
        
    return [NSString stringWithFormat:@"%d%@",self.value, suitName];
}

@end
