-----------------------------------
--	Author: Tenjou
-- 	ELSHIMO LOWLANDS REGIONAL VENDOR: Fomina
-- 	Only sells when Windurst controls Elshimo Lowlands
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
elshimo = 2; --getRegionOwner(18);
if (elshimo ~= 2) then 
	player:showText(npc,2250);
else
	player:showText(npc,2249);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x272,229, --Black Pepper
			0x264,54, --Kazham Peppers
			0x1150,54, --Kazham Pineapple
			0x278,108, --Kukuru Bean
			0x1126,36, --Mithran Tomato
			0x276,86, --Ogre Pumpkin
			0x583,1620} --Phalaenopsis
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