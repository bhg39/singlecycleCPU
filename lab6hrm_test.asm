# Copyright 2014, Skand Hurkat
#
# This program is offered in the hope that it will be useful, but
# WITHOUT ANY WARRANTY, without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#

# This file simply accepts BPI from IOB and writes it to the two
# left 7-segments. TO write IOB put SW8 to 1, place a value to
# SW[7:0], and press KEY3.

sub	r0, r0, r0

HALT

# read input BPI from IOB
lb	r2, -6(r0)
addi	r4, r2, -30
bltz	r4, 2
addi	r2, r0, 29
sll	r2, r2

# Display this on IOF/G
lb	r3, 0(r2)
sb	r3, -2(r0)
lb	r3, 1(r2)
sb	r3, -1(r0)

# Insert your modifications below this line
# ----------------------------------------------------------------------

# Insert your modifications above this line
# ----------------------------------------------------------------------

