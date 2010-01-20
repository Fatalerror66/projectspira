-----------------------------------
--	Author: Arcanedemon
-- 	Repat
-- 	Lucky Roll NPC
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Norg/TextIDs"] = nil;
require("scripts/zones/Norg/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
math.randomseed(os.time());
Roll = math.random(1,6);
Roll = math.random(1,6);
Roll = math.random(1,6);
TempRunTotal = Roll + RunTotal;
-----------------------------------
--	onTrigger	--
-----------------------------------
function onTrigger(player,npc)
local LuckyRoll = Event(0x00AE);
NoPlay = 0;

-----------------------------------
--	Game Reset
-----------------------------------
if (getVanaDay() ~= GameDay or getVanaMonth() ~= GameMon or getVanaYear() ~= GameYear) then
	GameDay = getVanaDay();
	GameMon = getVanaMonth();
	GameYear = getVanaYear();
	RunTotal = 0;
	CloseGame = 0;
	Winner = nil;
	Bonus = 0;
	BonusPrize = nil;
	Disallow = {};
end

-----------------------------------
--	Award Bonus
-----------------------------------
if (Winner == player:getName()) then
	LuckyRoll:setParams(player:getCurrGil(),CloseGame,Bonus,TempRunTotal);
	player:startEvent(LuckyRoll);
	player:addItem(BonusPrize);
	Winner = nil;
	NoPlay = 1;
end


-----------------------------------
--	Check if Player is disallowed
-----------------------------------
i = 1;
while i <= (table.getn(Disallow)) do
	if (Disallow[i] == player:getName() and NoPlay == 0) then
		LuckyRoll:setParams(player:getCurrGil(),1,0,0);
		player:startEvent(LuckyRoll);
		NoPlay = 1;
		break;
	end
	i = i + 1;
end

-----------------------------------
--	Play if allowed
-----------------------------------
if (NoPlay == 0) then
	if (TempRunTotal >= 400 and CloseGame == 0) then
		player:addGil(GIL_RATE*10000);
		player:specialMessage(GIL_OBTAINED,GIL_RATE*10000);
		Prize = {0x1008,0x1009,0x100A,0x100B,0x100C,0x100D,0x100E,0x100F,
			0x0301,0x0302,0x0303,0x0304,0x0305,0x0306,0x0308,0x0307};
		if (TempRunTotal == 400) then
			Bonus = 1;
			BonusPrize = Prize[getVanaDayElement()+1];
			Winner = player:getName();
		elseif (TempRunTotal == 401 or TempRunTotal == 402) then
			Bonus = 9;
			BonusPrize = Prize[getVanaDayElement()+9];
			Winner = player:getName();
		end
		LuckyRoll:setParams(player:getCurrGil(),0,0,TempRunTotal);
		player:startEvent(LuckyRoll);
		CloseGame = 1;
	else
		LuckyRoll:setParams(player:getCurrGil(),CloseGame,0,TempRunTotal);
		player:startEvent(LuckyRoll);
	end
end
end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
NoPlay = 0;
i = 1;
while i <= (table.getn(Disallow)) do
	if (Disallow[i] == player:getName()) then
		NoPlay = 1;
		break;
	end
	i = i + 1;
end
if (option == 0 and NoPlay == 0) then
	table.insert(Disallow,player:getName());
	player:removeGil(100);
	RunTotal = TempRunTotal;
end
end;