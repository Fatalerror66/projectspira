-----------------------------------
--	Author: Tenjou
-- 	GUSTABERG REGIONAL MERCHANT: Nya Labbicio
-- 	Only sells when Windurst controls Gustaberg.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
gustaberg = 2; --getRegionOwner(7);
if (gustaberg ~= 2) then 
	player:showText(npc,1798);
else
	player:showText(npc,1797);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x454,703, --Sulfur
			0x26b,43, --Popoto
			0x263,36, --Rye Flour
			0x1124,40} --Eggplant
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