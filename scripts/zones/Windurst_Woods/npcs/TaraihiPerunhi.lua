-----------------------------------
--	Author: Tenjou
-- 	DERFLAND REGIONAL VENDOR: Taraihi-Perunhi
-- 	Only sells when Windurst controls Derfland.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
derfland = 2; --getRegionOwner(8);
if (derfland ~= 2) then 
	player:showText(npc,1802);
else
	player:showText(npc,1801);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x1100,128, --Derfland Pear
			0x269,139, --Ginger
			0x11c1,62, --Gysahl Greens
			0x584,1656, --Olive Flower
			0x279,14, --Olive Oil
			0x3b7,108} --Wijnruit
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