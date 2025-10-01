#ifndef CONFIG_H
#define CONFIG_H

// String used to delimit block outputs in the status.
#define DELIMITER " | "

// Maximum number of Unicode characters that a block can output.
#define MAX_BLOCK_OUTPUT_LENGTH 45

// Control whether blocks are clickable.
#define CLICKABLE_BLOCKS 1

// Control whether a leading delimiter should be prepended to the status.
#define LEADING_DELIMITER 0

// Control whether a trailing delimiter should be appended to the status.
#define TRAILING_DELIMITER 0

// Define blocks for the status feed as X(icon, cmd, interval, signal).
#define BLOCKS(X)             \
    X("", 	"blocks battery", 		10,	1)  \
    X("", 	"blocks wifi", 			5, 	2)   \
    X(" ", 	"blocks brightness", 		0, 	3) \
    X("", 	"blocks volume", 		3, 	4) \
    X("📅 ", 	"date +'%a %h %d %r'", 		1, 	5) \
    X("", 	"echo '^c#ff2c2c^󰳶  '", 	0, 	0)
    //X("", 	"echo '^c#fffd00^󰳶  '", 	0, 	0)

#endif  // CONFIG_H
