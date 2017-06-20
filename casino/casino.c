#include <stdio.h>
#include <time.h>
#include <stdlib.h>

#define START_BET 1000

int main (int argc, char *argv[])
{
	int iterations = 100;
	if (argc > 1) {
		iterations = atoi(argv[1]);
	}

	// seed the random number generator
	srand(time(NULL));

	int black;
	int bet, run, total_bet, won;
	int highest_bet = 0, longest_run = 0, total_won = 0, highest_total_bet = 0;

	int i;
	for (i = 0; i < iterations; i++) {
		bet = START_BET;
		run = 0;
		total_bet = 0;
		won = 0;
		while (1) {
			total_bet += bet;
			if (total_bet > highest_total_bet) {
				highest_total_bet = total_bet;
			}
			black = (rand() % 2) == 0;
			if (black) {
				// we lost, double the bet
				bet *= 2;
				if (bet > highest_bet) {
					highest_bet = bet;
				}
				// increment the losing run count
				run++;
				if (run > longest_run) {
					longest_run = run;
				}
			} else {
				// we won
				won = (bet * 2) - total_bet;
				total_won += won;
				/*
				printf("=== Round %d ===\n", i);
				printf("Losing run: %d\n", run);
				printf("Total bet: %d\n", total_bet);
				printf("Last bet: %d\n", bet);
				printf("Winnings: %d\n", won);
				*/
				break;
			}
		}
	}

	printf("=== Final Stats ===\n");
	printf("Total won: %d\n", total_won);
	printf("Highest single bet: %d\n", highest_bet);
	printf("Highest total bet: %d\n", highest_total_bet);
	printf("Longest losing streak: %d\n", longest_run);

	return 0;
}
