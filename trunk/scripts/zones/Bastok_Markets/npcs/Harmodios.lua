-----------------------------------
--	Author: Arcanedemon & Almendro
-- 	Harmodios
-- 	Standard Merchant & "Lure of the Wildcat (Bastok)"
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
function testflag(set,flag)
	return (set % (2*flag) >= flag)
end
 BlueSentinelBadge = player:hasKeyItem(0x2E8);
local wildcatcount = player:getVar("lureOfTheWildcat-B-Counter");
    local wildcatc = testflag(tonumber(wildcatcount),0x00400);
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "Lure of the Wildcat (Bastok)"
if(BlueSentinelBadge == 1 and wildcatc == false)then
	player:setVar("lureOfTheWildcat-B-Counter",wildcatcount+0x00400);
	player:startEvent(Event(0x1AE));
else
player:showText(npc,994);
conquest = 1; -- Need Conquest Check
nation = player:getNation();
shop = player:createShop(1);
stock = {0x43C3,990,1,
	0x43C0,219,2,
	0x43C9,43,2,
	0x13B1,69120,2,
	0x13B2,66240,2,
	0x13B3,63360,2,
	0x13B4,56700,2,
	0x13AF,79560,2,
	0x13B0,76500,2,
	0x43C7,4644,3,
	0x43C1,43,3,
	0x13B5,54000,3}

i = 1;
while i <= (table.getn(stock)-1) do
	if (stock[i+2] == 1) then
		if (nation == 1 and conquest == 1) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	elseif (stock[i+2] == 2) then
		if (conquest <= 2) then
			shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
		end
	else
		shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	end
	i = i+3;
	if (i >= table.getn(stock)) then 
		break; 
	end
end
player:sendShop(shop);
end
end;
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;