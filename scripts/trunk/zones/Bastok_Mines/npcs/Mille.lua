-----------------------------------
--	Author: Caspain
-- 	Norvallen Regional Shop: Mille
-- 	Only sells when Bastok controlls Norvallen
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
Norvallen = 1; --getRegionOwner(10);
if (Norvallen ~= 1) then 
	player:showText(npc,901); --Bastok not in control
else
	player:showText(npc,994); --Bastok in control

	shop = player:createShop(2); --Open shop!!
		--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

		stock1 = {0x2B0,18, --Arrowwood Log
				0x2BA,87, --Ash Log
				0x26A,25, --Blue Peas
				0x265,25} --Crying Mustard
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