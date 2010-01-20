-----------------------------------
--	Author: Tenjou
-- 	ARAGONEU REGIONAL VENDOR: Maqu Molpih
-- 	Only sells when Windurst controls Aragoneu.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
aragon = 2; --getRegionOwner(11);
if (aragon ~= 2) then 
	player:showText(npc,2244);
else
	player:showText(npc,2243);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x277,36, --Horo Flour
			0x275,44, --Millioncorn
			0x113f,114, --Roasted Corn
			0x349,36, --Yagudo Feather
			0x1199,92} --Sunflower Seeds
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