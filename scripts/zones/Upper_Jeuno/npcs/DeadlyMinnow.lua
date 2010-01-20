-----------------------------------
--	Author: Arcanedemon, ReaperX
-- 	Deadly Minnow
-- 	Standard Merchant, gives hint for AF hands quests
-----------------------------------
require("scripts/globals/settings");

OldGauntlets = 0xD2;

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
if (player:getQuestStatus(3, 44) == 1) or
	(player:getQuestStatus(3, 45) == 1) or
	(player:getQuestStatus(3, 46) == 1) or
	(player:getQuestStatus(3, 47) == 1) or
	(player:getQuestStatus(3, 48) == 1) or
	(player:getQuestStatus(3, 49) == 1) or
	(player:getQuestStatus(3, 50) == 1) or
	(player:getQuestStatus(3, 51) == 1) or
	(player:getQuestStatus(3, 52) == 1) or
	(player:getQuestStatus(3, 53) == 1) or
	(player:getQuestStatus(3, 54) == 1) or
	(player:getQuestStatus(3, 55) == 1) or
	(player:getQuestStatus(3, 56) == 1) or
	(player:getQuestStatus(3, 57) == 1) or
	(player:getQuestStatus(3, 58) == 1) then
		if (player:hasKeyItem(OldGauntlets) == 1) and (player:getVar("BORGHERTZ_QUEST") == 1) then
			player:setVar("BORGHERTZ_QUEST",2);
			player:startEvent(Event(0x18)); -- tells you about a Mithra.
		elseif (player:getVar("BORGHERTZ_QUEST") == 0) then
			player:startEvent(Event(0x56)); -- Much is told about Borghertz, but it's all just a legend. Don't let it cloud your judgment.
		else
			player:startEvent(Event(0xBB));
		end;
else
	player:startEvent(Event(0xBB));
end;
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
if (csid == 0xBB) then
shop = player:createShop(5);
stock = {0x3089,22800,
	0x308A,47025,
	0x309A,13179,
	0x3109,35200,
	0x310A,66792,
	0x311A,20976,
	0x3180,23846,
	0x3189,18800,
	0x318A,35673,
	0x319A,11012};
i = 1;
while i <= (table.getn(stock)-1) do
	shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock)) then 
		break; 
	end
end
player:sendShop(shop);
end;
end;