:- table foldx/5, foldy/5, all/2.

foldx(At, X, Y, NewX, NewY) :- NewY is Y, X =< At, NewX is X.
foldx(At, X, Y, NewX, NewY) :- NewY is Y, X > At, NewX is 2 * At - X.

foldy(At, X, Y, NewX, NewY) :- NewX is X, Y =< At, NewY is Y.
foldy(At, X, Y, NewX, NewY) :- NewX is X, Y > At, NewY is 2 * At - Y.

%% part 1
first() :-
    dot(X0, Y0),
    foldx(655, X0, Y0, X1, Y1),
    write(X1), write(' '), write(Y1), nl,
    fail.
first(_).

%% part 2
all(X12, Y12) :-
    dot(X0, Y0),
    foldx(655, X0, Y0, X1, Y1),
    foldy(447, X1, Y1, X2, Y2),
    foldx(327, X2, Y2, X3, Y3),
    foldy(223, X3, Y3, X4, Y4),
    foldx(163, X4, Y4, X5, Y5),
    foldy(111, X5, Y5, X6, Y6),
    foldx(81,  X6, Y6, X7, Y7),
    foldy(55,  X7, Y7, X8, Y8),
    foldx(40,  X8, Y8, X9, Y9),
    foldy(27,  X9, Y9, X10, Y10),
    foldy(13,  X10, Y10, X11, Y11),
    foldy(6,   X11, Y11, X12, Y12).

print_all() :-
    all(X12, Y12),
    write(X12), write(' '), write(Y12), nl,
    fail.
all(_).


%% input data
dot(1213,736).
dot(1158,890).
dot(626,303).
dot(98,10).
dot(878,268).
dot(1208,143).
dot(112,400).
dot(865,894).
dot(1218,179).
dot(1089,418).
dot(535,886).
dot(726,515).
dot(1263,786).
dot(589,270).
dot(80,518).
dot(288,322).
dot(1101,483).
dot(989,308).
dot(1002,707).
dot(467,18).
dot(1036,364).
dot(552,591).
dot(445,280).
dot(912,40).
dot(1268,761).
dot(984,47).
dot(883,574).
dot(815,784).
dot(719,236).
dot(865,166).
dot(836,581).
dot(656,735).
dot(228,264).
dot(23,466).
dot(1099,515).
dot(1284,665).
dot(432,268).
dot(195,493).
dot(1001,308).
dot(430,222).
dot(1294,537).
dot(427,646).
dot(574,381).
dot(1116,829).
dot(1143,808).
dot(950,578).
dot(293,579).
dot(28,751).
dot(169,341).
dot(326,159).
dot(257,721).
dot(773,670).
dot(1231,556).
dot(306,436).
dot(454,520).
dot(1267,522).
dot(85,309).
dot(1273,358).
dot(1019,208).
dot(870,504).
dot(647,175).
dot(408,544).
dot(1310,386).
dot(912,854).
dot(512,10).
dot(674,770).
dot(273,742).
dot(626,584).
dot(112,10).
dot(736,420).
dot(1198,884).
dot(214,620).
dot(139,751).
dot(448,782).
dot(771,646).
dot(709,796).
dot(755,460).
dot(179,838).
dot(360,578).
dot(274,364).
dot(656,401).
dot(810,61).
dot(194,310).
dot(584,515).
dot(773,238).
dot(184,241).
dot(932,661).
dot(105,333).
dot(1096,838).
dot(959,838).
dot(252,341).
dot(1237,338).
dot(112,884).
dot(746,812).
dot(735,556).
dot(45,75).
dot(815,838).
dot(654,719).
dot(1225,309).
dot(1226,892).
dot(453,465).
dot(783,520).
dot(987,446).
dot(348,458).
dot(976,175).
dot(487,392).
dot(1307,558).
dot(1279,882).
dot(145,509).
dot(909,444).
dot(1310,389).
dot(626,527).
dot(356,527).
dot(363,774).
dot(142,130).
dot(246,581).
dot(1064,581).
dot(925,837).
dot(166,842).
dot(529,877).
dot(124,341).
dot(709,546).
dot(651,490).
dot(372,16).
dot(537,614).
dot(1004,213).
dot(1198,661).
dot(1240,40).
dot(701,504).
dot(1103,120).
dot(638,462).
dot(857,351).
dot(269,794).
dot(1099,122).
dot(624,360).
dot(1284,217).
dot(902,26).
dot(102,672).
dot(691,208).
dot(850,287).
dot(1083,698).
dot(636,770).
dot(475,539).
dot(1280,735).
dot(495,712).
dot(1273,655).
dot(217,854).
dot(1109,687).
dot(345,565).
dot(939,43).
dot(902,203).
dot(803,241).
dot(35,838).
dot(169,624).
dot(206,236).
dot(413,718).
dot(617,599).
dot(729,786).
dot(372,430).
dot(467,242).
dot(771,324).
dot(924,268).
dot(574,854).
dot(167,502).
dot(141,738).
dot(166,52).
dot(659,336).
dot(1240,123).
dot(672,462).
dot(902,581).
dot(883,320).
dot(37,655).
dot(209,0).
dot(897,875).
dot(823,630).
dot(1074,264).
dot(385,794).
dot(1131,838).
dot(1151,504).
dot(1294,357).
dot(1260,396).
dot(1228,768).
dot(209,57).
dot(1225,360).
dot(1111,710).
dot(333,586).
dot(996,371).
dot(954,140).
dot(790,367).
dot(843,348).
dot(1058,877).
dot(252,509).
dot(181,385).
dot(1218,267).
dot(1123,428).
dot(191,98).
dot(1039,372).
dot(214,504).
dot(274,260).
dot(359,751).
dot(1109,753).
dot(659,359).
dot(10,674).
dot(835,56).
dot(730,490).
dot(378,1).
dot(0,539).
dot(35,182).
dot(276,661).
dot(469,626).
dot(1061,533).
dot(783,432).
dot(656,847).
dot(281,707).
dot(187,428).
dot(1275,568).
dot(716,143).
dot(938,878).
dot(663,117).
dot(738,254).
dot(954,86).
dot(467,796).
dot(966,761).
dot(405,311).
dot(209,651).
dot(38,98).
dot(1233,824).
dot(430,837).
dot(1290,841).
dot(865,280).
dot(1123,18).
dot(985,170).
dot(182,859).
dot(1164,245).
dot(656,607).
dot(979,784).
dot(634,10).
dot(460,829).
dot(768,172).
dot(1126,317).
dot(1000,805).
dot(1198,830).
dot(629,536).
dot(208,542).
dot(1193,747).
dot(328,60).
dot(1123,751).
dot(1004,10).
dot(1056,571).
dot(254,571).
dot(1086,57).
dot(192,815).
dot(1287,204).
dot(1012,754).
dot(838,411).
dot(1225,361).
dot(380,310).
dot(616,117).
dot(621,243).
dot(1165,509).
dot(706,781).
dot(564,530).
dot(905,311).
dot(162,763).
dot(354,889).
dot(975,103).
dot(10,226).
dot(326,847).
dot(184,317).
dot(1261,143).
dot(1310,65).
dot(310,462).
dot(1208,672).
dot(402,17).
dot(85,361).
dot(129,847).
dot(1020,486).
dot(16,462).
dot(618,856).
dot(440,102).
dot(686,381).
dot(925,794).
dot(453,65).
dot(1287,639).
dot(180,656).
dot(507,91).
dot(460,65).
dot(893,271).
dot(344,581).
dot(609,208).
dot(246,432).
dot(781,246).
dot(185,268).
dot(311,696).
dot(736,488).
dot(346,707).
dot(875,708).
dot(38,565).
dot(420,267).
dot(433,18).
dot(1101,651).
dot(159,222).
dot(420,627).
dot(1245,446).
dot(905,361).
dot(954,527).
dot(909,450).
dot(495,392).
dot(755,434).
dot(179,429).
dot(1230,868).
dot(1129,621).
dot(932,681).
dot(211,122).
dot(344,313).
dot(52,530).
dot(602,288).
dot(947,326).
dot(433,113).
dot(634,557).
dot(529,17).
dot(647,117).
dot(1253,324).
dot(331,502).
dot(580,205).
dot(1111,184).
dot(359,143).
dot(52,36).
dot(32,409).
dot(1280,584).
dot(112,661).
dot(1143,392).
dot(1228,126).
dot(32,485).
dot(28,310).
dot(768,436).
dot(1000,761).
dot(281,502).
dot(753,214).
dot(443,646).
dot(1213,680).
dot(97,515).
dot(939,820).
dot(112,172).
dot(1068,674).
dot(371,43).
dot(1089,642).
dot(1064,82).
dot(1131,429).
dot(947,840).
dot(684,751).
dot(420,264).
dot(1082,660).
dot(965,553).
dot(52,82).
dot(795,751).
dot(351,98).
dot(1143,726).
dot(815,224).
dot(80,656).
dot(900,605).
dot(897,360).
dot(706,333).
dot(880,57).
dot(676,841).
dot(119,877).
dot(938,16).
dot(393,176).
dot(1001,586).
dot(507,388).
dot(31,194).
dot(405,182).
dot(35,470).
dot(185,716).
dot(1310,57).
dot(733,70).
dot(391,658).
dot(815,182).
dot(31,65).
dot(868,866).
dot(356,140).
dot(628,229).
dot(841,492).
dot(691,712).
dot(1195,696).
dot(634,287).
dot(523,65).
dot(345,138).
dot(310,49).
dot(663,623).
dot(474,581).
dot(520,639).
dot(224,57).
dot(1287,428).
dot(328,579).
dot(323,392).
dot(351,504).
dot(1287,255).
dot(815,360).
dot(194,136).
dot(207,269).
dot(542,436).
dot(432,178).
dot(110,634).
dot(878,716).
dot(201,829).
dot(897,718).
dot(52,726).
dot(328,159).
dot(1258,502).
dot(1307,87).
dot(1129,733).
dot(979,315).
dot(323,427).
dot(1002,187).
dot(351,639).
dot(938,430).
dot(527,520).
dot(870,176).
dot(1069,639).
dot(1307,467).
dot(36,856).
dot(23,31).
dot(413,534).
dot(402,341).
dot(687,65).
dot(619,120).
dot(634,884).
dot(1258,858).
dot(18,203).
dot(542,885).
dot(604,781).
dot(1282,758).
dot(5,553).
dot(1294,385).
dot(378,437).
dot(1096,56).
dot(835,838).
dot(23,876).
dot(1111,278).
dot(1011,33).
dot(308,707).
dot(117,798).
dot(331,763).
dot(470,241).
dot(830,732).
dot(1265,691).
dot(982,287).
dot(950,709).
dot(755,196).
dot(691,694).
dot(776,12).
dot(1290,765).
dot(619,40).
dot(738,640).
dot(1121,88).
dot(938,464).
dot(951,143).
dot(537,208).
dot(736,518).
dot(405,126).
dot(453,543).
dot(365,694).
dot(157,329).
dot(385,57).
dot(37,358).
dot(482,341).
dot(442,28).
dot(870,457).
dot(984,336).
dot(693,239).
dot(917,176).
dot(45,158).
dot(892,264).
dot(1258,812).
dot(1113,534).
dot(303,7).
dot(1004,661).
dot(569,869).
dot(281,158).
dot(378,681).
dot(569,534).
dot(16,509).
dot(435,708).
dot(373,840).
dot(1192,542).
dot(721,606).
dot(1041,794).
dot(1151,392).
dot(343,646).
dot(684,143).
dot(1064,740).
dot(552,751).
dot(1151,182).
dot(1143,616).
dot(698,313).
dot(1064,812).
dot(446,800).
dot(564,812).
dot(1191,717).
dot(452,105).
dot(85,360).
dot(947,504).
dot(380,82).
dot(937,483).
dot(319,551).
dot(922,815).
dot(1213,515).
dot(984,607).
dot(73,556).
dot(309,852).
dot(50,661).
dot(1181,847).
dot(1300,535).
dot(448,560).
dot(291,854).
dot(447,8).
dot(0,91).
dot(1191,625).
dot(932,233).
dot(371,689).
dot(361,131).
dot(865,798).
dot(1169,738).
dot(446,94).
dot(966,581).
dot(110,309).
dot(74,404).
dot(1000,49).
dot(1,842).
dot(798,354).
dot(20,884).
dot(1233,406).
dot(1230,243).
dot(492,267).
dot(867,248).
dot(346,187).
dot(1245,472).
dot(736,406).
dot(656,287).
dot(962,590).
dot(572,640).
dot(544,260).
dot(927,522).
dot(841,786).
dot(1029,392).
dot(169,278).
dot(378,445).
dot(420,630).
dot(488,52).
dot(626,751).
dot(927,372).
dot(691,854).
dot(803,355).
dot(3,87).
dot(1230,26).
dot(154,341).
dot(612,313).
dot(823,560).
dot(802,245).
dot(216,137).
dot(987,427).
dot(207,120).
dot(775,877).
dot(897,176).
dot(1266,654).
dot(541,191).
dot(159,110).
dot(1275,182).
dot(678,268).
dot(1153,565).
dot(1274,856).
dot(991,656).
dot(15,696).
dot(172,341).
dot(691,504).
dot(310,705).
dot(1275,470).
dot(574,243).
dot(448,637).
dot(1111,262).
dot(951,751).
dot(619,390).
dot(539,324).
dot(626,143).
dot(733,809).
dot(656,281).
dot(0,837).
dot(529,429).
dot(862,180).
dot(1279,194).
dot(947,568).
dot(227,574).
dot(378,400).
dot(418,364).
dot(556,182).
dot(969,481).
dot(500,61).
dot(947,774).
dot(761,333).
dot(1012,136).
dot(1258,530).
dot(574,518).
dot(666,311).
dot(326,558).
dot(512,130).
dot(870,718).
dot(689,682).
dot(1104,658).
dot(1101,614).
dot(187,876).
dot(1237,556).
dot(313,861).
dot(222,716).
dot(676,884).
dot(201,375).
dot(336,28).
dot(1058,509).
dot(469,492).
dot(1081,232).
dot(361,763).
dot(42,761).
dot(1183,462).
dot(1148,110).
dot(1273,239).
dot(905,712).
dot(863,438).
dot(905,518).
dot(736,474).
dot(1034,445).
dot(1088,716).
dot(1022,677).
dot(117,224).
dot(1265,686).
dot(1171,751).
dot(862,112).
dot(0,165).
dot(1123,546).
dot(1310,508).
dot(49,143).
dot(880,837).
dot(976,719).
dot(684,361).
dot(1233,70).
dot(28,478).
dot(82,126).
dot(1053,721).
dot(131,625).
dot(900,289).
dot(1193,278).
dot(373,65).
dot(1272,796).
dot(490,617).
dot(1016,633).
dot(413,176).
dot(82,96).
dot(1116,584).
dot(469,786).
dot(867,646).
dot(843,652).
dot(1118,815).
dot(775,886).
dot(624,829).
dot(166,500).
dot(555,574).
dot(385,837).
dot(455,278).
dot(487,840).
dot(65,446).
dot(1139,819).
dot(1211,460).
dot(1169,114).
dot(1101,894).
dot(624,381).
dot(227,250).
dot(119,269).
dot(1029,56).
dot(616,98).
dot(905,126).
dot(937,449).
dot(1096,504).
dot(1141,624).
dot(1099,772).
dot(201,687).
dot(1116,65).
dot(217,40).
dot(708,136).
dot(787,65).
dot(1273,648).
dot(1155,338).
dot(659,87).
dot(201,207).
dot(402,161).
dot(1091,708).
dot(440,722).
dot(447,269).
dot(1022,572).
dot(939,205).
dot(497,329).
dot(1058,553).
dot(542,661).
dot(863,886).
dot(155,338).
dot(622,857).
dot(92,715).
dot(612,133).
dot(962,458).
dot(634,159).
dot(28,30).
dot(288,677).
dot(1028,878).
dot(1183,520).
dot(169,176).
dot(23,428).
dot(1292,203).
dot(754,182).
dot(555,320).
dot(35,208).
dot(701,75).
dot(1022,322).
dot(684,533).
dot(320,623).
dot(857,95).
dot(18,770).
dot(214,50).
dot(7,777).
dot(398,406).
dot(261,176).
dot(783,462).
dot(709,98).
dot(1123,815).
dot(440,457).
dot(708,168).
dot(447,625).
dot(359,418).
dot(1278,485).
dot(1012,143).
dot(159,504).
dot(38,796).
dot(1230,332).
dot(418,530).
dot(877,255).
dot(654,505).
dot(28,136).
dot(912,406).
dot(1193,320).
dot(485,46).
dot(351,838).
dot(1265,75).
dot(758,143).
dot(1300,226).
dot(1282,527).
dot(612,761).
dot(575,556).
dot(979,763).
dot(77,70).
dot(654,607).
dot(688,261).
dot(766,585).
dot(145,385).
dot(363,504).
dot(676,287).
dot(788,607).
dot(857,465).
dot(1128,35).
dot(574,513).
dot(1200,309).
dot(10,668).
dot(169,553).
dot(654,57).
dot(1064,868).
dot(191,796).
dot(45,686).
dot(982,159).
dot(795,79).
dot(413,361).
dot(761,863).
dot(473,273).
dot(0,401).
dot(1017,579).
dot(840,808).
dot(99,434).
dot(79,556).
dot(162,784).
dot(459,418).
dot(798,10).
dot(195,418).
dot(651,404).
dot(520,527).
dot(959,887).
dot(965,565).
dot(288,217).
dot(730,404).
dot(1282,478).
dot(602,364).
dot(803,315).
dot(962,304).
dot(820,617).
dot(741,534).
dot(549,333).
dot(862,714).
dot(363,326).
dot(102,222).
dot(348,436).
dot(1156,553).
dot(1064,463).
dot(97,214).
dot(609,691).
dot(214,722).
dot(827,208).
dot(372,688).
dot(453,519).
dot(385,401).
dot(622,633).
dot(70,40).
dot(455,616).
dot(949,763).
dot(693,599).
dot(194,758).
dot(512,541).
dot(1169,786).
dot(617,536).
dot(1086,837).
dot(112,494).
dot(910,161).
dot(984,495).
dot(959,56).
dot(977,586).
dot(454,262).
dot(1141,341).
dot(609,203).
dot(748,19).
dot(1143,560).
dot(656,508).
dot(541,703).
dot(1181,495).
dot(1183,246).
dot(542,102).
dot(736,189).
dot(433,866).
dot(661,756).
dot(659,490).
dot(331,446).
dot(236,630).
dot(610,688).
dot(3,467).
dot(446,268).
dot(694,117).
dot(308,35).
dot(537,350).
dot(1101,243).
dot(951,418).
dot(127,432).
dot(979,110).
dot(802,705).
dot(741,86).
dot(787,829).
dot(1198,233).
dot(808,890).
dot(1279,12).
dot(50,396).
dot(1183,14).
dot(23,255).
dot(636,124).
dot(448,714).
dot(1236,205).
dot(1193,798).
dot(1103,625).
dot(945,694).
dot(1139,108).
dot(522,287).
dot(624,513).
dot(997,33).
dot(1190,658).
dot(35,56).
dot(1275,406).
dot(773,208).
dot(1125,716).
dot(69,621).
dot(1093,518).
dot(1310,837).
dot(1125,268).
dot(865,448).
dot(1102,94).
dot(306,10).
dot(373,483).
dot(442,866).
dot(858,105).
dot(602,168).
dot(624,159).
dot(334,719).
dot(480,162).
dot(870,172).
dot(602,736).
dot(0,508).
dot(1064,154).
dot(1056,712).
dot(582,161).
dot(1261,591).
dot(661,308).
dot(35,200).
dot(92,19).
dot(214,390).
