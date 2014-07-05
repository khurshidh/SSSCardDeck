//
//  SSSCard.h
//
//  Description:
//  SSSCard class for a card in a CardDeck.
//
//  Author: K. Hashim
//

#import <Foundation/Foundation.h>


// Enumeration for the 4 possible suits a card can belong to.
typedef enum : NSUInteger {
    kSuitClub,
    kSuitDiamond,
    kSuitHeart,
    kSuitSpade
} SSSCardSuit;

// Enumeration for the 13 possible card values
typedef enum : NSUInteger {
    kCardValueTwo = 2,
    kCardValueThree,
    kCardValueFour,
    kCardValueFive,
    kCardValueSix,
    kCardValueSeven,
    kCardValueEight,
    kCardValueNine,
    kCardValueTen,
    kCardValueJack,
    kCardValueQueen,
    kCardValueKing,
    kCardValueAce
} SSSCardValue;


@interface SSSCard : NSObject

@property (nonatomic, readonly) SSSCardSuit suit; // card suit
@property (nonatomic, readonly) SSSCardValue value;  // card value


// init method
- (instancetype) initWithSuit:(SSSCardSuit) suit andValue:(SSSCardValue) value;

@end
