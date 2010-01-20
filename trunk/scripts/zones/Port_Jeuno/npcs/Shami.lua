-----------------------------------
--	Author: ReaperX
-- 	Shami
-- 	Trades and holds beastmen and kindred seals, and gives out orbs for BC fights.

--  Missing: 
--  1. "Lure of the Wildcat (Jeuno)" quest.
--  2. Can't trade orbs back to him yet (requires identification of the orb as "cracked" or not)
--  Bugs: 
--  1. when you retrieve more than 1 BS or KS, you get the message that you obtained one seal. You receive the correct number though.
--  2. when you trade other items along with the seal(s), those items are lost.
-----------------------------------
-- Includes
require("scripts/globals/settings");
require("scripts/globals/bcnm");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
------------ Shami events -----------------

-- 0x0016 : "Oh dear! I see a crack here. It's worthless now, so I'll dispose of it."
-- 0x0017 :  Introduction (lists orbs and their prices and how to release monster) (obsolete event?)
-- 0x0018 : "All right, it's a deal (Heh, what a sucker!)"
-- 0x0019 : "I can only allow one exchange per week per adventurer."
-- 0x001A : "The merchant I bought it from told me that the monster can easily be released! Just toss it into the burning circles
--           in the Qu'Bia Arena, the Yughott Grotto, the Palborough Mines, and Giddeus."
-- 0x001B : "The dealer I bought these from said that all you have to do is throw that orb into the burning circle in the Qu'Bia 
--           arena or the shimmering circle in the Chamber of Oracles, and poof! Instant monster!"

-- 0x0032 : "Excellent 30 Kindreds Seals. Now choose which orb you want. (Clotho,Lachesis, Atroops)"

-- 0x0008 : "All right, it's a deal (Heh, what a sucker!") I think I remember somebody saying that orb can be used in burning circles
--           located deep within the Yughott Grotto, the Palborough Mines, Giddeus and the Qu'Bia Arena. He also mentioned something
--           about a door in Ghelsba..."
-- 0x0009 : "I think I remember somebody saying that orb can be used in burning circles located deep within the Yughott Grotto, the 
--           Palborough Mines, Giddeus and the Qu'Bia Arena. He also mentioned something about a door in Ghelsba..."
--
-- 0x0004 : "All right, it's a deal (Heh, what a sucker!")The dealer that sold me that strange orb said that the monster inside could
--           only be released by tossing it in burning circles in the Yughott Grotto, the Palborough Mines, and Giddeus, or at some 
--           strange door in Ghelsba..."
-- 0x0005 : "The dealer that sold me that strange orb said that the monster inside could only be released by tossing it in burning circles 
-- 					in the Yughott Grotto, the Palborough Mines, and Giddeus, or at some strange door in Ghelsba..."
-- 0x000A : "All right, it's a deal (Heh, what a sucker!") I think the dealer that sold me the Themis orbs said something about being
--           able to release the monster in burning circles in the Yughott Grotto, the Palborough Mines, and Giddeus."
-- 0x000B : "I think the dealer that sold me the Themis orbs said something about being able to release the monster in burning circles 
--           in the Yughott Grotto, the Palborough Mines, and Giddeus."
-- 0x013D : Lure of the Wildcat (Jeuno) quest

-- 0x0141 : confirms receipt of beastmen's seals
-- 0x0142 : event 0017 + menu choices


-- debug code ----------
--player:setVar("BS_COUNT",500);
--player:setVar("KS_COUNT",600);
----------------

bs = player:getVar("BS_COUNT");
ks = player:getVar("KS_COUNT");
shami_status = player:getVar("SHAMI_STATUS"); -- if if you never talked to him before, 1 if you did.

-- 8th param: 0 = first time customer, 1 = repeat customer

event = Event(0x0142);
event:setParams(65536*ks+bs,0,0,0,0,0,0,shami_status);
player:setVar("SHAMI_STATUS",1);
player:startEvent(event);
end; 
   

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)

bs = player:getVar("BS_COUNT");
ks = player:getVar("KS_COUNT");

bsqty = trade:getItemQty(BeastmenSeal)
ksqty = trade:getItemQty(KindredSeal)

print (bsqty);
print (ksqty);

if (bsqty > 0) then
	bs = bs + bsqty;
	player:setVar("BS_COUNT",bs);
	trade:isComplete()
	if (ksqty > 0) then                    -- if the player also traded KS, those must be returned to them.
		player:addItem(KindredSeal,ksqty)  -- (cannot trade both in the same transaction. )
	end
	event = Event(0x0141);
	event:setParams(BeastmenSeal,bs);
	player:startEvent(event);
elseif (ksqty > 0) then         -- KS are only processed if there are no BS in the trade.
	ks = ks + ksqty;              -- I don't remember for sure whether that is the retail behavior.
	player:setVar("KS_COUNT",ks);
	trade:isComplete()
	event = Event(0x0141);
	event:setParams(KindredSeal,ks);
	player:startEvent(event);
end
end; 
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
bs = player:getVar("BS_COUNT");
ks = player:getVar("KS_COUNT");
if (csid == 322) then
	if (option == 1) then 
		itemid = CloudyOrb;
		bs = bs - 20
	elseif (option == 2) then
		itemid = SkyOrb;
		bs = bs - 30
	elseif (option == 3) then
		itemid = StarOrb;
		bs = bs - 40
	elseif (option == 4) then
		itemid = CometOrb;
		bs = bs - 50
	elseif (option == 5) then
		itemid = MoonOrb;
		bs = bs - 60
	elseif (option == 6) then
		itemid = ClothoOrb;
		ks = ks - 30
	elseif (option == 7) then
		itemid = LachesisOrb;
		ks = ks - 30
	elseif (option == 8) then
		itemid = AtroposOrb;
		ks = ks - 30
	elseif (option == 9) then
		itemid = ThemisOrb;
		ks = ks - 90
	end  
	if (option > 0 and option <= 9)	 then	  
		player:addItem(itemid) 
		player:specialMessage(302,itemid);
	end
	if (option >= 510 and option <= 25598 and (option % 2 == 0) ) then
		bs_retrieved = (option+2)/256 - 1    -- formula used to return # of retrieved beastmen seals
		player:addItem(BeastmenSeal,bs_retrieved) 
		bs = bs-bs_retrieved
		player:specialMessage(302,BeastmenSeal,bs_retrieved); -- "should" work that way but doesn't
	end
	if (option >= 511 and option <= 25599 and (option % 2 == 1)) then
		ks_retrieved = (option+1)/256 - 1    -- formula used to return # of retrieved kindred seals
		player:addItem(KindredSeal,ks_retrieved) 
		ks = ks-ks_retrieved
		player:specialMessage(302,KindredSeal,ks_retrieved); -- "should" work that way but doesn't
	end
end
player:setVar("BS_COUNT",bs);   -- update server variables after trade
player:setVar("KS_COUNT",ks);
end;