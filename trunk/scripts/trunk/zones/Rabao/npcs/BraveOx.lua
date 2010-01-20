-----------------------------------
--	Author: Arcanedemon
-- 	Brave Ox
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
player:showText(npc,421);
shop = player:createShop(4);
stock = {0x122E,77350,
	0x1280,73710,
	0x1304,63700,
	0x12FC,31850,
	0x1270,31850,
	0x128E,546000,
	0x121E,78260,
	0x125D,20092,
	0x125E,62192,
	0x125F,64584,
	0x1260,30967}
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