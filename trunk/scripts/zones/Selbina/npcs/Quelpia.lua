-----------------------------------
--	Author: Arcanedemon
-- 	Quelpia
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
player:showText(npc,542);
shop = player:createShop(4);
stock = {0x1202,585,
	0x1203,3261,
	0x1208,10080,
	0x120C,5178,
	0x1215,31500,
	0x1218,10080,
	0x121D,8100,
	0x122C,6366,
	0x1230,15840,
	0x1239,18000,
	0x1264,4644,
	0x1265,3688,
	0x1266,2250,
	0x1267,1827,
	0x1268,1363,
	0x1269,6366}
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