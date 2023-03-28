#!/usr/bin/wish
#############################################################################
# Visual Tcl v1.20 Project
#

#################################
# GLOBAL VARIABLES
#
global scalefact;
set scalefact 2
global battleslow;
set battleslow 1
global afile; 
global bishopa; 
global bishopd; 
global bishopr; 
global bishopv; 
global blackscore; 
global board; 
global gr1; 
global help; 
global kinga; 
global kingd; 
global kingr; 
global kingv; 
global knighta; 
global knightd; 
global knightr; 
global knightv; 
global pawna; 
global pawnd; 
global pawnr; 
global pawnv; 
global piece; 
global piecestr; 
global queena; 
global queend; 
global queenr; 
global queenv; 
global randz; 
global rooka; 
global rookd; 
global rookr; 
global rookv; 
global whitescore; 
global widget; 
    set widget(boardh) {.top17.fra19.can23}
    set widget(drgtst) {.top20}
    set widget(drgtstc) {.top20.fra22.can23}
    set widget(rev,.top17) {zbcw}
    set widget(rev,.top17.fra19.can23) {boardh}
    set widget(rev,.top18) {zbsplash}
    set widget(rev,.top18.can19) {zbsplashc}
    set widget(rev,.top20) {drgtst}
    set widget(rev,.top20.can21) {drgtstc}
    set widget(rev,.top20.fra22.can23) {drgtstc}
    set widget(zbcw) {.top17}
    set widget(zbsplash) {.top18}
    set widget(zbsplashc) {.top18.can19}
global xs; 
global ys; 
global z; 

#################################
# USER DEFINED PROCEDURES
#
proc init {argc argv} {
global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile global randz
global scalefact

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore
}

init $argc $argv


proc {arconv2} {arx ary aylim} {
	# what does this do and why?

	set temp [expr (($arx * $aylim) - $aylim) + $ary];
	# randx = (randx*25173+13849) % 65536
	# store 0 to randx
	# @ 3,1 say 'Enter a random number seed between 0 and 65536. ' get randx picture '99999'

	return $temp
}

proc sleep N {
    after [expr {int($N * 1000)}]
}


# king

proc {king} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	set colr blue
	set sqsz [expr {35 * $scalefact}]
	#set px 75
	#set py 40
	$widget(boardh) create polygon [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+25*$z*$scalefact]  [expr $px+25*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+3*$z*$scalefact] [expr $px+18*$z*$scalefact] [expr $py+3*$z*$scalefact] [expr $px+18*$z*$scalefact] [expr $py+2*$z*$scalefact] [expr $px+12*$z*$scalefact] [expr $py+2*$z*$scalefact] [expr $px+12*$z*$scalefact] [expr $py+3*$z*$scalefact] [expr $px+14*$z*$scalefact] [expr $py+3*$z*$scalefact] [expr $px+14*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+15*$z*$scalefact] [expr $py+1*$z*$scalefact] -fill $colrc -tags {movable}
}

# queen

proc {queen} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	#set colr blue
	set sqsz [expr {35 * $scalefact}]
	#set px 110
	#set py 40
	set z 1


	$widget(boardh) create polygon [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+9*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+9*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] -fill $colrc -tags {movable}

	#$widget(boardh) create arc [expr $px+11*$z] [expr $py+5*$z] [expr $px+19*$z] [expr $py+13*$z] -extent 359 -fill $colrc -start 270 -style chord
	#$widget(boardh) create arc [expr $px+14*$z] [expr $py+3*$z] [expr $px+16*$z] [expr $py+5*$z] -extent 359 -fill $colrc -start 270 -style chord

}


# rook

proc {rook} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	#set colr blue
	set sqsz [expr {35 * $scalefact}]
	#set px 180
	#set py 40
	set z 1


	$widget(boardh) create polygon [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+19*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+22*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+22*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+20*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+20*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+18*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+18*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+14*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+14*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+12*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+12*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+10*$z*$scalefact] [expr $py+6*$z*$scalefact] [expr $px+10*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+8*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+8*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+11*$z*$scalefact] [expr $py+23*$z*$scalefact] -fill $colrc -tags {movable}
}


# bishop

proc {bishop} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	#set colr blue
	set sqsz [expr {35 * $scalefact}]
	#set px 145
	#set py 40
	set z 1

	$widget(boardh) create polygon [expr $px+14*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+22*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+8*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+14*$z*$scalefact] [expr $py+5*$z*$scalefact] -fill $colrc -tags {movable}
}


# knight

proc {knight} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	#set colr blue
	set sqsz [expr {35 * $scalefact}]
	#set px 215
	#set py 40
	set z 1

	$widget(boardh) create polygon [expr $px+7*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+25*$z*$scalefact] [expr $px+25*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+23*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+23*$z*$scalefact] [expr $py+15*$z*$scalefact] [expr $px+17*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+17*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+5*$z*$scalefact] [expr $px+16*$z*$scalefact] [expr $py+7*$z*$scalefact] [expr $px+5*$z*$scalefact] [expr $py+15*$z*$scalefact] [expr $px+6*$z*$scalefact] [expr $py+17*$z*$scalefact] [expr $px+15*$z*$scalefact] [expr $py+15*$z*$scalefact] [expr $px+7*$z*$scalefact] [expr $py+23*$z*$scalefact] -fill $colrc -tags {movable}
}


# pawn

proc {pawn} {px py colrc} {
	global widget boardh z xs ys gcx gcy whitescore blackscore
	global scalefact
	#set colr blue
	#set sqsz [expr {35 * $scalefact}]
	#set px 40
	#set py 40


	$widget(boardh) create polygon [expr $px+13*$z*$scalefact] [expr $py+23*$z*$scalefact] [expr $px+7*$z*$scalefact] [expr $py+23*$z*$scalefact]  [expr $px+7*$z*$scalefact] [expr $py+25*$z*$scalefact]  [expr $px+23*$z*$scalefact] [expr $py+25*$z*$scalefact]  [expr $px+23*$z*$scalefact] [expr $py+23*$z*$scalefact]  [expr $px+17*$z*$scalefact] [expr $py+23*$z*$scalefact]  [expr $px+17*$z*$scalefact] [expr $py+9*$z*$scalefact]  [expr $px+19*$z*$scalefact] [expr $py+9*$z*$scalefact]  [expr $px+19*$z*$scalefact] [expr $py+8*$z*$scalefact]  [expr $px+16*$z*$scalefact] [expr $py+8*$z*$scalefact]  [expr $px+16*$z*$scalefact] [expr $py+7*$z*$scalefact]  [expr $px+14*$z*$scalefact] [expr $py+7*$z*$scalefact]  [expr $px+14*$z*$scalefact] [expr $py+8*$z*$scalefact]  [expr $px+11*$z*$scalefact] [expr $py+8*$z*$scalefact]  [expr $px+11*$z*$scalefact] [expr $py+9*$z*$scalefact]  [expr $px+13*$z*$scalefact] [expr $py+9*$z*$scalefact]  [expr $px+13*$z*$scalefact] [expr $py+23*$z*$scalefact] -fill $colrc -tags {movable}

}


proc {basqueenpawn} {} {
# quickbasic code for queenpawn
# 
SUB queenpawn
   SHARED gscrn, xs, ys, gr1, z, gcx, gcy, i%, mxs, mys, bds%, bdd%, id%, mxd, myd, ii, jj, csquare
   SHARED wp%, wb%, bp%, bb%, pe%, gf%, gb%
   ' attempt at handling queening a pawn ---------------------------
   VIEW (10 * z, 10 * z)-(xs - 10 * z, 345 * z), , 7
   VIEW
   IF piece(i%, 8) = 6 AND piece(i%, 4) <> -99 THEN   ' piece is a pawn
      IF piece(i%, 6) = 0 AND (bdd% > 0 AND bdd% < 9) THEN ' on blacks home row
         LOCATE 10, 5
         PRINT "Change your pawn into what piece?"
         LOCATE 11, 5
         PRINT "Queen   -   2   |   Bishop   -   3"
         LOCATE 12, 5
         PRINT "Knight  -   4   |   Rook     -   5"
wrongpc: LOCATE 13, 5
         INPUT newpc%
         IF newpc% < 2 THEN GOTO wrongpc
         IF newpc% > 5 THEN GOTO wrongpc

         ' erase pawn from square
         IF getcolour(piece(i%, 4), piece(i%, 5)) = 0 THEN
            LINE (piece(i%, 4), piece(i%, 5))-(piece(i%, 4) + gr1, piece(i%, 5) + gr1), wb%, BF
         ELSE
            LINE (piece(i%, 4), piece(i%, 5))-(piece(i%, 4) + gr1, piece(i%, 5) + gr1), bb%, BF
         END IF ' colour of board

         piece(i%, 8) = newpc%

         IF newpc% = 2 THEN
            piece(i%, 1) = queena   ' queen attack strength
            piece(i%, 2) = queend   ' queen defend strength
            piece(i%, 3) = queenr   ' queen recouperate
            piece(i%, 7) = queenv   ' queen value
            piece(i%, 9) = queena   ' start attack strength, used as limit for recovery
            piece(i%, 10) = queend  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 2

         IF newpc% = 3 THEN
            piece(i%, 1) = bishopa   ' bishop attack strength
            piece(i%, 2) = bishopd   ' bishop defend strength
            piece(i%, 3) = bishopr   ' bishop recouperate
            piece(i%, 7) = bishopv   ' bishop value
            piece(i%, 9) = bishopa   ' start attack strength, used as limit for recovery
            piece(i%, 10) = bishopd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 3

         IF newpc% = 4 THEN
            piece(i%, 1) = knighta   ' knight attack strength
            piece(i%, 2) = knightd   ' knight defend strength
            piece(i%, 3) = knightr   ' knight recouperate
            piece(i%, 7) = knightv   ' bishop value
            piece(i%, 9) = knighta   ' start attack strength, used as limit for recovery
            piece(i%, 10) = knightd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 4

         IF newpc% = 5 THEN
            piece(i%, 1) = knighta   ' knight attack strength
            piece(i%, 2) = knightd   ' knight defend strength
            piece(i%, 3) = knightr   ' knight recouperate
            piece(i%, 7) = knightv   ' bishop value
            piece(i%, 9) = knighta   ' start attack strength, used as limit for recovery
            piece(i%, 10) = knightd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 5

         IF newpc% = 6 THEN
            piece(13, 1) = rooka     ' rook attack strength
            piece(13, 2) = rookd     ' rook defend strength
            piece(13, 3) = rookr     ' rook recouperate
            piece(13, 7) = rookv     ' rook value
            piece(13, 9) = rooka   ' start attack strength, used as limit for recovery
            piece(13, 10) = rookd  ' start defend strength, used as limit for recovery
         END IF 'newpc% = 6

         moveen

      END IF  ' on blacks home row


      IF piece(i%, 6) = 1 AND (bdd% > 55 AND bdd% < 65) THEN 'on whites home row
         LOCATE 10, 5
         PRINT "Change your pawn into what piece?"
         LOCATE 11, 5
         PRINT "Queen   -   2   |   Bishop   -   3"
         LOCATE 12, 5
         PRINT "Knight  -   4   |   Rook     -   5"
wrongpc1: LOCATE 13, 5
         INPUT newpc%
         IF newpc% < 2 THEN GOTO wrongpc1
         IF newpc% > 5 THEN GOTO wrongpc1

         ' erase pawn from square
         IF getcolour(piece(i%, 4), piece(i%, 5)) = 0 THEN
            LINE (piece(i%, 4), piece(i%, 5))-(piece(i%, 4) + gr1, piece(i%, 5) + gr1), wb%, BF
         ELSE
            LINE (piece(i%, 4), piece(i%, 5))-(piece(i%, 4) + gr1, piece(i%, 5) + gr1), bb%, BF
         END IF ' colour of board

         piece(i%, 8) = newpc%

         IF newpc% = 2 THEN
            piece(i%, 1) = queena   ' queen attack strength
            piece(i%, 2) = queend   ' queen defend strength
            piece(i%, 3) = queenr   ' queen recouperate
            piece(i%, 7) = queenv   ' queen value
            piece(i%, 9) = queena   ' start attack strength, used as limit for recovery
            piece(i%, 10) = queend  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 2

         IF newpc% = 3 THEN
            piece(i%, 1) = bishopa   ' bishop attack strength
            piece(i%, 2) = bishopd   ' bishop defend strength
            piece(i%, 3) = bishopr   ' bishop recouperate
            piece(i%, 7) = bishopv   ' bishop value
            piece(i%, 9) = bishopa   ' start attack strength, used as limit for recovery
            piece(i%, 10) = bishopd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 3

         IF newpc% = 4 THEN
            piece(i%, 1) = knighta   ' knight attack strength
            piece(i%, 2) = knightd   ' knight defend strength
            piece(i%, 3) = knightr   ' knight recouperate
            piece(i%, 7) = knightv   ' bishop value
            piece(i%, 9) = knighta   ' start attack strength, used as limit for recovery
            piece(i%, 10) = knightd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 4

         IF newpc% = 5 THEN
            piece(i%, 1) = knighta   ' knight attack strength
            piece(i%, 2) = knightd   ' knight defend strength
            piece(i%, 3) = knightr   ' knight recouperate
            piece(i%, 7) = knightv   ' bishop value
            piece(i%, 9) = knighta   ' start attack strength, used as limit for recovery
            piece(i%, 10) = knightd  ' start defend strength, used as limit for recovery
         END IF ' newpc% = 5

         IF newpc% = 6 THEN
            piece(13, 1) = rooka     ' rook attack strength
            piece(13, 2) = rookd     ' rook defend strength
            piece(13, 3) = rookr     ' rook recouperate
            piece(13, 7) = rookv     ' rook value
            piece(13, 9) = rooka   ' start attack strength, used as limit for recovery
            piece(13, 10) = rookd  ' start defend strength, used as limit for recovery
         END IF 'newpc% = 6

         moveen

      END IF ' on whites home row

   END IF ' piece is a pawn
END SUB
}

proc {battle} {} {
	# battles are fought here
	global gscrn xs ys gr1 z gcx gcy i id mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr
	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq bds bdd attack defend randz
	set lp1 1
	set k3 [arconv2 $i 1 10]
	set attack1 $piece($k3)
	set k4 [arconv2 $id 2 10]
	set defend1 $piece($k3)

	while {($attack1 != 0) && ($defend1 != 0)} {
		# ---------------------------        is the above logic correct?? Check...
		set lk [rnd 8]
		#puts "lk is $lk"
		if "$lk == 0" {
			puts "The attacking $attack lands a mighty blow!"
			.top17.fra20.tex55 insert end "The attacking $attack lands a mighty blow!\n"
			.top17.fra20.tex55 see end
			set defend1 [expr int(($defend1 * 5) / 6 )]
		}
		if "$lk == 1" {
			puts "The defending $attack gets in a gallant thrust!"
			.top17.fra20.tex55 insert end "The defending $attack gets in a gallant thrust!"
			.top17.fra20.tex55 see end
			if {$lp1 == 1} {
				set attack1 [expr int($attack1 / 2)]
				puts "It does great damage to the attacker!"
				.top17.fra20.tex55 insert end "It does great damage to the attacker!\n"
				.top17.fra20.tex55 see end
			} else {
				set attack1 [expr int(($attack1 * 5) /6)]
				.top17.fra20.tex55 insert end "\n"
				.top17.fra20.tex55 see end
			}
		}
 		if "$lk == 2" {
			puts "The valiant attacker draws blood."
			.top17.fra20.tex55 insert end "The valiant attacker draws blood.\n"
			.top17.fra20.tex55 see end
			set defend1 [expr int(($defend1 * 4) / 5 )]
		}
       		if "$lk == 3" {
			puts "The $defend puts up a strong defence and wounds the $attack!!"
			.top17.fra20.tex55 insert end "The $defend puts up a strong defence and wounds the $attack!!\n"
			.top17.fra20.tex55 see end
			set attack1 [expr int(($attack1 * 4) / 5)]
		}
       		if "$lk == 4" {
			puts "With a mighty cut, the $attack wounds the $defend."
			.top17.fra20.tex55 insert end "With a mighty cut, the $attack wounds the $defend.\n"
			.top17.fra20.tex55 see end
			set defend1 [expr int(($defend1 * 9) / 10)]
		}
       		if "$lk == 5" {
			puts "The defender lands  a crushing blow!"
			.top17.fra20.tex55 insert end "The defender lands  a crushing blow!\n"
			.top17.fra20.tex55 see end
			set attack1 [expr int(($attack1 * 9) /10)]
		}
       		if "$lk == 6" {
			puts "OH! Surely the $defend cannot long endure such a furious attack."
			.top17.fra20.tex55 insert end "OH! Surely the $defend cannot long endure such a furious attack.\n"
			.top17.fra20.tex55 see end
			set defend1 [expr int(($defend1 * 14) / 15)]
		}
        	if "$lk == 7" {
			puts "The $attack's attack falters and the $defend gets in a blow in return."
			.top17.fra20.tex55 insert end "The $attack's attack falters and the $defend gets in a blow in return.\n"
			.top17.fra20.tex55 see end
			set attack1 [expr int(($attack1 * 14) / 15)]     
		}
		if "$lk == 8" {
			puts "The combatants take a much needed rest."
			.top17.fra20.tex55 insert end "The combatants take a much needed rest.\n"
			.top17.fra20.tex55 see end
		}
		puts "Attack = $attack1            |            Defend = $defend1"
		.top17.fra20.tex55 insert end  "Attack = $attack1            |            Defend = $defend1 \n"
		.top17.fra20.tex55 see end

		set lp1 2
	}
	puts "Battle over - attack1 is $attack1, defend1 is $defend1."
	.top17.fra20.tex55 insert end "Battle over - attack1 is $attack1, defend1 is $defend1.\n"
	.top17.fra20.tex55 see end
	#if {($attack1 == 0) || ($defend1 == 0)} { }
	if {$defend1 == 0} {
		puts "The attacking $attack defeated the defending $defend!"
		.top17.fra20.tex55 insert end "The attacking $attack defeated the defending $defend!\n"
		.top17.fra20.tex55 see end
		if {$attack1 == 0} {
                  
			set attack1 [expr $attack1 + 1]
		}
		set piece([arconv2 $i 1 10]) $attack1
		set piece([arconv2 $i 2 10]) [expr $piece([arconv2 $i 2 10]) * ($attack1  / $piece([arconv2 $i 9  10])) * 4]
		puts "The attacker ended with a strength of $piece([arconv2 $i 1 10])"
		.top17.fra20.tex55 insert end "The attacker ended with a strength of $piece([arconv2 $i 1 10])\n"
		.top17.fra20.tex55 see end
		set piece([arconv2 $id 4 10]) -99
		set incrsc $piece([arconv2 $id 7 10])
		if {$piece([arconv2 $id 6 10]) == 0} {
			puts "incrsc is $incrsc"
			set blackscore [expr $blackscore + $incrsc]
		} else {
			set whitescore [expr $whitescore + $incrsc]
		}
	} else {
		# defence wins
		puts "The defending $defend defeated the attacking $attack!"
		.top17.fra20.tex55 insert end "The defending $defend defeated the attacking $attack!\n"
		.top17.fra20.tex55 see end
		set piece([arconv2 $id 2 10]) $defend1
		set piece([arconv2 $id 1 10]) [expr $piece([arconv2 $id 1 10]) * ($defend1  / $piece([arconv2 $id 10 10])) * 4]
		puts "The defender ended with a strength of $piece([arconv2 $id 2 10])"
		.top17.fra20.tex55 insert end "The defender ended with a strength of $piece([arconv2 $id 2 10])\n"
		.top17.fra20.tex55 see end
		set piece([arconv2 $i 4 10]) -99                
		set incrsc $piece([arconv2 $i 7 10])
		if {$piece([arconv2 $i 6 10]) == 0} {
			puts "incrsc is $incrsc"
			set blackscore [expr $blackscore + $incrsc]
		} else {
			set whitescore [expr $whitescore + $incrsc]
		}                
	}
	# Fake the stuff for now until I get a random function working
	puts "Battle over - attack1 is $attack1, defend1 is $defend1."
	.top17.fra20.tex55 insert end "Battle over - attack1 is $attack1, defend1 is $defend1.\n"
	.top17.fra20.tex55 see end
	#puts "Pow! Boff! Sock, wham - Blam! Crunch..."
	#.top17.fra20.tex55 insert end "Pow! Boff! Sock, wham - Blam! Crunch...\n"
	puts "Whitescore is $whitescore.  Blackscore is $blackscore."
	.top17.fra20.tex55 insert end "Whitescore is $whitescore.  Blackscore is $blackscore.\n"
	.top17.fra20.tex55 insert end "============================\n\n"
	.top17.fra20.tex55 see end
	drawbd
	putpcs
}

proc {binit} {} {
	# Board init routine?
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global scalefact


	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore

	set xs [expr {10 * $scalefact}]
	set ys [expr {10 * $scalefact}]


	set colr 0
	set gr1 [expr {35 * $scalefact}]

# ----------------------------------------------------------------------------

	for {set i7 1} {$i7 <= 8} {incr i7} {
		for {set i8 1} {$i8 <= 8} {incr i8} {
        	set k2 [expr ((($i7-1) * 8) + ($i8))]
        	set k3 [arconv2 $k2 1 4]
        	set board($k3) [expr $xs + ($gr1 * ($i8 - 1))]
        	set k4 [arconv2 $k2 2 4]
        	set board($k4) [expr $ys + ($gr1 * ($i7 - 1))]
        	set k5 [arconv2 $k2 4 4]
        	set board($k5) 99
        	set k6 [arconv2 $k2 3 4]
        	set board($k6) $colr
        	if "$colr == 0" {
                	set colr 1
	        } else {
                	set colr 0
            	}
    	}
    	if "$colr == 0" {
        	set colr 1
    	} else {
        	set colr 0
    	}        

	}

}



proc {dragend} {w x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	global draglocation


	catch {unset draglocation}
	set draglocation(obj) [$w find closest $x $y]
	set draglocation(x) $x
	set draglocation(y) $y
	fesq $w $x $y

	level2
}

proc {dragit} {w x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq
	global draglocation
	if {"$draglocation(obj)" != ""} {
		set dx [expr $x - $draglocation(x)]
		set dy [expr $y - $draglocation(y)]
		$w move $draglocation(obj) $dx $dy
		set draglocation(x) $x
		set draglocation(y) $y
	}
}

proc {dragstart} {w x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	global draglocation
	catch {unset draglocation}
	set draglocation(obj) [$w find closest $x $y]
	set draglocation(x) $x
	set draglocation(y) $y
	fssq $w $x $y
}

proc {dragtest} {} {
	global proginfo drgtst boardh widget
	# I do not think this is used now - see putpcs

	#canvas .cdrew -bg bisque -width 400 -height 400
	#.drgtst.drgtstc create text 50 50 -text Hello -font *-times-bold-r-*-18-*  -tags {movable color=red} -fill red
	#.drgtst.drgtstc create text 100 100 -text World -font *-times-medium-i-*-18-*  -tags {movable color=blue} -fill blue
	#.drgtst.drgtstc bind movable <Button-1> {dragstart %W %x %y}
	#.drgtst.drgtstc bind movable <B1-Motion> {dragit %W %x %y}
	#pack .drgtst.drgtstc

	#$widget(boardh) create text 50 50 -text Hello -font *-times-bold-r-*-18-*  -tags {movable color=red} -fill red
	#$widget(boardh) create text 100 100 -text World -font *-times-medium-i-*-18-*  -tags {movable color=blue} -fill blue
	$widget(boardh) bind movable <Button-1> {dragstart %W %x %y}
	$widget(boardh) bind movable <B1-Motion> {dragit %W %x %y}
	$widget(boardh) bind movable <ButtonRelease-1> {dragend %W %x %y}
}

proc {drawbd} {} {
	global widget boardh z xs ys gcx gcy whitescore blackscore board piece piecestr
	#set colr blue
	global scalefact

	set sqsz [expr {35 * $scalefact}]
	set gr1 [expr {35 * $scalefact}]

	#set colr 0

	for {set i3 1} {$i3 <= 64} {incr i3} {
		set k3 [arconv2 $i3 3 4]
		# puts "Colour k3 is $k3" 
		# puts "Colour code is $board($k3)"
		set colr $board($k3)
		if "$colr == 0" {
			set colrc red
		} else {
			set colrc blue
		}
	set k3 [arconv2 $i3 1 4]
	set bix $board($k3)
	# puts "bix k3 is $k3"
	# puts "bix coord is $board($k3)"
	set k3 [arconv2 $i3 2 4]
	set biy $board($k3)
	# puts "biy k3 is $k3"
	# puts "biy coord is $board($k3)"
	set bex [expr $bix + $gr1]
	# puts "bex coord is $bex"
	set bey [expr $biy + $gr1]
	# puts "bey coord is $bey"
	$widget(boardh) create rectangle $bix $biy $bex $bey -fill $colrc
    
	}

}

proc {fesq} {w x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	#fesq $w $x $y
	#
	set xs [expr {10 * $scalefact}]
	set ys [expr {10 * $scalefact}]
	#set gcx $xs
	#set gcy $ys

	set colr 0
	set gr1 [expr {35 * $scalefact}]

# ----------------------------------------------------------------------------
	for {set i7 1} {$i7 <= 8} {incr i7} {
		for {set i8 1} {$i8 <= 8} {incr i8} {
			set k2 [expr ((($i7-1) * 8) + ($i8))]
			set k4 [arconv2 $k2 1 4]
			set bx [expr $xs + ($gr1 * ($i8 - 1))]
			set k4 [arconv2 $k2 2 4]
			set by [expr $ys + ($gr1 * ($i7 - 1))]
			if "(($x >= $bx) && ($x <= ($bx + $gr1))) && (($y >= $by) && ($y <= ($by + $gr1)))" {
				puts "The end square is $k2"
				set ensq $k2
			}
        
		}
	}
}

proc {fssq} {w x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr

	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	set xs [expr {10 * $scalefact}]
	set ys [expr {10 * $scalefact}]

	#set gcx $xs
	#set gcy $ys

	set colr 0
	set gr1 [expr {35 * $scalefact}]

	for {set i7 1} {$i7 <= 8} {incr i7} {
		for {set i8 1} {$i8 <= 8} {incr i8} {
			set k2 [expr ((($i7-1) * 8) + ($i8))]
			set k4 [arconv2 $k2 1 4]
			set bx [expr $xs + ($gr1 * ($i8 - 1))]
			set k4 [arconv2 $k2 2 4]
			set by [expr $ys + ($gr1 * ($i7 - 1))]
			if "(($x >= $bx) && ($x <= ($bx + $gr1))) && (($y >= $by) && ($y <= ($by + $gr1)))" {
				puts "The start square is $k2"
				set stsq $k2
			}
        
		}
    
	}
}

proc {initgm} {} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile piecestr piece
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore

	set kinga 99999
	set kingd 95
	set kingv 500
	set kingr 1

	set queena 80
	set queend 45
	set queenv 9
	set queenr .15

	set rooka 60
	set rookd 25
	set rookv 5
	set rookr .1

	set bishopa 50
	set bishopd 15
	set bishopv 3
	set bishopr .1

	set knighta 50
	set knightd 15
	set knightv 3
	set knightr .1

	set pawna 45
	set pawnd 7
	set pawnv 1
	set pawnr .15

	#set piecestr {King Queen Bishop Knight Rook Pawn}
	set piecestr(1) king
	set piecestr(2) queen
	set piecestr(3) bishop
	set piecestr(4) knight
	set piecestr(5) rook
	set piecestr(6) pawn
	#set piecestr(7) pawn    ;# just for a test
	#set piecestr(8) pawn    ;# just for a test

	set whitescore 0
	set blackscore 0

	#zbspl
}

proc {level2} {} {
	# what does this do drew?
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr
	global scalefact
	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq i id bds bdd stsq ensq attack defend
	puts "Level 2"
	puts "Starting from $stsq ending on $ensq"
	set bds [arconv2 $stsq 4 4]
	set bdd [arconv2 $ensq 4 4]
	set i $board($bds)        ;    # number for piece on start sq
	#set j1 $piece([arconv2 $i 8 10])  ;    # numeric code for piece on start sw  
	set id $board($bdd)       ;    # number for piece on end sq 99 means no piece on sq
	puts "i is $i - id is $id"
	set desto $id
	puts "Desto is $desto"
	movest                ;    # this should take piece off of start square
	if "$desto == 99" {
        	# nothing
        	moveen                ;    # this should put the piece on the end square
	} else {
        	set j1 $piece([arconv2 $i 8 10])  ;    # numeric code for piece on start sw
        	set j2 $piece([arconv2 $id 8 10]) ;    # numeric code for piece on end sq
        	set attack $piecestr($j1)
        	set defend $piecestr($j2)
        	puts "attack is $attack - defend is $defend"
        	battle        ;    # if the destination sq is occupied, fight the battle

	}           

	# processing for each round
	for {set j 1} {$j <= 32} {incr j} {
	    set pj1 $piece([arconv2 $j 1 10])
	    set pj9 $piece([arconv2 $j 9 10])
	    set pj3 $piece([arconv2 $j 3 10])
	    set pj2 $piece([arconv2 $j 2 10])
	    set pj10 $piece([arconv2 $j 10 10])
	    if "$pj1 < $pj9" {
        	set $piece([arconv2 $j 1 10]) [expr $pj1 + ($pj9 * $pj3)]
    	    }
    	    if "$pj1 > $pj9" {
        	set $piece([arconv2 $j 1 10]) $pj9
            }
    	    if "$pj2 < $pj10" {
        	set $piece([arconv2 $j 2 10]) [expr $pj2 + ($pj10 * $pj3)]
            }
    	    if "$pj2 > $pj10" {
        	set $piece([arconv2 $j 2 10]) $pj10
            }
        }

}

proc {loadg} {} {
	# load game
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile
	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global piece board

	# file is afile
	set gfile [open $afile r]
	seek $gfile 0 start

	set whitescore [gets $gfile]
	set blackscore [gets $gfile]
	set kinga [gets $gfile]
	set kingd [gets $gfile]
	set kingv [gets $gfile]
	set kingr [gets $gfile]
	set queena [gets $gfile]
	set queend [gets $gfile]
	set queenv [gets $gfile]
	set queenr [gets $gfile]
	set rooka [gets $gfile]
	set rookd [gets $gfile]
	set rookv [gets $gfile]
	set rookr [gets $gfile]   
	set bishopa [gets $gfile]
	set bishopd [gets $gfile]
	set bishopv [gets $gfile]
	set bishopr [gets $gfile]
	set knighta [gets $gfile]
	set knightd [gets $gfile]
	set knightv [gets $gfile]
	set knightr [gets $gfile]
	set pawna [gets $gfile]
	set pawnd [gets $gfile]
	set pawnv [gets $gfile]
	set pawnr [gets $gfile]

	for {set i2 1} {$i2 <= 32} {incr i2} {
		for {set j2 1} {$j2 <= 10} {incr j2} {
        		set k2 [arconv2 $i2 $j2 10]
        		set piece($k2) [gets $gfile]
        	}
	}

	for {set i3 1} {$i3 <= 64} {incr i3} {
		for {set j3 1} {$j3 <= 4} {incr j3} {
        		set k3 [arconv2 $i3 $j3 4]
        		set board($k3) [gets $gfile]
		}
	}

	close $gfile
	drawbd
	putpcs
}

proc {menuHelp} {topic {titleWord {}}} {
	global help helpWindowList table
	global help rcsid table

	set w ".${topic}"
	#
	# destroy any existing window
	# NEEDSWORK: should just bring it forward.
	#
	catch {unmenuHelp $w}
	#
	# create a new window	
	#
	toplevel $w
	# default title
	if { $titleWord == "" } { set titleWord	$topic }
	wmConfig $w "Chess War--$titleWord"
	#set padValue $table(padValue)
	set padValue 20
	button $w.ok -text OK -padx [expr 2*$padValue] -command "unmenuHelp $w"
	# NEEDSWORK: font selection should be configurable.
	#
	# If you use this code elsewhere, please follow two conscious
	# style choices.  First, wide things are hard to read
	# (50 chars is about the most reasonable---consider newspaper
	# columns).  Second, we allow the user to resize the window.
	# (The user should always have control, even to do stupid things.)
	#
	text $w.t  -relief raised -bd 2 -yscrollcommand "$w.s set"  -setgrid true -wrap word  -width 50 -padx $padValue -pady $padValue  -font -*-Times-Medium-R-*-140-*
	set defFg [lindex [$w.t configure -foreground] 4]
	set defBg [lindex [$w.t configure -background] 4]
	$w.t tag configure italic -font -*-Times-Medium-I-Normal-*-140-*
	$w.t tag configure computer -font -*-Courier-Medium-R-Normal-*-120-*
	$w.t tag configure big -font -*-Times-Bold-R-Normal-*-180-*
	$w.t tag configure reverse -foreground $defBg -background $defFg

	scrollbar $w.s -relief flat -command "$w.t yview"
	pack append $w $w.ok {bottom} $w.s {right filly} $w.t {expand fill}

	$w.t mark set insert 0.0
	bind $w <Any-Enter> "focus $w.t"

	#
	# Scan the text for tags.
	#
	set t $help($topic)
	while { [regexp -indices {<([^@>]*)>} $t match inds] == 1 } {
		set start [lindex $inds 0]
		set end [lindex $inds 1]

		set keyword [string range $t $start $end]
		# puts stderr "tag $keyword found at $inds"

		# insert the left hand text into the thing
		set oldend [$w.t index end]
		$w.t insert end [string range $t 0 [expr $start-2]]
#		purgeAllTags $w.t $oldend insert

		# check for begin/end tag
		if { [string range $keyword 0 0] == "/" } {
			# end region
			set keyword [string trimleft $keyword "/"]
			if { [info exists tags($keyword)] == 0 } {
				error "end tag $keyword without beginning"
			}
			$w.t tag add $keyword $tags($keyword) insert
			# puts stdout "tag $keyword added from $tags($keyword) to [$w.t index insert]"
			unset tags($keyword)
		} else {
			if { [info exists tags($keyword)] == 1 } {
				error "nesting of begin tag $keyword"
			}
			set tags($keyword) [$w.t index insert]
			# puts stdout "tag $keyword begins at [$w.t index insert]"
		}

		# continue with the rest
		set t [string range $t [expr $end+2] end]
	}
	set oldend [$w.t index end]
	$w.t insert end $t
#	purgeAllTags $w.t $oldend insert
	#
	# Disable the text so the user can't mess with it.
	#
	$w.t configure -state disabled
}

proc {mkHelp} {} {
	global help rcsid table
	set help(genhelp) { <big>General Help</big>

	This is the general help section.

}
	
	set help(playcw) { <big>Playing Chess War</big>

	This is how to play Chess War.
}
	set help(strategy) { <big>Strategies for Chess War</big>

	These are the strategies.

}
        set help(proginfo) { <big>Program Info</big>
        
	A zotzBrothers Program.

	Chess War
	Copyright 1990, 1999, 2019

	by drew Roberts
	zotzbro@gmail.com

	This program is a product of the zotzBrothers and was developed for your enjoyment. The original program was written under MSDOS and was released as shareware. This version is written in Tcl/Tk on Linux. Thanks RMS. This version is released under the GPL.

}

        set help(aboutcw) { <big>About Chess War</big>
        
	About Chess War goes here.

}

        set help(zotzbrothers) { <big>zotzBrothers</big>
        
	Peter Raducha.
        	Erick Reyna.
                	drew Roberts.
                
                
	Three guys who brought a certain amount of KAOS to FIT in the early 80s. Will the Marine Field Project ever be the same? What happened to Frank, the Norwegian Narwhal? Where is Captain Morris? Tuxedos and Suits everywhere.


	Z O T Z   F O R E V E R   -   the raggeded ~;-)

	KUDOS to Ed Kalajian!
	Anyone seen the Monumental Whit?

	ZOTZ ZOTZ ZOTZ ZOTZ Where the FIZZ is.
        

}

        set help(drew) { <big>drew</big>
        
	info about drew...


	More later. For now, please check out some of my web sites.



	Also, check out www.bahamianornuttin.com a radio station that I work for here in Nassau.        

}

        set help(catalogue) { <big>Catalogue</big>
        
	Here are some interesting zotzBrothers items and sites:



	pstory        Party Story    -    Let the group write a funny story!
	p1zotz03      Story Writer   -    Let the computer write a funny story!

}
}

proc {moveen} {} {
	# Move ends here?
	global i id bds bdd stsq ensq board piece xs ys mxd myd gr1 

	#puts "moveen"

	set piece([arconv2 $i 4 10]) $board([arconv2 $ensq 1 4])
	set piece([arconv2 $i 5 10]) $board([arconv2 $ensq 2 4])

	set board($bdd) $i
	#puts "board(bdd) is $board($bdd), i is $i, bdd is $bdd"

	# piece(i,4) = piece(id,4)
	#set k1 [arconv2 $i 4 10]
	set k3 [arconv2 $id 4 10]
	#set k3was $piece($k3)
	set piece($k3) -99
	# piece(i,5) = piece(id,5)
	#set k2 [arconv2 $i 5 10]
	set k4 [arconv2 $id 5 10]
	#set k4was $piece($k4)
	set piece($k4) -99
	#puts "piece(k3) was $k3was piece(k4) was $k4was"
	#puts "k3 is $k3 piece(k3) is $piece($k3) k4 is $k4 piece(k4) is $piece($k4)"


	drawbd
	putpcs
	set stsq 0
	set ensq 0

	#        set k1 [arconv2 $i2 4 10]
	#        if "$piece($k1) == -99"
	#---------------------
	#puts "Level 2"
	#puts "Starting from $stsq ending on $ensq"

	#set bds [arconv2 $stsq 4 4]
	#set bdd [arconv2 $ensq 4 4]

	#set i $board($bds)
	#set id $board($bdd)
	#
}

proc {movest} {} {
	# Move starts here?
	global i id bds bdd stsq ensq board piece xs ys mxd myd gr1 
	#puts "movest"
	# This proc uses the global vars i id bds bdd stsq ensq

	if "$id == 99" {
	        # piece(i,4) = -99
	        set k1 [arconv2 $i 4 10]
	        set piece($k1) -99            ;    # set beginning pieces x pos if dest is empty ?? where does it get put to end?
	        # piece(i,5) = -99
	        set k2 [arconv2 $i 5 10]
	        set piece($k2) -99            ;    # set beginning pieces y pos if dest is empty
	} else {
	        # piece(i,4) = piece(id,4)
	        set k1 [arconv2 $i 4 10]
	        set k3 [arconv2 $id 4 10]
	        set piece($k1) $piece($k3)
	        # piece(i,5) = piece(id,5)
	        set k2 [arconv2 $i 5 10]
	        set k4 [arconv2 $id 5 10]
	        set piece($k2) $piece($k4)
	}



	# board(bds,4) = 99
	#set k11 [arconv2 $bds 4 4]
	#set board($k11) 99
	set board($bds) 99        ;    # Try and make the start square empty
	#puts "board(bds) is $board($bds), bdd is $bdd"

	#set bds [arconv2 $stsq 4 4]
	#set bdd [arconv2 $ensq 4 4]

	#set i $board($bds)    ;    # numeric code for piece on start sq
	#set id $board($bdd)   ;    # numeric code for piece on end sq 99 means no piece on sq
}


proc {pinit} {} {
	# initialize all pieces
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile piece piecestr
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore

	# white king
   
	set piece(1) $kinga                    ;#    king attack strength
	set piece(2) $kingd                    ;#    king defend strength
	set piece(3) $kingr                    ;#    king recouperate
	set piece(4) [expr $xs + (4 * $gr1)]   ;#    white king initial x
	set piece(5) [expr $ys + (7 * $gr1)]   ;#    white king initial y
	set piece(6) 0                         ;#    piece colour = white
	set piece(7) $kingv                    ;#    king value
	set piece(8) 1                         ;#    piece type = king
	set piece(9) $kinga                    ;#    start attack strength, used as limit for recovery
	set piece(10) $kingd                   ;#    start defend strength, used as limit for recovery

	# black king
   
	set piece(11) $kinga                    ;#    king attack strength
	set piece(12) $kingd                    ;#    king defend strength
	set piece(13) $kingr                    ;#    king recouperate
	set piece(14) [expr $xs + (4 * $gr1)]   ;#    black king initial x
	set piece(15) $ys                       ;#    black king initial y
	set piece(16) 1                         ;#    piece colour = black
	set piece(17) $kingv                    ;#    king value
	set piece(18) 1                         ;#    piece type = king
	set piece(19) $kinga                    ;#    start attack strength, used as limit for recovery
	set piece(20) $kingd                    ;#    start defend strength, used as limit for recovery   

	# white queen
   
	set piece(21) $queena                    ;#    queen attack strength
	set piece(22) $queend                    ;#    queen defend strength
	set piece(23) $queenr                    ;#    queen recouperate
	set piece(24) [expr $xs + (3 * $gr1)]    ;#    white queen initial x
	set piece(25) [expr $ys + (7 * $gr1)]    ;#    white queen initial y
	set piece(26) 0                          ;#    piece colour = white
	set piece(27) $queenv                    ;#    queen value
	set piece(28) 2                          ;#    piece type = queen
	set piece(29) $queena                    ;#    start attack strength, used as limit for recovery
	set piece(30) $queend                    ;#    start defend strength, used as limit for recovery

    

   # black queen

   set piece(31) $queena                    ;#    queen attack strength
   set piece(32) $queend                    ;#    queen defend strength
   set piece(33) $queenr                    ;#    queen recouperate
   set piece(34) [expr $xs + (3 * $gr1)]    ;#    black queen initial x
   set piece(35) $ys                        ;#    black queen initial y
   set piece(36) 1                          ;#    piece colour = black
   set piece(37) $queenv                    ;#    queen value
   set piece(38) 2                          ;#    piece type = queen
   set piece(39) $queena                    ;#    start attack strength, used as limit for recovery
   set piece(40) $queend                    ;#    start defend strength, used as limit for recovery


   
   # white bishop1

   set piece(41) $bishopa                    ;#    bishop attack strength
   set piece(42) $bishopd                    ;#    bishop defend strength
   set piece(43) $bishopr                    ;#    bishop recouperate
   set piece(44) [expr $xs + (2 * $gr1)]     ;#    white bishop 1 initial x
   set piece(45) [expr $ys + (7 * $gr1)]     ;#    white bishop 1 initial y
   set piece(46) 0                           ;#    piece colour = white
   set piece(47) $bishopv                    ;#    bishop value
   set piece(48) 3                           ;#    piece type = bishop
   set piece(49) $bishopa                    ;#    start attack strength, used as limit for recovery
   set piece(50) $bishopd                    ;#    start defend strength, used as limit for recovery

   # white bishop2
   
   set piece(51) $bishopa                    ;#    bishop attack strength
   set piece(52) $bishopd                    ;#    bishop defend strength
   set piece(53) $bishopr                    ;#    bishop recouperate
   set piece(54) [expr $xs + (5 * $gr1)]     ;#    white bishop 2 initial x
   set piece(55) [expr $ys + (7 * $gr1)]     ;#    white bishop 2 initial y
   set piece(56) 0                           ;#    piece colour = white
   set piece(57) $bishopv                    ;#    bishop value
   set piece(58) 3                           ;#    piece type = bishop
   set piece(59) $bishopa                    ;#    start attack strength, used as limit for recovery
   set piece(60) $bishopd                    ;#    start defend strength, used as limit for recovery

   # black bishop1
   
   set piece(61) $bishopa                    ;#    bishop attack strength
   set piece(62) $bishopd                    ;#    bishop defend strength
   set piece(63) $bishopr                    ;#    bishop recouperate
   set piece(64) [expr $xs + (2 * $gr1)]     ;#    black bishop 1 initial x
   set piece(65) $ys                         ;#    black bishop 1 initial y
   set piece(66) 1                           ;#    piece colour = black
   set piece(67) $bishopv                    ;#    bishop value
   set piece(68) 3                           ;#    piece type = bishop
   set piece(69) $bishopa                    ;#    start attack strength, used as limit for recovery
   set piece(70) $bishopd                    ;#    start defend strength, used as limit for recovery


   # black bishop2
   
   set piece(71) $bishopa                    ;#    bishop attack strength
   set piece(72) $bishopd                    ;#    bishop defend strength
   set piece(73) $bishopr                    ;#    bishop recouperate
   set piece(74) [expr $xs + (5 * $gr1)]     ;#    black bishop 2 initial x
   set piece(75) $ys                         ;#    black bishop 2 initial y
   set piece(76) 1                           ;#    piece colour = black
   set piece(77) $bishopv                    ;#    bishop value
   set piece(78) 3                           ;#    piece type = bishop
   set piece(79) $bishopa                    ;#    start attack strength, used as limit for recovery
   set piece(80) $bishopd                    ;#    start defend strength, used as limit for recovery


   # white knight1
   
   set piece(81) $knighta                    ;#    knight attack strength
   set piece(82) $knightd                    ;#    knight defend strength
   set piece(83) $knightr                    ;#    knight recouperate
   set piece(84) [expr $xs + (1 * $gr1)]     ;#    white knight 1 initial x
   set piece(85) [expr $ys + (7 * $gr1)]     ;#    white knight 1 initial y
   set piece(86) 0                           ;#    piece colour = white
   set piece(87) $knightv                    ;#    knight value
   set piece(88) 4                           ;#    piece type = knight
   set piece(89) $knighta                    ;#    start attack strength, used as limit for recovery
   set piece(90) $knightd                    ;#    start defend strength, used as limit for recovery


   # white knight2

   set piece(91) $knighta                    ;#    knight attack strength
   set piece(92) $knightd                    ;#    knight defend strength
   set piece(93) $knightr                    ;#    knight recouperate
   set piece(94) [expr $xs + (6 * $gr1)]     ;#    white knight 2 initial x
   set piece(95) [expr $ys + (7 * $gr1)]     ;#    white knight 2 initial y
   set piece(96) 0                           ;#    piece colour = white
   set piece(97) $knightv                    ;#    knight value
   set piece(98) 4                           ;#    piece type = knight
   set piece(99) $knighta                    ;#    start attack strength, used as limit for recovery
   set piece(100) $knightd                   ;#    start defend strength, used as limit for recovery


   # black knight1
   
   set piece(101) $knighta                    ;#    knight attack strength
   set piece(102) $knightd                    ;#    knight defend strength
   set piece(103) $knightr                    ;#    knight recouperate
   set piece(104) [expr $xs + (1 * $gr1)]     ;#    black knight 1 initial x
   set piece(105) $ys                         ;#    black knight 1 initial y
   set piece(106) 1                           ;#    piece colour = black
   set piece(107) $knightv                    ;#    knight value
   set piece(108) 4                           ;#    piece type = knight
   set piece(109) $knighta                    ;#    start attack strength, used as limit for recovery
   set piece(110) $knightd                    ;#    start defend strength, used as limit for recovery

   # black knight2
   
   set piece(111) $knighta                    ;#    knight attack strength
   set piece(112) $knightd                    ;#    knight defend strength
   set piece(113) $knightr                    ;#    knight recouperate
   set piece(114) [expr $xs + (6 * $gr1)]     ;#    black knight 2 initial x
   set piece(115) $ys                         ;#    black knight 2 initial y
   set piece(116) 1                           ;#    piece colour = black
   set piece(117) $knightv                    ;#    knight value
   set piece(118) 4                           ;#    piece type = knight
   set piece(119) $knighta                    ;#    start attack strength, used as limit for recovery
   set piece(120) $knightd                    ;#    start defend strength, used as limit for recovery

   # white rook1
   
   set piece(121) $rooka                      ;#    rook attack strength
   set piece(122) $rookd                      ;#    rook defend strength
   set piece(123) $rookr                      ;#    rook recouperate
   set piece(124) $xs                         ;#    white rook 1 initial x
   set piece(125) [expr $ys + (7 * $gr1)]     ;#    white rook 1 initial y
   set piece(126) 0                           ;#    piece colour = white
   set piece(127) $rookv                      ;#    knightrook value
   set piece(128) 5                           ;#    piece type = rook
   set piece(129) $rooka                      ;#    start attack strength, used as limit for recovery
   set piece(130) $rookd                      ;#    start defend strength, used as limit for recovery


   # white rook2
   
   set piece(131) $rooka                      ;#    rook attack strength
   set piece(132) $rookd                      ;#    rook defend strength
   set piece(133) $rookr                      ;#    rook recouperate
   set piece(134) [expr $xs + (7 * $gr1)]     ;#    white rook 2 initial x
   set piece(135) [expr $ys + (7 * $gr1)]     ;#    white rook 2 initial y
   set piece(136) 0                           ;#    piece colour = white
   set piece(137) $rookv                      ;#    knightrook value
   set piece(138) 5                           ;#    piece type = rook
   set piece(139) $rooka                      ;#    start attack strength, used as limit for recovery
   set piece(140) $rookd                      ;#    start defend strength, used as limit for recovery

   # black rook1
   
   set piece(141) $rooka                      ;#    rook attack strength
   set piece(142) $rookd                      ;#    rook defend strength
   set piece(143) $rookr                      ;#    rook recouperate
   set piece(144) $xs                         ;#    black rook 1 initial x
   set piece(145) $ys                         ;#    black rook 1 initial y
   set piece(146) 1                           ;#    piece colour = white
   set piece(147) $rookv                      ;#    rook value
   set piece(148) 5                           ;#    piece type = rook
   set piece(149) $rooka                      ;#    start attack strength, used as limit for recovery
   set piece(150) $rookd                      ;#    start defend strength, used as limit for recovery


   # black rook2
   
   set piece(151) $rooka                      ;#    rook attack strength
   set piece(152) $rookd                      ;#    rook defend strength
   set piece(153) $rookr                      ;#    rook recouperate
   set piece(154) [expr $xs + (7 * $gr1)]     ;#    black rook 2 initial x
   set piece(155) $ys                         ;#    black rook 2 initial y
   set piece(156) 1                           ;#    piece colour = white
   set piece(157) $rookv                      ;#    rook value
   set piece(158) 5                           ;#    piece type = rook
   set piece(159) $rooka                      ;#    start attack strength, used as limit for recovery
   set piece(160) $rookd                      ;#    start defend strength, used as limit for recovery


   # white pawns
   
   for {set i 0} {$i <= 7} {incr i} {
       set piece([expr ((16+$i) * 10) + 1]) $pawna
       set piece([expr ((16+$i) * 10) + 2]) $pawnd
       set piece([expr ((16+$i) * 10) + 3]) $pawnr
       set piece([expr ((16+$i) * 10) + 4]) [expr $xs + ($i * $gr1)]
       set piece([expr ((16+$i) * 10) + 5]) [expr $ys + (6 * $gr1)]
       set piece([expr ((16+$i) * 10) + 6]) 0
       set piece([expr ((16+$i) * 10) + 7]) $pawnv
       set piece([expr ((16+$i) * 10) + 8]) 6
       set piece([expr ((16+$i) * 10) + 9]) $pawna
       set piece([expr ((16+$i) * 10) + 10]) $pawnd
    }
   


   # black pawns
   
   for {set i 0} {$i <= 7} {incr i} {
       set piece([expr ((24+$i) * 10) + 1]) $pawna
       set piece([expr ((24+$i) * 10) + 2]) $pawnd
       set piece([expr ((24+$i) * 10) + 3]) $pawnr
       set piece([expr ((24+$i) * 10) + 4]) [expr $xs + ($i * $gr1)]
       set piece([expr ((24+$i) * 10) + 5]) [expr $ys + (1 * $gr1)]
       set piece([expr ((24+$i) * 10) + 6]) 1
       set piece([expr ((24+$i) * 10) + 7]) $pawnv
       set piece([expr ((24+$i) * 10) + 8]) 6
       set piece([expr ((24+$i) * 10) + 9]) $pawna
       set piece([expr ((24+$i) * 10) + 10]) $pawnd
    }   
   
#
}

proc {playgm} {} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	set stsq 0
	set ensq 0
	set endplay 0


	#while "$endplay == 0" {
    
		drawbd
		putpcs

		set endplay 1


	#    }

}

proc {putpcs} {} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq
	global widget boardh

	for {set i2 1} {$i2 <= 32} {incr i2} {
    
        	set k1 [arconv2 $i2 4 10]
        	if "$piece($k1) == -99" {
			puts "skipped this piece $i2"
			# skip and do nothing
		} else {
			set k1 [arconv2 $i2 4 10]
			set ppx $piece($k1)           ;    # ppx is the pieces x position
			set k2 [arconv2 $i2 5 10]
			set ppy $piece($k2)           ;    # ppy is the pieces y position
			set k8 [arconv2 $i2 8 10]
			set k9 $piece($k8)            ;    # k9 is the type of piece as a number code
			set k3 [arconv2 $i2 6 10]
			set colr $piece($k3)          ;    # colr is the pieces colour as a number code
			if "$colr == 0" {
				set colrc green
			} else {
				set colrc black
			}
			$piecestr($k9) $ppx $ppy $colrc    ;    # This line draws the piece at locationm ppx,ppy with colour colrc
			# load board array with piece
			set k4 [setsq $ppx $ppy ]          ;    # Trying to find which square this piece is on
			# puts "Piece $i2 is on square $k4"
			set k11 [arconv2 $k4 4 4]
			# puts "k11 is $k11 - number code for piece type is $k9"
			set board($k11) $i2
			# puts "Array loaded with piece $i2 in position $k4 - $board($k11)"
		}        
	}
$widget(boardh) bind movable <Button-1> {dragstart %W %x %y}
$widget(boardh) bind movable <B1-Motion> {dragit %W %x %y}
$widget(boardh) bind movable <ButtonRelease-1> {dragend %W %x %y}

}

proc {randx} {} {
	global randz

	set randy [expr ((($randz * 25173) + 13849) % 65536)]
	set randz $randy
	return $randz
}

proc {rnd} {lim} {
	global randz
	set ans [randx]
	set ans [expr int(($randz / 65536.0) * $lim)]
	return $ans
}



proc {saveg} {} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global piece board


	puts "whitescore is $whitescore"
	puts "blackscore is $blackscore"

	# file is afile

	set gfile [open $afile w]

	seek $gfile 0 start

#	puts $gfile "whitescore"
	puts $gfile $whitescore
#	puts $gfile "blackscore"
	puts $gfile $blackscore
#	puts $gfile "kinga"
	puts $gfile $kinga
#	puts $gfile "kingd"
	puts $gfile $kingd
#	puts $gfile "kingv"
	puts $gfile $kingv
#	puts $gfile "kingr"
	puts $gfile $kingr
#	puts $gfile "queena"
	puts $gfile $queena
#	puts $gfile "queend"
	puts $gfile $queend
#	puts $gfile "queenv"
	puts $gfile $queenv
#	puts $gfile "queenr"
	puts $gfile $queenr
#	puts $gfile "rooka"
	puts $gfile $rooka
#	puts $gfile "rookd"
	puts $gfile $rookd
#	puts $gfile "rookv"
	puts $gfile $rookv
#	puts $gfile "rookr"
	puts $gfile $rookr
#	puts $gfile "bishopa"
	puts $gfile $bishopa
#	puts $gfile "bishopd"
	puts $gfile $bishopd
#	puts $gfile "bishopv"
	puts $gfile $bishopv
#	puts $gfile "bishopr"
	puts $gfile $bishopr
#	puts $gfile "knighta"
	puts $gfile $knighta
#	puts $gfile "knightd"
	puts $gfile $knightd
#	puts $gfile "knightv"
	puts $gfile $knightv
#	puts $gfile "knightr"
	puts $gfile $knightr
#	puts $gfile "pawna"
	puts $gfile $pawna
#	puts $gfile "pawnd"
	puts $gfile $pawnd
#	puts $gfile "pawnv"
	puts $gfile $pawnv
#	puts $gfile "pawnr"
	puts $gfile $pawnr

	#for {set i2 1} {$i2 <= 320} {incr i2} {
	#    puts $gfile $piece($i2)
	#    }
	# this writes out the current data for each piece
	for {set i2 1} {$i2 <= 32} {incr i2} {
		for {set j2 1} {$j2 <= 10} {incr j2} {
			set k2 [arconv2 $i2 $j2 10]
			# puts $gfile "i2: $i2, j2: $j2"
			puts $gfile $piece($k2)
		}
	}
	#for {set i3 1} {$i3 <= 384} {incr i3} {
	#    puts $gfile $board($i3)
	#    }
	# this writes out the current data for each square on the board
	for {set i3 1} {$i3 <= 64} {incr i3} {
		for {set j3 1} {$j3 <= 4} {incr j3} {
			set k3 [arconv2 $i3 $j3 4]
			# puts $gfile "i3: $i3, j3: $j3"
			puts $gfile $board($k3)
		}
	}

	close $gfile

}

proc {setsq} {x y} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile board piece piecestr
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore
	global attack defend stsq ensq

	set xs [expr {10 * $scalefact}]
	set ys [expr {10 * $scalefact}]

	#set gcx $xs
	#set gcy $ys

	set colr 0
	set gr1 [expr {35 * $scalefact}]


	for {set i7 1} {$i7 <= 8} {incr i7} {
		for {set i8 1} {$i8 <= 8} {incr i8} {
			set k2 [expr ((($i7-1) * 8) + ($i8))]
			set k4 [arconv2 $k2 1 4]
			set bx [expr $xs + ($gr1 * ($i8 - 1))]
			set k4 [arconv2 $k2 2 4]
			set by [expr $ys + ($gr1 * ($i7 - 1))]
			if "(($x >= $bx) && ($x <= ($bx + $gr1))) && (($y >= $by) && ($y <= ($by + $gr1)))" {
				# puts "The correct square is $k2"
				set kret $k2
			}
        
		}
    
	}
	return $kret
}

proc {unmenuHelp} {w} {
	global help rcsid table
	global stackList
	# puts "unmenuHelp called on $w"
	if { [set listPos [lsearch -exact $stackList $w]] != -1 } {
		set stackList [lreplace $stackList $listPos $listPos]
	}
	destroy $w
}

proc {wmConfig} {w title} {
	global stackList
	#
	# configure random wm stuff
	#
	if { [info exists stackList] == 0 } {
		# setup a list with something that should never get removed
		set stackList "."
	}
	#
	# first geometry
	#
	set geometry [wm geometry [lindex $stackList [expr [llength $stackList] - 1]]]
	set geoElems [split $geometry "x+"]
	set geoX [lindex $geoElems 2]
	set geoY [lindex $geoElems 3]
	set neoGeoX [expr $geoX + 50]
	set neoGeoY [expr $geoY + 50]
	wm geometry $w [format "+%d+%d" $neoGeoX $neoGeoY]
	lappend stackList $w
	#
	# cleanup
	#
	wm protocol $w WM_DELETE_WINDOW "unmenuHelp $w"
	#
	# group-hood
	#
	wm group $w .
	#
	# titles
	#
	wm title $w $title
	wm iconname $w $title
}

proc {zbspl} {} {
	# this is the splash screen which shows on program start.
	global widget boardh z xs ys gcx gcy whitescore blackscore sbsplashc
	global scalefact

	set colrc blue
	set sqsz [expr {35 * $scalefact}]
	set px 145
	set py 40
	set z 1

	Window show $widget(zbsplash)
 

	# first z
	$widget(zbsplashc) create polygon 90 10 155 115 105 105 130 190 65 85 115 95 90 10 -fill yellow 

	# second z
	$widget(zbsplashc) create polygon 310 10 375 115 325 105 350 190 285 85 335 95 310 10 -fill yellow

	# t
	$widget(zbsplashc) create polygon 220 110 275 115 275 125 230 120 230 190 210 190 210 120 165 125 165 115 220 110 -fill black

	# o
	$widget(zbsplashc) create arc 170 105 270 5 -extent 359 -fill black -start 270 -style chord
	$widget(zbsplashc) create arc 180 95 260 15 -extent 359 -fill blue -start 270 -style chord

	update idletasks
	after 5500 {catch {destroy $widget(zbsplash)}}

}

proc {main} {argc argv} {
	global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile piecestr randz
	global scalefact

	global kinga kingd kingv kingr
	global queena queend queenv queenr
	global rooka rookd rookv rookr
	global bishopa bishopd bishopv bishopr
	global knighta knightd knightv knightr
	global pawna pawnd pawnv pawnr
	global whitescore blackscore

	global help rcsid table

	#zbspl

	set whitescore 0
	set blackscore 0
	set z 1
	set gr1 1
	set afile temp.zcw

	#set piecestr {King Queen Bishop Knight Rook Pawn}
	set piecestr(1) king
	set piecestr(2) queen
	set piecestr(3) bishop
	set piecestr(4) knight
	set piecestr(5) rook
	set piecestr(6) pawn
	set piecestr(7) pawn    ;# just for a test
	set piecestr(8) pawn    ;# just for a test

	set randz 1001        ;    # find a better way to seed after testing


	initgm			;# initialize game?
	binit			;# initialize board?
	pinit			;# initialize all pieces
	drawbd			;# draw the board
	putpcs			;# why are we not putting the pieces on the board here?
	mkHelp

	zbspl
}

proc {Window} {args} {
global vTcl
    set cmd [lindex $args 0]
    set name [lindex $args 1]
    set newname [lindex $args 2]
    set rest [lrange $args 3 end]
    if {$name == "" || $cmd == ""} {return}
    if {$newname == ""} {
        set newname $name
    }
    set exists [winfo exists $newname]
    switch $cmd {
        show {
            if {$exists == "1" && $name != "."} {wm deiconify $name; return}
            if {[info procs vTclWindow(pre)$name] != ""} {
                eval "vTclWindow(pre)$name $newname $rest"
            }
            if {[info procs vTclWindow$name] != ""} {
                eval "vTclWindow$name $newname $rest"
            }
            if {[info procs vTclWindow(post)$name] != ""} {
                eval "vTclWindow(post)$name $newname $rest"
            }
        }
        hide    { if $exists {wm withdraw $newname; return} }
        iconify { if $exists {wm iconify $newname; return} }
        destroy { if $exists {destroy $newname; return} }
    }
}

#################################
# VTCL GENERATED GUI PROCEDURES
#

proc vTclWindow. {base} {
    if {$base == ""} {
        set base .
    }
    ###################
    # CREATING WIDGETS
    ###################
    wm focusmodel $base passive
    wm geometry $base 1x1+0+0
    wm maxsize $base 1265 994
    wm minsize $base 1 1
    wm overrideredirect $base 0
    wm resizable $base 1 1
    wm withdraw $base
    wm title $base "vt.tcl"
    ###################
    # SETTING GEOMETRY
    ###################
}

proc vTclWindow.top17 {base} {
    if {$base == ""} {
        set base .top17
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    ###################
    # CREATING WIDGETS
    ###################
    toplevel $base -class Toplevel \
        -menu .top17.m17 
    wm focusmodel $base passive
    wm geometry $base 1000x890+100+100
    wm maxsize $base 1265 994
    wm minsize $base 1 1
    wm overrideredirect $base 0
    wm resizable $base 1 1
    wm deiconify $base
    wm title $base "Chess War Level 2
"
    frame $base.cpd19 \
        -borderwidth 1 -height 30 -relief sunken -width 30 
    menubutton $base.cpd19.01 \
        -anchor w -menu .top17.cpd19.01.02 -padx 4 -pady 3 -text File \
        -width 4 
    menu $base.cpd19.01.02 \
        -cursor {} -tearoff 0 
    $base.cpd19.01.02 add command \
        \
        -command {global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore} \
        -label Create 
    $base.cpd19.01.02 add command \
        \
        -command {global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore


if "[info exists afile] == 1" {
    set ofile $afile
    } else {
    set ofile ""
    }



set types {
    {{Chess War Files}    {.zcw}    }
    {{All Files}          *         }
}

set afile [tk_getOpenFile -defaultextension .zcw -title "Open File" -filetypes $types]


if "[string length $afile] != 0" {
    loadg
    } else {
    set afile $ofile
    }} \
        -label Load 
    $base.cpd19.01.02 add command \
        -command exit -label Exit 
    $base.cpd19.01.02 add command \
        \
        -command {global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile piecestr

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore

global help rcsid table



set whitescore 0
set blackscore 0
set z 1
set gr1 1
set afile temp.zcw


initgm
binit
pinit
drawbd
putpcs
mkHelp} \
        -label New 
    $base.cpd19.01.02 add command \
        \
        -command {global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore
global piece board

set ofile $afile

set types {
    {{Chess War Files}    {.zcw}    }
    {{All Files}          *         }
}

set afile [tk_getSaveFile -defaultextension .zcw -title "Save File" -filetypes $types]


if "[string length $afile] != 0" {
    saveg
    } else {
    set afile $ofile
    }} \
        -label {Save As} 
    $base.cpd19.01.02 add command \
        \
        -command {global gscrn xs ys gr1 z gcx gcy i mxd myd ii jj csquare wp wb bp bb pe gf gb afile

global kinga kingd kingv kingr
global queena queend queenv queenr
global rooka rookd rookv rookr
global bishopa bishopd bishopv bishopr
global knighta knightd knightv knightr
global pawna pawnd pawnv pawnr
global whitescore blackscore
global piece board

saveg} \
        -label Save 
    menubutton $base.cpd19.03 \
        -anchor w -menu .top17.cpd19.03.04 -padx 4 -pady 3 -text Play \
        -width 4 
    menu $base.cpd19.03.04 \
        -cursor {} -tearoff 0 
    $base.cpd19.03.04 add command \
        -command playgm -label {Play Game} 
    $base.cpd19.03.04 add command \
        -command {#drawbd
putpcs} -label {Redraw Board} 
    menubutton $base.cpd19.05 \
        -anchor w -menu .top17.cpd19.05.06 -padx 4 -pady 3 -text Help \
        -width 4 
    menu $base.cpd19.05.06 \
        -cursor {} -tearoff 0 
    $base.cpd19.05.06 add command \
        -command {menuHelp genhelp} -label {General Help} -state active 
    $base.cpd19.05.06 add command \
        -command {menuHelp playcw} -label {Playing Chess War} 
    $base.cpd19.05.06 add command \
        -command {menuHelp strategy} -label Strategies 
    menubutton $base.cpd19.men21 \
        -anchor w -menu .top17.cpd19.men21.m -padx 4 -pady 3 -text Options \
        -width 6 
    menu $base.cpd19.men21.m \
        -cursor {} -tearoff 0 
    $base.cpd19.men21.m add command \
        -label {Set Colours} -state active 
    menubutton $base.cpd19.men22 \
        -anchor w -menu .top17.cpd19.men22.m -padx 4 -pady 3 -text Info 
    menu $base.cpd19.men22.m \
        -cursor {} -tearoff 0 
    $base.cpd19.men22.m add command \
        -command {menuHelp proginfo} -label {Program Info} 
    $base.cpd19.men22.m add command \
        -command {menuHelp aboutcw} -label {About Chess War} 
    $base.cpd19.men22.m add command \
        -command {menuHelp zotzbrothers} -label ZotzBrothers 
    $base.cpd19.men22.m add command \
        -command {menuHelp drew} -label drew 
    $base.cpd19.men22.m add command \
        -command {menuHelp catalogue} -label Catalog 
    frame $base.fra19 \
        -borderwidth 2 -height 675 -relief groove -width 925 
    canvas $base.fra19.can23 \
        -borderwidth 2 -height 645 -relief raised -width 885 
    frame $base.fra20 \
        -borderwidth 2 -height 75 -relief groove -width 125 
    text $base.fra20.tex55 \
        -height 75 -width 125
    menu $base.m17 \
        -cursor {} 
    ###################
    # SETTING GEOMETRY
    ###################
    place $base.cpd19 \
        -x 20 -y 10 -width 242 -height 26 -anchor nw 
    pack $base.cpd19.01 \
        -in .top17.cpd19 -anchor center -expand 0 -fill none -side left 
    pack $base.cpd19.03 \
        -in .top17.cpd19 -anchor center -expand 0 -fill none -side left 
    pack $base.cpd19.05 \
        -in .top17.cpd19 -anchor center -expand 0 -fill none -side right 
    pack $base.cpd19.men21 \
        -in .top17.cpd19 -anchor center -expand 0 -fill none -side left 
    pack $base.cpd19.men22 \
        -in .top17.cpd19 -anchor center -expand 0 -fill none -side left 
    place $base.fra19 \
        -x 25 -y 50 -width 895 -height 755 -anchor nw -bordermode ignore 
    pack $base.fra19.can23 \
        -in .top17.fra19 -anchor center -expand 0 -fill none -side top 
    place $base.fra20 \
        -x 625 -y 50 -width 335 -height 655 -anchor nw -bordermode ignore 
    pack $base.fra20.tex55 \
        -in $base.fra20
}

proc vTclWindow.top18 {base} {
    if {$base == ""} {
        set base .top18
    }
    if {[winfo exists $base]} {
        wm deiconify $base; return
    }
    ###################
    # CREATING WIDGETS
    ###################
    toplevel $base -class Toplevel  -menu .top18.m21 
    wm focusmodel $base passive
    wm attributes $base -topmost yes
    wm geometry $base 449x254+900+30
    wm maxsize $base 1265 994
    wm minsize $base 1 1
    wm overrideredirect $base 0
    wm resizable $base 1 1
    wm title $base "zotzBrothers Splash"
    canvas $base.can19  -background blue -borderwidth 2 -height 207 -relief ridge -width 296 
    button $base.can19.but20  -padx 9 -pady 3 -text button 
    menu $base.m21  -cursor {} 
    button $base.but22  -command {Window hide $widget(zbsplash)} -padx 9 -pady 3 -text OK 
    ###################
    # SETTING GEOMETRY
    ###################
    place $base.can19  -x 0 -y 0 -width 452 -height 203 -anchor nw -bordermode ignore 
    place $base.can19.but20  -x 160 -y 220 -anchor nw -bordermode ignore 
    place $base.but22  -x 195 -y 215 -anchor nw -bordermode ignore
}

#Window show .
Window show .top17
Window show .

main $argc $argv
