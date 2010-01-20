--------------------------------------------
-- Author: ReaperX
-- Rankpoints system
--------------------------------------------
-- Definitions for named cutscenes. These are the CS listed in the event recall bard's menu.
-- San d'Oria Missions:
--[[
      Chateau_TheDavoiReport_Pt1 = 
      Chateau_TheDavoiReport_Pt2 = 
    Chateau_TheCrystalSpringHall = 
  Chateau_TheCrystalSpringGarden = 
      Chateau_AppointmentToJeuno = --]]
    Chateau_TheRuinsOfFeiYin_Pt1 = 0x1FD;
    Chateau_TheRuinsOfFeiYin_Pt2 = 0x215;
    Chateau_TheRuinsOfFeiYin_Pt3 = 0x216;
       Chateau_TheShadowLord_Pt1 = 0x223;
       Chateau_TheShadowLord_Pt2 = 0x3D;
   Chateau_LeautesLastWishes_Pt1 = 0x57;
   Chateau_LeautesLastWishes_Pt2 = 0x6f;
  Chateau_RanperresFinalRest_Pt1 = 0x51;
  Chateau_RanperresFinalRest_Pt2 = 0x15;
         Chateau_TheSecretWeapon = 0;
         Chateau_ComingOfAge_Pt1 = 0x74; 
       Chateau_ComingOfAge_Trion = 0x40;
      Chateau_ComingOfAge_Pieuje = 0x4B;
        Chateau_Lightbringer_Pt1 = 0x64;
        Chateau_Lightbringer_Pt2 = 0x68;
      Chateau_Lightbringer_Trion = 0x3F;
     Chateau_Lightbringer_Pieuje = 0x4A;
    Chateau_BreakingBarriers_Pt1 = 0x20;
    Chateau_BreakingBarriers_Pt2 = 0x4C;
   Chateau_TheHeirToTheLight_Pt1 = 0xA;
   Chateau_TheHeirToTheLight_Pt2 = 0x8;
   Chateau_TheHeirToTheLight_Pt3 = 0x9;
 Chateau_TheHeirToTheLight_Trion = 0x3E
Chateau_TheHeirToTheLight_Pieuje = 0x49;

-----------------------------------
--[[ Experimental Rank Point System

     Author: ReaperX

		 INTRODUCTION

     There is incomplete information on Allakhazam and Ffxiclopedia concerning how many crystals one has
     to turn in for a full rank bar. I gathered what I could find for Bastok and Windurst missions and
     saw that the documented amounts and how much they fill up the rank bar are consistent with an increasing
     relationship, allowing for discrepancies in reporting. For example
     
     http://wiki.ffxiclopedia.org/wiki/Return_of_the_Talekeeper
     
     states that 3 stacks of crystals will produce a rank bar that's about 2/5 full at Bastok rank 6, while
     
     http://wiki.ffxiclopedia.org/wiki/Full_Moon_Fountain_%28Mission%29
     
     claims a requirement of "over 1/4 of rank bar filled" and also mentions that 3 stacks are enough to get there.
     
     I'm assuming that the same formula is used for all three nations and that discrepancies like these are due to
     human error in judging or reporting the state of the rank bar.
  	        
     I computed a linear least squares fit to the data but could not get a very good match. So I decided to use a
     quadratic model instead:
     
     --------------------------------------------------------
     # stacks of regular (non-light/non-dark) crystals needed to fill rank bar ~= f(rank)
     
     with f(r) = 0.372*r^2 - 1.62*r +6.2
		 ---------------------------------------------------------

		 This means:
     
     rank | stacks needed = f(rank)
     ----------------
        2 | 4.5
        3 | 4.7
        4 | 5.7
        5 | 7.4
        6 | 9.9
        7 | 13.1
        8 | 17
        9 | 21.8
        
     This is fairly consistent with what is known about number of crystals needed to be turned in, allowing for extra
     rank points to be gained from completing missions as well.
          
     A full rank point bar is 4095 units, so the conversion formula between rank points and stacks is
     
     points = 4095 * stacks/f(rank) = 1023.25 * crystals / f(rank) / 3
    
     Crystals is the sum of all crystals turned in. Light and dark are known to be worth more, so they
     have to be weighted by LIGHT_DARK_WEIGHT.
    
    Some comparisons on the approximation quality.
    
    at rank.. | .. stacks | fill bar (reported)   			| fill rank bar (formula)
    -----------------------------------------
           4  |        3  |  50%  											| 52.3%
           6  |        3  |  40% (1), over 25% (2)		 	| 30.0%
           7  |        4  |  over 25% (3)  							| 30.6%
           8  |    4 3/4  |  approx 30%	(4)							| 27.9%
           8  |        5  |  about 1/3 (5)							| 29.3%
           9  |       7-8 |  about 1/3 (6)   						| 32.2%-36.8%
              
    Sources: 
    
    (1) http://wiki.ffxiclopedia.org/wiki/Return_of_the_Talekeeper
    (2) http://wiki.ffxiclopedia.org/wiki/Full_Moon_Fountain_%28Mission%29
    (3) http://wiki.ffxiclopedia.org/wiki/The_Sixth_Ministry
    (4) http://wiki.ffxiclopedia.org/wiki/Vain
    (5) http://ffxi.allakhazam.com/db/quests.html?fquest=429 and http://wiki.ffxiclopedia.org/wiki/The_Chains_That_Bind_Us
    (6) http://wiki.ffxiclopedia.org/wiki/Doll_of_the_Dead

   DETERMINING MISSION REWARDS
  
   It's known that to skip Windurst mission 3.2, you need to turn in an extra 2.5 stacks of crystals.
   That's 1/2 stack more than you need to turn in if you do the mission, so the rank points gained from
   the mission equal 1/2 stack = 6 crystals.
  
   On the other hand, this is almost nothing at higher ranks, so it seems reasonable to postulate a linear
   relationship.
  
   It is known that at rank 9, 7-8 stacks fill your rank bar about 1/3. Therefore, a full rank bar represents
   about 22.5 stacks. It is also known that turning in 8 stacks activates 9.1, and another 8 activates 9.2. So
   16 stacks + reward for 9.1 = 0.9 * 22.5, so reward for 9.1 = 4.25 stacks = 51 crystals. 
  
   The linear formula that fits these two data points is rank = 15/2 * rank  - 33/2. But that formula predicts 
   a negative reward at rank 2. So I assumed that 7 stacks is closer to the true amount that represents
   1/3, resulting in 21 stacks total. Then, the mission reward comes to 0.9*21-16 = 2.9 stacks = 34.8 crystals.
   With some plausible rounding up, this is approximated by the formula
   
   -----------------------
   reward (in crystal units) = 5 * rank - 9
   ----------------------- 
   
   This formula produces the following values:
   
       rank | reward
       -------
          2 | 1
          3 | 6
          4 | 11
          5 | 16
          6 | 21
          7 | 26
          8 | 31
          9 | 36
  
  	The rank 2 reward may seem abnormally small, but a very small value is required so that the 4.5 stacks 
  	predicted by this model for a full rank bar (54 crystals) remain consistent with the data that 42 crystals + completing
  	2.1 suffice to activate 2.3, see
  	
  	http://wiki.ffxiclopedia.org/wiki/A_Testing_Time
  	
  	At 1 crystal equivalent of reward, this means that 2.3 is activated at 80% rank bar which may seem a little high,
  	but is still plausible.
  	  
  	TESTING THE REWARD FORMULA
  	
  	It is known that at Windurst rank 8, a full rank bar represents 190 crystals (4 3/4 stacks = 30%). 57 or 30% 
  	rank bar are needed to receive 8.1, and another 5 - 5 1/2 stacks of crystals are needed after winning 8.1 to
  	get 8.2. That happens at 80% rank bar. 50% increase in rank bar represents 95 crystals, of which only 60 to
  	66 need to be traded. So the mission awarded between 29 and 35 crystal units. The average of these numbers
  	is 32, and the predicted reward is 31.
  	
  	CONCLUSIONS
  	
  	The crystal-rank point relation is fairly good. It is essentially accurate for the ranks where the best data
  	exists (4, 8, 9). The mission reward crystal formula is essentially accurate given the available data.

--]]

-- Initialization
         
-- San d'Oria specific Items and Key Items

OrcishAxe = 16656;
OrcishMailScales = 1112;
BatFang = 891;
OrcishHutKey = 0x9D;
CrystalBass = 4528;
ParanaShield = 12298;
BronzeSword = 16535;						
RescueTrainingCertificate = 0x41
LostDocument = 0x67;
EastBlockCode = 0x68;
SouthBlockCode = 0x69;
NorthBlockCode = 0x6A;
TempleKnightsDavoiReport = 0x2C
RoyalKnightsDavoiReport = 0xED;
LetterToConsulsSandy = 0x5;
Dreamrose = 0x10C;
PieceOfPaper = 0x10E;
AncientSandOrianBook = 0x10D;
AncientSandOrianTablet = 0x11B;
DropsOfAmnio = 0x120;
CrystalDowser = 0x11C;
PieceOfABrokenKey1 = 0x11D;
PieceOfABrokenKey2 = 0x11E;
PieceOfABrokenKey3 = 0x11F;
FigureOfLeviathan = 0x1E1;
FigureOfGaruda = 0x1E2;
FigureOfTitan = 0x1E3;

-- Bastok specific Items and Key Items

ZeruhnReport = 0x1;
BlueAcidityTester = 0x3;
RedAcidityTester = 0x4;
CLReport = 0xC;
LetterToConsulsBastok = 0x6;
SwordOffering = 0x1f;
ShieldOffering = 0x20;
DullSword = 0x21;
QuadavFetichHead = 606;
QuadavFetichTorso = 607;	
QuadavFetichArms = 608;
QuadavFetichLegs = 609;
ChunkOfGlocolite = 563;
AltepaMoonpebble = 0x10A;
LetterFromWerei = 0x122;
OldPieceOfWood = 0x125;
MiracleSalt = 0x1DD;
 
-- Windurst specific Items and Key Items

CrackedManaOrb = 0x1C;
FirstDarkManaOrb = 0x25;
SecondDarkManaOrb = 0x33;
ThirdDarkManaOrb = 0x34;
FourthDarkManaOrb = 0x35;
FifthDarkManaOrb = 0x36;
SixthDarkManaOrb = 0x37;
SoutheasternStarCharm = 0x70;
FirstGlowingManaOrb = 0x3B;
SecondGlowingManaOrb = 0x3C;
ThirdGlowingManaOrb = 0x3D;
FourthGlowingManaOrb = 0x3E;
FifthGlowingManaOrb = 0x3F;
SixthGlowingManaOrb = 0x40;
FoodOffering = 0x11;
DrinkOffering = 0x12;
LapisMonocle = 0x58;
LapisCoral = 0x44;
HideoutKey = 0x43;
CreatureCounter = 0x26;
LetterToConsulsWindy = 0x7;
CharmOfLight = 0x42;
StarCrestedSummons = 0x9E;
SouthwesternStarCharm = 0xF8;
HolyOnesInvitation = 0xF9;
BalgaChampionCertificate = 0xC7;
HolyOnesOath = 0xC8; 
AshuraNecklace = 13134;
OptisteryRing = 0xFA;
BlankBookOfTheGods = 0xFB;
StarSeeker = 0x113;
MagicDrainedStarSeeker = 0x117;
AurasteryRing = 0x114;
CurseWand = 17437;
CursedKey = 1143;         
RhinosteryRing = 0x118;
ManusteryRing = 0x119;
OrasteryRing = 0x109;
GloveOfPerpetualTwilight = 0x11A;
ClumpOfGoobbueHumus = 1181;
LetterFromZonpaZippa = 0x1DB;
AncientVerseOfRoMaeve = 0x1DE;
AncientVerseOfAltepa = 0x1DF;
AncientVerseOfUggalepih = 0x1E0;
      
-- Common Key Items

DarkKey = 0x22;
KindredCrest = 0xd;
KindredReport = 0x1d;
AdventurersCertificate = 0x23;    
LetterToTheAmbassador = 0x1E;
AirshipPass = 0x8;
MagiciteOptistone = 0xE;
MagiciteAurastone = 0xF;
MagiciteOrastone = 0x10;
LetterToAldo = 0x16;
ArchducalAudiencePermit = 0x38;
NewFeiYinSeal = 0x48;
BurntSeal = 0x49;
ShadowFragment = 0x4A;         
MessageToJeunoSandy = 0x45;
MessageToJeunoBastok = 0x46;
MessageToJeunoWindurst = 0x47;
     
 -- Crystals
 
FireCrystal = 4096;
IceCrystal = 4097;
WindCrystal = 4098;
EarthCrystal = 4099;
LightningCrystal = 4100;
WaterCrystal = 4101;
LightCrystal = 4102;
DarkCrystal = 4103;        
      
 -- Flags
 
SandOrianFlag  = 181;
BastokanFlag = 182;
WindurstianFlag = 183;
     
 -- Titles
 
FreshNorthWindsRecruit = 111;
NewBestoftheWestRecruit = 112;
NewBuumasBoomersRecruit = 113;
HeavensTowerGatehouseRecruit = 114;
StarOrdainedWarrior = 118;
ShadowBanisher = 208;
SandOrianRoyalHeir = 295;
CertifiedAdventurer = 207;
HeroOnBehalfOfWindurst = 283;
VictorOfTheBalgaContest = 284;
FugitiveMinisterBountyHunter = 256;
VestalChamberlain = 294;


          LIGHT_DARK_WEIGHT = 1.5 -- light or dark crystals count this times as much for rank points
BASTOK_RANK1_MISSION_REPEAT = 100 -- number of rank points gained from repeating a rank 1 mission (just a guess)
BASTOK_RANK2_MISSION_REPEAT = 100 -- number of rank points gained from repeating Mission 2.2 (approximately correct for Bastok/Wading Beasts)
BASTOK_RANK3_MISSION_REPEAT = 100 -- number of rank points gained from repeating a rank 3 mission (just a guess)
			
SANDY_RANK1_MISSION_REPEAT = 182; 
SANDY_RANK2_MISSION_REPEAT = 182;
SANDY_RANK3_MISSION_REPEAT = 182;

-- http://wiki.ffxiclopedia.org/wiki/Leaute%27s_Last_Wishes says that at rank 6, 37 crystals enable you to get the mission,
-- or 7 repetitions of Bat Hunt or The Crystal Spring. Using the formulas here, that implies that one repetition of each quest gives 182 rank
-- points. 
			
WAIT_TIME_FOR_BOOK_DECIPHERING = 300; -- time in seconds player needs to wait until the deciphering of the book is complete (in San d'Oria 7-1)
   WAIT_TIME_FOR_COMING_OF_AGE = 300; -- time in seconds player needs to wait until the coming of age ceremony starts (between San d'Oria 8-1 and 8-2)
			
function rank_point_function(rank)
	return 0.372*rank^2 - 1.62*rank + 6.2;
end

----------------------------------------------------------
-- adds rank points equivalent to number of crystals to player's rank bar and returns how many points were added.
----------------------------------------------------------
function add_crystals_to_rank_points(player, crystals)
	rank_points = math.floor(1024 * crystals / (3*rank_point_function(player:getRank())));
	current_rank_points = player:getRankPoints();
	if (current_rank_points + rank_points >= 4096) then
		rank_points = 4095 - current_rank_points;
	end;
	-- --print("Added ", rank_points, " rank points to player for crystals.");
	player:addRankPoints(rank_points);
	return rank_points;
end

----------------------------------------------------------
-- adds rank points for completing a mission
----------------------------------------------------------
function add_rank_points_for_mission(player)
	crystals = 5*player:getRank()-9;
	rank_points = add_crystals_to_rank_points(player, crystals);
	-- --print("Added ", rank_points, " rank points to player as mission reward.");
	return rank_points;
end
----------------------------------------------------
-- returns true if you have enough rank points to undertake the mission, for any of the 3 nations.
----------------------------------------------------
function has_rank_points_for_mission(player, missionID)
-----------------------------------------------
-- define mission requirements in units of crystals, later convert them into rank points. 
-----------------------------------------------
if (missionID == 3) then                   	-- mission 2.1
	crystals = 9;
elseif (missionID == 4) then                -- mission 2.2
	crystals = 17;
elseif (missionID == 5) then                -- mission 2.3
	crystals = 42;
elseif (missionID == 10) then               -- mission 3.1
	crystals = 12;														-- 1 stack needed to unlock
elseif (missionID == 11) then               -- mission 3.2
	crystals = 30;														-- 2.5 stacks needed to unlock (2 stacks of crystals + 3.1 rank points corresponding to half a stack)
elseif (missionID == 12) then               -- mission 3.3
	crystals = 48;														-- 4 stacks to unlock (3.5 stacks + 3.1 rank points corresponding to half a stack)
elseif (missionID == 13) then               -- Magicite mission
	crystals = 36;														-- 3 stacks to unlock
																						-- 5.1 starts directly after Magicite, no crystals needed
elseif (missionID == 15) then               -- mission 5.2 (shadow lord fight)
	crystals = 44;														-- Mission unlocks at 50% rank bar ~= 44 crystals using the present formula. 

elseif (missionID == 16) then               -- mission 6.1
	crystals = 36;														-- 3 stacks to unlock
elseif (missionID == 17) then               -- mission 6.2
	crystals = 93;														-- 3 additional stacks to unlock + 3 original stacks + 21 from mission 6.1

elseif (missionID == 18) then               -- mission 7.1
	crystals = 45;														-- 45 needed, from http://wiki.ffxiclopedia.org/wiki/The_Final_Image
																						-- (http://wiki.ffxiclopedia.org/wiki/Prestige_of_the_Papsque says 47 though)
elseif (missionID == 19) then               -- mission 7.2
	crystals = 119;														-- 4 additional stacks needed, plus mission reward of 26

elseif (missionID == 20) then               -- mission 8.1
	crystals = 57;														-- 4 3/4 stacks needed
elseif (missionID == 21) then               -- mission 8.2
	crystals = 148;														-- 5 additional stacks needed, plus mission reward of 31, 

elseif (missionID == 22) then               -- mission 9.1
	crystals = 96;														-- 8 stacks needed (higher value chosen so final rank bar requirement is closer to 90%)
elseif (missionID == 23) then               -- mission 9.2
	crystals = 228;														-- Additional 8 stacks needed, plus mission reward of 36 (87% rank bar)
end;

points_needed = 1024 * (crystals-.25) / (3*rank_point_function(player:getRank()))
--print("Has rank points: ",player:getRankPoints()," Needs Rank Points for Mission ", missionID, ": ",points_needed);
return (player:getRankPoints() >= points_needed ); 
end

--------------------------------------------------------------------
------- computes the mission masks for a character of any of the three nations (first and repeat missions)
--------------------------------------------------------------------
function get_mission_mask(player)

rank = player:getRank()
mission_status =  player:getVar("mission_status");
nation = player:getNation();  -- 0 = San d'Oria ; 1 = Bastok ; 2 = Windurst

first_mission = 0;
repeat_mission = 0;

------------- check repeatable missions -----------------------------
 -- missions 2.2 and 3.2 are repeatable in all 3 nations.
 -- mission 1.3 is repeatable in Bastok and San d'Oria.
 -- missions 1.1 and 1.2 are repeatable in San d'Oria.

-- if you've already completed a repeatable mission, you may get it again.
--------------------------------------------------------
 
if (player:getMissionStatus(nation,2) == 2) and (nation ~= 2) then
	repeat_mission = repeat_mission + 4;										-- 1.3 repeatable anywhere but Windurst
end;

if (player:getMissionStatus(nation,4) == 2) then
	repeat_mission = repeat_mission + 16;										-- 2.2
end;

if (player:getMissionStatus(nation,11) == 2) then
	repeat_mission = repeat_mission + 2048;									-- 3.2
end;

if (nation == 0) and (player:getMissionStatus(nation,0) == 2) then      -- 1.1 repeatable in San d'Oria
	repeat_mission = repeat_mission + 1;
end

if (nation == 0) and (player:getMissionStatus(nation,1) == 2) then      -- 1.2 repeatable in San d'Oria
	repeat_mission = repeat_mission + 2;
end

if (nation == 0) and (player:getMissionStatus(nation,10) == 2) then      -- 3.1 repeatable in San d'Oria
	repeat_mission = repeat_mission + 1024;
end

----------------- skippable missions (2-2 and 3-2), first completion.

if (player:getMissionStatus(nation,3) == 2) and (player:getMissionStatus(nation,4) == 0) then
	--print("skippable mission check 1");
	if ((rank == 2) and has_rank_points_for_mission(player, 4)) or (rank > 2) then
	  first_mission = first_mission + 16;
	end;
end;

if (player:getMissionStatus(nation,10) == 2) and (player:getMissionStatus(nation,11) == 0) then
	--print("skippable mission check 2");
	if ((rank == 3) and has_rank_points_for_mission(player, 11)) or (rank > 3) then
		first_mission = first_mission + 2048;
  end;
end; 
----------------- non repeatable missions now ------------------------

if (rank == 1) then 
	if (player:getMissionStatus(nation,0) == 2) and (player:getMissionStatus(nation,1) == 0) then
		first_mission = first_mission + 2;
	elseif (player:getMissionStatus(nation,1) == 2) and (player:getMissionStatus(nation,2) == 0) then
 		first_mission = first_mission + 4;
	end;
elseif (rank == 2) then
	if (player:getMissionStatus(nation,3) == 0) and has_rank_points_for_mission(player, 3) then
		first_mission = first_mission + 8;
	elseif (player:getMissionStatus(nation,3) == 2) and has_rank_points_for_mission(player, 5) then
	  first_mission = first_mission + 32;
  end;
elseif (rank == 3) then
	if (player:getMissionStatus(nation,10) == 0) and has_rank_points_for_mission(player, 10) then
		first_mission = first_mission + 1024;
	elseif (player:getMissionStatus(nation,10) == 2) and has_rank_points_for_mission(player, 12) then
		first_mission = first_mission + 4096;
	end
elseif (rank == 5) and (player:getMissionStatus(nation,14) == 0) and (mission_status == 0) then -- mission 5.1 start is special
  first_mission = first_mission +16384

elseif (rank == 5) and (player:getMissionStatus(nation,14) == 2) and has_rank_points_for_mission(player, 15) then
    first_mission = first_mission + 32768;

elseif (rank == 6) then
  if (player:getMissionStatus(nation,16) == 0) and has_rank_points_for_mission(player, 16) then -- 6.1
    first_mission = first_mission + 65536;
  elseif (player:getMissionStatus(nation,16) == 2) and has_rank_points_for_mission(player, 17) then --
    first_mission = first_mission + 131072;
  end
  
elseif (rank == 7) then
	if (player:getMissionStatus(nation,18) == 0) and has_rank_points_for_mission(player, 18) then -- 7.1
		first_mission = first_mission + 262144;
	elseif (player:getMissionStatus(nation,18) == 2) and has_rank_points_for_mission(player, 19) then -- 7.2
		first_mission = first_mission + 524288;
	end;
 
elseif (rank == 8) then
	if (player:getMissionStatus(nation,20) == 0) and has_rank_points_for_mission(player, 20) then -- 8.1
		first_mission = first_mission + 1048576;
	elseif (player:getMissionStatus(nation,20) == 2) and has_rank_points_for_mission(player, 21) then -- 8.2
		first_mission = first_mission + 2097152;
	end
  
elseif (rank == 9) then
	if (player:getMissionStatus(nation,22) == 0) and has_rank_points_for_mission(player, 22) then -- 9.1
		first_mission = first_mission + 4194304;
	elseif (player:getMissionStatus(nation,22) == 2) and has_rank_points_for_mission(player, 23) then -- 9.2
		first_mission = first_mission + 8388608;
	end
end

mission_mask = 2147483647 - repeat_mission - first_mission; -- 2^31 -1 - ..
return mission_mask,repeat_mission;
end;

-------------------------------------------------------
--- returns the weighted number of cyrstals in the trade; zero if no crystals or other items present.
--- 2nd argument: 0 for a sum, 1 for a weighted sum that gives more weight to light and dark crystals.

function traded_crystals(trade,do_weight)

fire = trade:getItemQty(FireCrystal)
ice = trade:getItemQty(IceCrystal);
wind = trade:getItemQty(WindCrystal);
earth = trade:getItemQty(EarthCrystal);
lightning = trade:getItemQty(LightningCrystal);
water = trade:getItemQty(WaterCrystal);
light = trade:getItemQty(LightCrystal);
dark = trade:getItemQty(DarkCrystal);
    
sum = fire+ice+wind+earth+lightning+water+light+dark;
      
result = 0;
            
if (sum == 0) or (sum < trade:getItemCount()) then
	result = 0;
else
	if (do_weight == 1) then
		result = fire+ice+wind+earth+lightning+water+LIGHT_DARK_WEIGHT*(light+dark);
	else
		result = sum;
	end;
end;
	return result;
end;

--- auxiliary functions for orbs in Windy mission 1-2
function place_orb(player)
if (player:hasKeyItem(FirstDarkManaOrb) == 1) then
	player:removeKeyItem(FirstDarkManaOrb);
	return FirstDarkManaOrb;
elseif (player:hasKeyItem(SecondDarkManaOrb) == 1) then
	player:removeKeyItem(SecondDarkManaOrb);
	return SecondDarkManaOrb;
elseif (player:hasKeyItem(ThirdDarkManaOrb) == 1) then
	player:removeKeyItem(ThirdDarkManaOrb);
	return ThirdDarkManaOrb;
elseif (player:hasKeyItem(FourthDarkManaOrb) == 1) then
	player:removeKeyItem(FourthDarkManaOrb);
	return FourthDarkManaOrb;
elseif (player:hasKeyItem(FifthDarkManaOrb) == 1) then
	player:removeKeyItem(FifthDarkManaOrb);
	return FifthDarkManaOrb;
elseif (player:hasKeyItem(SixthDarkManaOrb) == 1) then
	player:removeKeyItem(SixthDarkManaOrb);
	return SixthDarkManaOrb;
end;
end;

function take_orb(player)
if (player:hasKeyItem(FirstGlowingManaOrb) == 0) then
	player:addKeyItem(FirstGlowingManaOrb);
	return FirstGlowingManaOrb;
elseif (player:hasKeyItem(SecondGlowingManaOrb) == 0) then
	player:addKeyItem(SecondGlowingManaOrb);
	return SecondGlowingManaOrb;
elseif (player:hasKeyItem(ThirdGlowingManaOrb) == 0) then
	player:addKeyItem(ThirdGlowingManaOrb);
	return ThirdGlowingManaOrb;
elseif (player:hasKeyItem(FourthGlowingManaOrb) == 0) then
	player:addKeyItem(FourthGlowingManaOrb);
	return FourthGlowingManaOrb;
elseif (player:hasKeyItem(FifthGlowingManaOrb) == 0) then
	player:addKeyItem(FifthGlowingManaOrb);
	return FifthGlowingManaOrb;
elseif (player:hasKeyItem(SixthGlowingManaOrb) == 0) then
	player:addKeyItem(SixthGlowingManaOrb);
	return SixthGlowingManaOrb;
end;
end;