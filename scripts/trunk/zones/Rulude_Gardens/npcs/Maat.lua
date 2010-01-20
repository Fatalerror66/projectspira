-----------------------------------
--	Author: atkb
-- 	Maat
-- 	Various Limit Breaks working. 
--
-- 	Arcanedemon Notes: Default event should be 0x5E and warp to 
--	battlefields still needs to take in to account occupied 
--
--	Tenjou Notes:.Cleaned up the trade, and threw in his "regular" text, 
--	it goes at the default case of the if statement (at the bottom).
--	
--	More Tenjou Notes: Added level cap adjustments, and a bit more cleanup (6/16/09)
-----------------------------------
-- Includes
require("scripts/globals/settings");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
level = player:getMainLvl();
limit = player:getVar("LimitBreak");
local lbkeyone = player:hasKeyItem(0xde,0xdf,0xe0);
local lbkeytwo = player:hasKeyItem(0x150,0x151,0x152);
local lbkeythree = player:hasKeyItem(0x1d2,0x1d3,0x1d4,0x1d5);
if (level == 50 and limit == 0) then
	player:startEvent(Event(0x004f));
elseif (level == 50 and limit == 1) then
	player:startEvent(Event(0x0050));
elseif (level >= 51 and limit == 2) then
	player:startEvent(Event(0x0052));
elseif (limit == 3 and lbkeyone == 0) then
	player:startEvent(Event(0x0053));
elseif (limit == 3 and lbkeyone == 1) then
	--Complete second genkai quest.
	player:startEvent(Event(0x0054));
	player:setVar("LimitBreak",4);
	player:removeKeyItem(0xde);
	player:removeKeyItem(0xdf);
	player:removeKeyItem(0xe0);
	player:setLevelCap(60);
elseif (level >= 56 and limit == 4) then
	player:startEvent(Event(0x0055));
elseif (limit == 5 and lbkeytwo == 0) then
	player:startEvent(Event(0x0056));
elseif (limit == 5 and lbkeytwo == 1) then
	--Complete third genkai quest.
	player:startEvent(Event(0x0057));
	player:setVar("LimitBreak",6);
	player:removeKeyItem(0x150);
	player:removeKeyItem(0x151);
	player:removeKeyItem(0x152);
	player:setLevelCap(65);
elseif (level >= 61 and limit == 6) then
	player:startEvent(Event(0x0058));
elseif (limit == 7 and lbkeythree == 0) then
	player:startEvent(Event(0x0059));
elseif (limit == 7 and lbkeythree == 1) then
	--Complete fourth genkai quest.
	player:startEvent(Event(0x005A));
	player:setVar("LimitBreak",8);
	player:removeKeyItem(0x1d2);
	player:removeKeyItem(0x1d3);
	player:removeKeyItem(0x1d4);
	player:removeKeyItem(0x1d5);
	player:setLevelCap(70);
elseif (level >= 66 and limit == 8) then
	player:startEvent(Event(0x005c));
	player:setVar("LimitBreak",9);
elseif (limit == 9) then
	event0x5b = Event(0x5b);
	event0x5b:setParams(player:getMainJob());
	player:startEvent(event0x5b);
else
	player:showText(npc,746);
end
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
count = trade:getItemCount();
--print("count: " .. count);

item1 = trade:hasItemQty(0x440,1);
item2 = trade:hasItemQty(0x441,1);
item3 = trade:hasItemQty(0x442,1);
item5 = trade:hasItemQty(0x591+player:getMainJob(),1);

----------------------------------
-- Limit Break 1 Trade
-----------------------------------
if (count == 3 and item1 and item2 and item3) then
	--Complete first genkai quest.
	player:startEvent(Event(0x0051));
	player:setVar("LimitBreak",2);
	player:setLevelCap(55);
-----------------------------------
-- Limit Break 5 Trade
-----------------------------------
elseif (count == 1 and item5) then
	player:startEvent(Event(0x0040));
end
end;

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
job = player:getMainJob();
switch(csid) : caseof {
---------------------------------
[0x004f] = function (x) -- Limit Break 1 Accept
---------------------------------
if (option == 1) then
	player:setVar("LimitBreak",1);
else
		player:setVar("LimitBreak",0);
end
 end,
---------------------------------
[0x0052] = function (x) -- Limit Break 2 Accept
---------------------------------
if (option == 1) then
	player:setVar("LimitBreak",3);
else
	player:setVar("LimitBreak",2);
end
 end,
---------------------------------
[0x0055] = function (x) -- Limit Break 3 Accept
---------------------------------
if (option == 1) then
	player:setVar("LimitBreak",5);
else
	player:setVar("LimitBreak",4);
end
 end,
---------------------------------
[0x0058] = function (x) -- Limit Break 4 Accept
---------------------------------
if (option == 1) then
	player:setVar("LimitBreak",7);
else
	player:setVar("LimitBreak",6);
end
 end,
---------------------------------
[0x0040] = function (x) -- Limit Break 5 Accept
---------------------------------
if (option == 1) then
  if (job == 2 or job == 3 or job == 15) then
    player:setPos(299.316,-123.591,353.760,66,0x92);
  elseif (job == 1 or job == 4 or job == 11) then
    player:setPos(-511.459,159.004,-210.543,10,0x8b);
  elseif (job == 7 or job == 8 or job == 10) then
    player:setPos(-225.146,-24.250,20.057,255,0xce);
  elseif (job == 5 or job == 6 or job == 9) then
    player:setPos(-349.899,104.213,-260.150,0,0x90);
  elseif (job == 12 or job == 13 or job == 14) then
    player:setPos(-220.084,-0.645,4.442,191,0xa8);
  end
end
 end,
---------------------------------
default = function (x) end,}
---------------------------------
--print("CSID:",csid);
--print("RESULT:",option);
--print("JOB:",job);
end;