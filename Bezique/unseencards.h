#ifndef UNSEENCARDS_H
#define UNSEENCARDS_H
#include <QList>
#include "card.h"

class BeziqueHand;
class UnseenCards
{
public:
    UnseenCards();
    void reset();
    void haveSeen(const Card& card);
    void haveSeen(int cardId);
    void haveSeen(int rank, int suit);
    void haveSeenHand(BeziqueHand* hand);
    int numUnseen(int rank, int suit) const;
    int numUnseenRank(int rank) const;
    int numUnseen() const;
    int unseenThatBeat(Card* card, int trumps) const;

    void Dump();
private:
    QList<QList<int> > unseenCards;
};

#endif // UNSEENCARDS_H
