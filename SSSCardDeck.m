//
//  SSSCardDeck.m
//
//  Description:
//  Cards in the deck are stored in an array.
//  Array index is the location of the card in the deck.
//
//  Author: K. Hashim
//

#import "SSSCardDeck.h"

// private interface
@interface SSSCardDeck ()

@property (nonatomic, strong) NSMutableArray *cardsArray; // array for holding cards in the deck

- (instancetype) initWithStandardSuit;

@end



// implementation
@implementation SSSCardDeck

// creation methods
+(instancetype) standardDeck {
    return [[SSSCardDeck alloc] initWithStandardSuit];    
}


-(instancetype) initWithStandardSuit {
    self = [super init];
    if (self) {
        self.cardsArray = [NSMutableArray arrayWithCapacity:52];

        for (SSSCardSuit suit = kSuitClub; suit <= kSuitSpade; suit++) {
            
            for (SSSCardValue value = kCardValueTwo; value <= kCardValueAce; value++) {
                
                SSSCard *card = [[SSSCard alloc] initWithSuit:suit andValue:value];
                [self.cardsArray addObject:card];
            }
        }
    }
    
    return self;
}



//
#pragma mark - deck status methods
//
- (NSUInteger) numberOfCardsInDeck {
    return [self.cardsArray count];
}

// define description method
- (NSString *) description {
    
    NSUInteger cardsCount = [self numberOfCardsInDeck];
    NSString *desc = [NSString stringWithFormat:@"Deck (%d): ", cardsCount];
    
    for (NSUInteger i = 0; i < cardsCount; i++) {
        SSSCard *card = [self.cardsArray objectAtIndex:i];
        NSString *cardDesc = [NSString stringWithFormat:@"%@ ", card.description];
        desc = [desc stringByAppendingString:cardDesc];
    }
    
    return desc;
}



//
#pragma mark - shuffle methods
//

- (void) shuffleByRandomInterleavingForPassCount:(NSInteger) numberOfPasses {
    // Shuffle by interleaving cards from random locations in deck
    
    NSUInteger cardsCount = [self numberOfCardsInDeck];
    
    if (cardsCount > 1) {
        
        for (NSUInteger pass = 0; pass < numberOfPasses; pass++) {
            
            // move all cards to a temporary array
            NSMutableArray *tmpArray = [NSMutableArray arrayWithArray:self.cardsArray];
            [self.cardsArray removeAllObjects];
            
            // move random card from tmpArray to self.cardsArray until all cards moved
            int randomLocation;
            NSUInteger cardsLeft = cardsCount; // cards left to move
            
            while (cardsLeft != 0) {
                randomLocation = arc4random_uniform(cardsLeft);
                
                SSSCard *card = [tmpArray objectAtIndex:randomLocation];
                [self.cardsArray addObject:card];
                [tmpArray removeObjectAtIndex:randomLocation];
                
                cardsLeft--;
            }
            
        }
    }
    
}



- (void) shuffleByRandomCuttingForPassCount:(NSInteger) numberOfPasses {
    // Shuffles by splitting the deck into two parts at random location and swapping the parts
    
    NSUInteger cardsCount = [self numberOfCardsInDeck];
    
    if (cardsCount > 2) {
        for (NSUInteger pass = 0; pass < numberOfPasses; pass++) {
            
            NSUInteger cutIndex = arc4random_uniform(cardsCount - 2);
            // -2 because -1 for max index and another -1 to leave atleast one card after cut
            
            NSRange topRange = NSMakeRange(0, cutIndex);
            NSArray *topPart = [NSArray arrayWithArray:[self.cardsArray subarrayWithRange:topRange]];
            
            NSRange bottomRange = NSMakeRange(cutIndex, cardsCount-cutIndex);
            NSArray *bottomPart = [NSArray arrayWithArray:[self.cardsArray subarrayWithRange:bottomRange]];
            
            // swap top and bottom parts
            [self.cardsArray removeAllObjects];
            [self.cardsArray addObjectsFromArray:bottomPart];
            [self.cardsArray addObjectsFromArray:topPart];
            
        }
    }
    
}


//
#pragma mark - card dealing methods
//

- (SSSCard *) getTopCard {
    __autoreleasing SSSCard *card = nil;
    
    if ([self numberOfCardsInDeck] != 0) {
        card = [self.cardsArray objectAtIndex:0];
        [self.cardsArray removeObjectAtIndex:0];
    }
    
    return card;
}


- (SSSCard *) getBottomCard {
    __autoreleasing SSSCard *card = nil;

    NSUInteger cardsCount = [self numberOfCardsInDeck];
    if (cardsCount != 0) {
        card = [self.cardsArray objectAtIndex:cardsCount-1];
        [self.cardsArray removeObjectAtIndex:cardsCount-1];
    }
    
    return card;
}


@end
