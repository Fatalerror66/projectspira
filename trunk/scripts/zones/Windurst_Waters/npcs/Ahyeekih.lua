-----------------------------------
--	Author: Tenjou
-- 	KOLSHUSHU REGIONAL VENDOR: Ayeekih
-- 	Only sells when Windurst controls Kolshushu.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
kolshu = 2; --getRegionOwner(10);
if (kolshu ~= 2) then 
	player:showText(npc,2248);
else
	player:showText(npc,2247);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x1197,184, --Buburimu Grape
			0x460,1620, --Casablanca
			0x1107,220, --Dhalmel Meat
			0x266,72, --Mhaura Garlic
			0x115d,40} --Yagudo Cherry
	i = 1;
	while i <= (table.getn(stock1)-1) do
		--print("ITEM: ",stock1[i]);
		shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
		i = i+2;
		if (i >= table.getn(stock1)) then break; end
	end

	player:sendShop(shop);	
end
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