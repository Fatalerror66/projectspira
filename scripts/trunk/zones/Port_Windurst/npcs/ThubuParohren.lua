-----------------------------------
--	Author: Tenjou
--  FISHERMAN' GUILDMASTER: Thubu Parohren
-- 	Inducts players into the Fishing Guild,and gives rank tests.
-----------------------------------
 
-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x2719 = Event(0x2719);
--ARGUMENT 1: Item to be used for the rank test.
--ARGUMENT 3: Set to 0,1,2, or 3 for rank tests.  Set to 0x10 for regular text (0x100 for high levels).
--ARGUMENT 4: Used for induction.  0 is for new members, otherwise 0x100 will turn it off.
--ARGUMENT 8: Guild ID to be used if the player is too high a level in another guild.

rank = player:getSkillRank(48);
lvl = player:getSkill(48);
--print(rank,lvl);
member = player:getVar("isGuildMember-Fishing");
item = 0;
text = 0;
test = player:getVar("takingTest-Fishing");
if (member == 0) then
	--Offer to induct player.
	event0x2719:setParams(0,0,0,0,0,0,0,0);
else
	--See if the player needs a guild rank test.
	if (lvl >= (((rank+1)*10)-2) and rank ~= 9) then
		text = 0;
		player:setVar("takingTest-Fishing",1);
		switch (rank) : caseof {
			[0] = function(x) item = 0x1131; end, --Recruit Test
			[1] = function(x) item = 0x111b; end, --Initiate Test
			[2] = function(x) item = 0x1175; end, --Novice Test
			[3] = function(x) item = 0x1180; end, --Apprentice Test
			[4] = function(x) item = 0x116e; end, --Journeyman Test
			[5] = function(x) item = 0x117f; end, --Craftsman Test
			[6] = function(x) item = 0x1177; end, --Artisan Test
			[7] = function(x) item = 0x117e; end, --Adept Test
			[8] = function(x) item = 0x117a; end, --Veteran Test
			--[9] = function(x) item = 0x1407; end, --Expert Test
			--[10] = function(x) item = 0; end, --Authority Test
			--[11] = function(x) item = 0; end, --Luminary Test
			--[12] = function(x) item = 0; end, --Master Test
			--[13] = function(x) item = 0; end, --Grandmaster Test
			--[14] = function(x) item = 0; end, --Legend Test
			default = function(x) end, }
	else
		--Regular dialogue --Changes if the player is high enough level.
		if (rank >= 6) then
			text = 0x100;
		else
			text = 0x10;
		end
	end
end
event0x2719:setParams(item,0,text,member*249,0,0,0,0);
player:startEvent(event0x2719);
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
test = player:getVar("takingTest-Fishing");
count = trade:getItemCount();
item0 = trade:hasItemQty(0x1131,1);
item1 = trade:hasItemQty(0x111b,1);
item2 = trade:hasItemQty(0x1175,1);
item3 = trade:hasItemQty(0x1180,1);
item4 = trade:hasItemQty(0x116e,1);
item5 = trade:hasItemQty(0x117f,1);
item6 = trade:hasItemQty(0x1177,1);
item7 = trade:hasItemQty(0x117e,1);
item8 = trade:hasItemQty(0x117a,1);
--item9 = trade:hasItemQty(0x1407,1);
--item10 = trade:hasItemQty(0,1);
--item11 = trade:hasItemQty(0,1);
--item12 = trade:hasItemQty(0,1);
--item13 = trade:hasItemQty(0,1);
--item14 = trade:hasItemQty(0,1);
rank = player:getSkillRank(48);
lvl = player:getSkill(48);
if (count == 1 and item0 and rank == 0 and lvl >= 8 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,1,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,1);
elseif (count == 1 and item1 and rank == 1 and lvl >= 18 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,2,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,2);
elseif (count == 1 and item2 and rank == 2 and lvl >= 28 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,3,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,3);
elseif (count == 1 and item3 and rank == 3 and lvl >= 38 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,4,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,4);
elseif (count == 1 and item4 and rank == 4 and lvl >= 48 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,5,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,5);
elseif (count == 1 and item5 and rank == 5 and lvl >= 58 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,6,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,6);
elseif (count == 1 and item6 and rank == 6 and lvl >= 68 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,7,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,7);
elseif (count == 1 and item7 and rank == 7 and lvl >= 78 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,8,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,8);
elseif (count == 1 and item8 and rank == 8 and lvl >= 88 and test) then
	local event0x271a = Event(0x271a);
	event0x271a:setParams(0,0,0,0,9,0,0,0);
	player:startEvent(event0x271a);
	trade:isComplete();
	player:setVar("takingTest-Fishing",0);
	player:setSkillRank(48,9);
--elseif (count == 1 and item9 and rank == 9 and lvl >= 98 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,10,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,10);
--elseif (count == 1 and item10 and rank == 10 and lvl >= 108 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,11,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,11);
--elseif (count == 1 and item11 and rank == 11 and lvl >= 118 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,11,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,12);
--elseif (count == 1 and item12 and rank == 12 and lvl >= 128 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,12,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,13);
--elseif (count == 1 and item13 and rank == 13 and lvl >= 138 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,13,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,14);
--elseif (count == 1 and item14 and rank == 14 and lvl >= 148 and test) then
	--local event0x271a = Event(0x271a);
	--event0x271a:setParams(0,0,0,0,14,0,0,0);
	--player:startEvent(event0x271a);
	--trade:isComplete();
	--player:setVar("takingTest-Fishing",0);
	--player:setSkillRank(48,15);	
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("OPTION:",option);
local fish = player:getVar("isGuildMember-Fishing");
if (option == 1 and fish == 0) then
	--Become a member of the guild.
	player:setVar("isGuildMember-Fishing",1);
end
end;