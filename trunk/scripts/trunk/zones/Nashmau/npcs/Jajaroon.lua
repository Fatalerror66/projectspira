-----------------------------------
--	Author: Arcanedemon
-- 	Jajaroon
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,897);
shop = player:createShop(9);
stock = {0x0880,48,
	0x0881,48,
	0x0882,48,
	0x0883,48,
	0x0884,48,
	0x0885,48,
	0x0886,48,
	0x0887,48,
	0x1570,35200,
	0x1571,600,
	0x1572,82500,
	0x1573,40000,
	0x1574,3525,
	0x1575,316,
	0x1576,9216}
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
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
end;