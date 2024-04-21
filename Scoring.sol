// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Scoring
{
    struct SpecialCard {
        uint8 id;
        uint256 youWin;
        uint256 opponentLoses;
    }

    SpecialCard opponentLosesFive = SpecialCard(1, 0, 5);
    SpecialCard youWinFive = SpecialCard(2, 5, 0);
    SpecialCard opponentLosesThree = SpecialCard(3, 0, 3);
    SpecialCard youWinThree = SpecialCard(4, 3, 0);
    SpecialCard youWinTwo_opponentLosesTwo = SpecialCard(5, 2, 2);
    SpecialCard opponentLosesTwo = SpecialCard(6, 0, 2);
    SpecialCard youWinTwo = SpecialCard(7, 2, 0);
    SpecialCard youWinOne_opponentLosesThree = SpecialCard(8, 1, 3);
    SpecialCard youWinThree_opponentLosesOne = SpecialCard(9, 3, 1);
    SpecialCard youWinFour = SpecialCard(10, 4, 0);

    constructor() {
    }

    function takesCards() public view returns(SpecialCard[] memory, SpecialCard[] memory) {
        SpecialCard[] memory cardsPlayer1 = generateRandomNumbersForPlayer(1);
        SpecialCard[] memory cardsPlayer2 = generateRandomNumbersForPlayer(2);
        return (cardsPlayer1, cardsPlayer2);
    }

    function getSpecialCard(uint256 index) private view returns(SpecialCard memory) {
        SpecialCard[] memory specialCards = new SpecialCard[](10);
        specialCards[0] = opponentLosesFive;
        specialCards[1] = youWinFive;
        specialCards[2] = opponentLosesThree;
        specialCards[3] = youWinThree;
        specialCards[4] = youWinTwo_opponentLosesTwo;
        specialCards[5] = opponentLosesTwo;
        specialCards[6] = youWinTwo;
        specialCards[7] = youWinOne_opponentLosesThree;
        specialCards[8] = youWinThree_opponentLosesOne;
        specialCards[9] = youWinFour;

        return specialCards[index];
    }

    function generateRandomNumbersForPlayer(uint256 numero) private view returns (SpecialCard[] memory) {
        SpecialCard[] memory specialCardsForPlayer = new SpecialCard[](5);
        uint256[] memory ramdomNumbers = new uint256[](5);

        uint256 randomSeed = block.timestamp;

        ramdomNumbers[0] = randomSeed % 10;
        ramdomNumbers[1] = randomSeed % 9;
        ramdomNumbers[2] = randomSeed % 8;
        ramdomNumbers[3] = randomSeed % 7;
        ramdomNumbers[4] = randomSeed % 6;

        for (uint256 i = 0; i < ramdomNumbers.length; i++) {
            if (ramdomNumbers[i] + numero < 10) {
                ramdomNumbers[i] += numero;
            }

            specialCardsForPlayer[i] = getSpecialCard(ramdomNumbers[i]);
        }

        return specialCardsForPlayer;
    }
  
}