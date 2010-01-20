-----------------------------------
--	Author: Tenjou
-- 	MOVALPOLOS REGIONAL VENDOR: Prestapiq
-- 	Only sells when Windurst controls Movalpolos.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
moval = 2; --getRegionOwner(22);
if (moval ~= 2) then 
	player:showText(npc,3965);
else
	player:showText(npc,3966);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x280,11, --Copper Ore
			0x1162,694, --Coral Fungus
			0x1117,4032, --Danceshroom
			0x672,6500, --Kopparnickel Ore
			0x142d,736} --Movalpolos Water
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