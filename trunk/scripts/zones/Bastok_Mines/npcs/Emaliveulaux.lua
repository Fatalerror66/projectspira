-----------------------------------
--	Author: Caspian
--  Tavnazian Archipelago Regional Shop: Emaliveulaux
-- 	Only sells when Bastok controlls Tavnazian Archipelago, dialouge does not work with current db.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
	npcname = npc:getName();
	npcid = npc:getId();
	--print("Name:",npcname);
	--print("NPC ID:",npcid);
	-----------------------------------
	-- Dialogues,cutscenes,etc. go below.
	-----------------------------------
	Tavnazian_Archipelago = 1; --getRegionOwner(24);
	if (Tavnazian_Archipelago ~= 1) then 
		player:showText(npc,2294);
	else
		player:showText(npc,2293);
		
		shop = player:createShop(2);--Open shop!!
		--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

		stock1 = {0x5F3,290, --Apple Mint
				0x142C,1945, --Ground Wasabi
				0x426D,99, --Lufaise Fly
				0x144B,223} --Misareaux Parsley
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