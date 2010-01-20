-----------------------------------
--	Author: Tenjou
--	Graine
--	Standard Merchant
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,590);

--Open shop.
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.
stock1 = {0x3098,457*0.8, --Leather Bandana
		0x30a0,174*0.8, --Bronze Cap
		0x30a1,1700*0.8, --Brass Cap
		0x3118,698*0.8, --Leather Vest
		0x3120,235, --Bronze Harness
		0x3121,2286, --Brass Harness
		0x3198,374*0.8, --Leather Gloves
		0x31a0,128, --Bronze Mittens
		0x31a1,1255, --Brass Mittens
		0x3218,557*0.8, --Leather Trousesrs
		0x3220,191, --Bronze Subligar
		0x3221,1840, --Brass Subligar
		0x3298,349*0.8, --Leather Highboots
		0x32a0,117, --Bronze Leggings
		0x32a1,1140} --Brass Leggings

i = 1;
while i <= (table.getn(stock1)-1) do
	--print("ITEM: ",stock1[i]);
	shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock1)) then break; end
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