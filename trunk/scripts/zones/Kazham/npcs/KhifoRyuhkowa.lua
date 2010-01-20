-----------------------------------
--	Author: Arcanedemon
-- 	Khifo Ryuhkowa
-- 	Standard Merchant
-----------------------------------
require("scripts/globals/settings");

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
player:showText(npc,461);
shop = player:createShop(2);
stock = {0x430B,39744,
	0x4282,4945,
	0x4380,1610,
	0x41C1,809,
	0x4281,1600,
	0x429C,5255,
	0x439C,55,
	0x4059,5713,
	0x42CB,99176,
	0x42C4,29752,
	0x41C7,75541,
	0x40D3,153014,
	0x41C3,16228,
	0x43A6,3}
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