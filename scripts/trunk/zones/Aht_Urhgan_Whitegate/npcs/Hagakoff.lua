-----------------------------------
--	Author: Arcanedemon
-- 	Hagakoff
-- 	Standard Merchant - Needs Astral Can. status check
-----------------------------------
require("scripts/globals/settings");
Astral = 0; -- Need to check status of Astral Can.

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,5700);
shop = player:createShop(9);
stock = {0x4281,1740,
	0x4112,124305,
	0x4141,4550,
	0x400f,15488,
	0x4023,45760,
	0x40A9,38800,
	0x4753,238,
	0x4280,72,
	0x4040,156,
	0x4180,344,
	0x4140,672,
	0x4042,2030,
	0x4010,67760,
	0x40A7,776,
	0x40A8,4525,
	0x4111,66000,
	0x4182,12540}
if (Astral == 0) then
	i = 1;
else
	i = 13;
end
while i <= (table.getn(stock)-1) do
	shop:addItem(stock[i],stock[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock)) then 
		break; 
	end
end
player:sendShop(shop);
end; 

-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;