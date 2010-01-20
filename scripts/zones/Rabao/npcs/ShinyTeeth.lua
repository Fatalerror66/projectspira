-----------------------------------
--	Author: Arcanedemon
-- 	ShinyTeeth
-- 	Standard Merchant
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,419);
shop = player:createShop(4);
stock = {0x4042,1867,
	0x404C,11128,
	0x4052,2231,
	0x40A8,4163,
	0x40A9,35308,
	0x40AE,62560,
	0x42A4,2700,
	0x4011,103803,
	0x4303,23887,
	0x4392,294,
	0x43A8,7,
	0x43BC,92,
	0x43A3,5460,
	0x4384,8996}
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
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
end;