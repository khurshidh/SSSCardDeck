//
//  SSSCardDeck.h
//
//  Description:
//  Class for a deck of cards.
//
//  Author: K. Hashim
//

#import <Foundation/Foundation.h>
#import "SSSCard.h"

@interface SSSCardDeck : NSObject

+(instancetype) standardDeck; // factory method to create a standard deck of card
                              // In future we could have other types of decks created

// deck shuffle methods
- (void) shuffleByRandomInterleavingForPassCount:(NSInteger) numberOfPasses;
- (void) shuffleByRandomCuttingForPassCount:(NSInteger) numberOfPasses;


// card dealing methods
-(SSSCard *) getTopCard;    // get card from the top of the deck - removes the card from the deck
-(SSSCard *) getBottomCard; // get card from bottom of the deck - removes the card from the deck

// deck status methods
- (NSUInteger) numberOfCardsInDeck;

@end
