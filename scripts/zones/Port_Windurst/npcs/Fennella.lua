-----------------------------------
--	Author: Tenjou
--	GUILDWORKER'S UNION REPRESENTATIVE: Fennella
--	Takes guild items and gives guild points.  Sells crafting items and keyitems for guild points.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/fishingguild");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x2724 = Event(0x2724);
--ARGUMENT 1: Player's accumulated cooking guild points.
--ARGUMENT 2: Contracted guild.
--ARGUMENT 3: Today's Item
--ARGUMENT 4: Limit on guild points today.
--ARGUMENT 5: Which guild point items the player is eligible for.
--ARGUMENT 6: Amount of guild points the player has earned today.
--ARGUMENT 7: Which keyitems the player is eligible for.

--Pull relevant stats.
rank = player:getSkillRank(48);
lvl = player:getSkill(48);
points = player:getVar("guildPoints-Fishing");

--Check if the player has high enough skill level.
service = 1;
if (rank >= 3) then
	if (player:getVar("guildContract") == 0) then
		if (player:getVar("fishingGuildContract") ~= 1) then
			service = -1;
		else
			service = 0;
		end
	else
		service = player:getVar("guildContract");
	end
end
if (DISABLE_GUILD_CONTRACTS == 1) then service = 0; end


--Get today's item, HQ item, and guild point limit.
item,hqitem,nqpoints,hqpoints,value = getDailyItem(rank);
--print("Today's Item:",item);
--print("Value of Item:",nqpoints*FISHING_GUILD_POINTS);
--print("Today's HQ Item:",hqitem);
--print("Value of HQ Item:",hqpoints*FISHING_GUILD_POINTS);
--print("Total guild points today:",value*FISHING_GUILD_POINTS);

--Determine what guild point items the player is eligible for.
gpitem = (50+((rank-4)*10));
if (gpitem < 50) then gpitem = 50; end
if (rank < 3) then gpitem = 0; end

--See how many points the player has accumulated today.
timer = os.time();
counter = -1;
while (timer > 1009810800) do
	timer = (timer-86400);
	counter = counter+1;
end
--print("Day:",counter);
lasttradeday = player:getVar("lastGuildTrade-Fishing");
if (lasttradeday ~= counter) then
	player:setVar("dailyGPLimit-Fishing",0);
end
limit = player:getVar("dailyGPLimit-Fishing");

--Determine what key items the player doesn't yet have.
frog = player:hasKeyItem(0x7b8);
serpent = player:hasKeyItem(0x7b9);
mooching = player:hasKeyItem(0x7ba);
keyitem = 0;
if (frog == 0) then keyitem = keyitem+1; end
if (serpent == 0 and rank >= 8) then keyitem = keyitem+2; end
if (mooching == 0 and rank >= 9) then keyitem = keyitem+4; end

--Do it!
event0x2724:setParams(points,service,item,value*FISHING_GUILD_POINTS,gpitem,limit,keyitem);
player:startEvent(event0x2724);
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
rank = player:getSkillRank(48);
count = trade:getItemCount();
--print("count: " .. count);
item,hqitem,nqpoints,hqpoints,value = getDailyItem(rank);
limit = player:getVar("dailyGPLimit-Fishing");
points = player:getVar("guildPoints-Fishing");
lasttradeday = player:getVar("lastGuildTrade-Fishing");
timer = os.time();
counter = -1;
while (timer > 1009810800) do
	timer = (timer-86400);
	counter = counter+1;
end
--print("Limit:",limit);
--print("Points:",points);
if (limit < (value*FISHING_GUILD_POINTS) and item) then
	trade:isComplete();
	player:startEvent(Event(0x2729));
	newpoints = count*nqpoints*FISHING_GUILD_POINTS;
	player:setVar("dailyGPLimit-Fishing",limit+newpoints);
	player:setVar("guildPoints-Fishing",points+newpoints);
	player:setVar("lastGuildTrade-Fishing",counter);
elseif (limit < (value*FISHING_GUILD_POINTS) and hqitem) then
	trade:isComplete();
	player:startEvent(Event(0x2729));
	newpoints = count*hqpoints*FISHING_GUILD_POINTS;
	player:setVar("dailyGPLimit-Fishing",limit+newpoints);
	player:setVar("guildPoints-Fishing",points+newpoints);
	player:setVar("lastGuildTrade-Fishing",counter);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
points = player:getVar("guildPoints-Fishing");
--Recieve items.
if (csid == 0x2724) then
	if (player:getFreeSlotCount(0) > 0 and option >= 0) then
		if (option >= 1 and option <= 8 and points >= 200) then
			player:addItem(0x108d+option); --HQ Crystals
			player:setVar("guildPoints-Fishing",points-200);
		elseif (option == 17 and points >= 1500) then
			player:addItem(0x426a); --Robber Rig
			player:setVar("guildPoints-Fishing",points-1500);
		elseif (option == 18 and points >= 10000) then
			player:addItem(0x3c5c); --Fisherman's Belt
			player:setVar("guildPoints-Fishing",points-10000);
		elseif (option == 19 and points >= 70000) then
			player:addItem(0x3773); --Waders
			player:setVar("guildPoints-Fishing",points-70000);
		elseif (option == 20 and points >= 100000) then
			player:addItem(0x3840); --Fisherman's Apron
			player:setVar("guildPoints-Fishing",points-100000);
		elseif (option == 21 and points >= 150000) then
			player:addItem(0xbf); --Fishing Hole Map
			player:setVar("guildPoints-Fishing",points-150000);
		elseif (option == 22 and points >= 200000) then
			player:addItem(0x154); --Fisherman's Signboard
			player:setVar("guildPoints-Fishing",points-200000);
		end
	end
	
	if (option == 32 and points >= 30000) then
		player:addKeyItem(0x7b8); --Frog Fishing
		player:setVar("guildPoints-Fishing",points-30000);
	elseif (option == 33 and points >= 95000) then
		player:addKeyItem(0x7b9); --Serpent Rumors
		player:setVar("guildPoints-Fishing",points-95000);
	elseif (option == 34 and points >= 115000) then
		player:addKeyItem(0x7ba); --Mooching
		player:setVar("guildPoints-Fishing",points-115000);
	elseif (option == -1) then --New contract formation
		--Terminate existing contracts.
		contract = player:getVar("guildContract");
		switch (contract): caseof {
			[0] = function (x) player:setVar("guildPoints-Fishing",0) end,
			[1] = function (x) player:setVar("guildPoints-Woodworking",0) end,
			[2] = function (x) player:setVar("guildPoints-Smithing",0) end,
			[3] = function (x) player:setVar("guildPoints-Goldsmithing",0) end,
			[4] = function (x) player:setVar("guildPoints-Clothcraft",0) end,
			[5] = function (x) player:setVar("guildPoints-Leathercraft",0) end,
			[6] = function (x) player:setVar("guildPoints-Bonecraft",0) end,
			[7] = function (x) player:setVar("guildPoints-Alchemy",0) end,
			[8] = function (x) player:setVar("guildPoints-Cooking",0) end,
		default = function (x) end, }
		player:setVar("guildContract",0);
		player:setVar("fishingGuildContract",1);
	end
end
end;