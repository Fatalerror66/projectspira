-----------------------------------
--	Author: Arcanedemon
-- 	Kahah Hobichai
-- 	Standard Merchant - Needs Astral Can. status check
-----------------------------------
require("scripts/globals/settings");
Astral = 0; -- Need to check status of Astral Can.

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,1061);
shop = player:createShop(9);
stock = {0x025D,200,
	0x03FC,300,
	0x03FD,500,
	0x4051,164,
	0x4052,2425,
	0x005A,200}
if (Astral == 0) then
	i = 1;
else
	i = 7;
end
while i <= (table.getn(stock)-1) do
	shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock)) then 
		break; 
	end
end
player:sendShop(shop);

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;