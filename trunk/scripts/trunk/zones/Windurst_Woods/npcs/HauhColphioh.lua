-----------------------------------
--	Author: Tenjou
--	GUILDWORKER'S UNION REPRESENTATIVE: Hauh Colphioh
--	Takes guild items and gives guild points.  Sells crafting items and keyitems for guild points.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/clothcraftguild");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local event0x2728 = Event(0x2728);
--ARGUMENT 1: Player's accumulated clothcraft guild points.
--ARGUMENT 2: Contracted guild.
--ARGUMENT 3: Today's Item
--ARGUMENT 4: Limit on guild points today.
--ARGUMENT 5: Which guild point items the player is eligible for.
--ARGUMENT 6: Amount of guild points the player has earned today.
--ARGUMENT 7: Which keyitems the player is eligible for.

--Pull relevant stats.
rank = player:getSkillRank(56);
lvl = player:getSkill(56);
points = player:getVar("guildPoints-Clothcraft");

--Check if the player has another guild contract.
service = 0;
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
if (DISABLE_GUILD_CONTRACTS == 1) then service = 4; end

--Get today's item, HQ item, and guild point limit.
item,hqitem,nqpoints,hqpoints,value = getDailyItem(rank);
--print("Today's Item:",item);
--print("Value of Item:",nqpoints*CLOTHCRAFT_GUILD_POINTS);
--print("Today's HQ Item:",hqitem);
--print("Value of HQ Item:",hqpoints*CLOTHCRAFT_GUILD_POINTS);
--print("Total guild points today:",value*CLOTHCRAFT_GUILD_POINTS);

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
lasttradeday = player:getVar("lastGuildTrade-Clothcraft");
if (lasttradeday ~= counter) then
	player:setVar("dailyGPLimit-Clothcraft",0);
end
limit = player:getVar("dailyGPLimit-Clothcraft");

--Determine what key items the player doesn't yet have.
spinning = player:hasKeyItem(0x7da);
fletching = player:hasKeyItem(0x7db);
purification = player:hasKeyItem(0x7d8);
ensorcellment = player:hasKeyItem(0x7d9);
keyitem = 0;
if (spinning == 0) then keyitem = keyitem+4; end
if (fletching == 0) then keyitem = keyitem+8; end
if (purification == 0) then keyitem = keyitem+1; end
if (ensorcellment == 0) then keyitem = keyitem+2; end

--Do it!
event0x2728:setParams(points,service,item,value*CLOTHCRAFT_GUILD_POINTS,gpitem,limit,keyitem);
player:startEvent(event0x2728);
end; 


-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
rank = player:getSkillRank(56);
count = trade:getItemCount();
--print("count: " .. count);
item,hqitem,nqpoints,hqpoints,value = getDailyItem(rank);
limit = player:getVar("dailyGPLimit-Clothcraft");
points = player:getVar("guildPoints-Clothcraft");
lasttradeday = player:getVar("lastGuildTrade-Clothcraft");
timer = os.time();
counter = -1;
while (timer > 1009810800) do
	timer = (timer-86400);
	counter = counter+1;
end
--print("Limit:",limit);
--print("Points:",points);
if (limit < (value*CLOTHCRAFT_GUILD_POINTS) and item) then
	trade:isComplete();
	player:startEvent(Event(0x2729));
	newpoints = count*nqpoints*CLOTHCRAFT_GUILD_POINTS;
	player:setVar("dailyGPLimit-Clothcraft",limit+newpoints);
	player:setVar("guildPoints-Clothcraft",points+newpoints);
	player:setVar("lastGuildTrade-Clothcraft",counter);
elseif (limit < (value*CLOTHCRAFT_GUILD_POINTS) and hqitem) then
	trade:isComplete();
	player:startEvent(Event(0x2729));
	newpoints = count*hqpoints*CLOTHCRAFT_GUILD_POINTS;
	player:setVar("dailyGPLimit-Clothcraft",limit+newpoints);
	player:setVar("guildPoints-Clothcraft",points+newpoints);
	player:setVar("lastGuildTrade-Clothcraft",counter);
end
end;  
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
points = player:getVar("guildPoints-Clothcraft");
--Recieve items.
if (csid == 0x2728) then
	if (player:getFreeSlotCount(0) > 0 and option >= 0) then
		if (option >= 1 and option <= 8 and points >= 200) then
			player:addItem(0x108d+option); --HQ Crystals
			player:setVar("guildPoints-Clothcraft",points-200);
		elseif (option == 18 and points >= 10000) then
			player:addItem(0x3c57); --Weaver's Belt
			player:setVar("guildPoints-Clothcraft",points-10000);
		elseif (option == 19 and points >= 70000) then
			player:addItem(0x367a); --Magnifying Spectacles
			player:setVar("guildPoints-Clothcraft",points-70000);
		elseif (option == 20 and points >= 100000) then
			player:addItem(0x383b); --Weaver's Apron
			player:setVar("guildPoints-Clothcraft",points-100000);
		elseif (option == 21 and points >= 150000) then
			player:addItem(0xc6); --Gilt Tapestry
			player:setVar("guildPoints-Clothcraft",points-150000);
		elseif (option == 22 and points >= 200000) then
			player:addItem(0x151); --Weaver's Signboard
			player:setVar("guildPoints-Clothcraft",points-200000);
		elseif (option == 23 and points >= 80000) then
			player:addItem(0x3dce); --Tailor's Ring
			player:setVar("guildPoints-Clothcraft",points-80000);
		end
	end
		
	if (option >= 32 and option <= 33 and points >= 40000) then
		player:addKeyItem(0x7b8+option); --Cloth Purification/Ensorcellment
		player:setVar("guildPoints-Clothcraft",points-40000);
	elseif (option >= 34 and option <= 35 and points >= 10000) then
		player:addKeyItem(0x7b8+option); --Spinning/Fletching
		player:setVar("guildPoints-Clothcraft",points-10000);
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
		player:setVar("guildContract",4);
	end
end
end;