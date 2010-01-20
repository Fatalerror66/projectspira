-----------------------------------
--	Author: Tenjou
--	TAVNAZIAN ARCHIPELAGO REGIONAL MERCHANT: Alizabe
--	Only sells when Windurst controls the Tavnazian Archipelago.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
tav = 2; --getRegionOwner(24);
cop = 40; --player:getVar("chainsOfPromathiaMissions");
if (cop >= 40) then
if (tav ~= 2) then 
	player:showText(npc,2971);
else
	player:showText(npc,2970);
--Open shop!!
shop = player:createShop(2);
	--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

	stock1 = {0x5f3,290, --Apple Mint
			0x142c,1945, --Ground Wasabi
			0x426d,99, --Lufaise Fly
			0x144b,233} --Misareaux Parsley
	i = 1;
	while i <= (table.getn(stock1)-1) do
		--print("ITEM: ",stock1[i]);
		shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
		i = i+2;
		if (i >= table.getn(stock1)) then break; end
	end

	player:sendShop(shop);	
end
else
	player:showText(npc,2972);
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