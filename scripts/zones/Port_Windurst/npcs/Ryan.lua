-----------------------------------
--	Author: Tenjou
--	Ryan
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
player:showText(npc,1930);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x4100,290, --Bronze Axe
		0x4097,246, --Bronze Sword
		0x43b8,5, --Crossbow Bolt
		0x3120,235, --Bronze Harness
		0x3121,2286, --Brass Harness
		0x31a0,128, --Bronze Mittens
		0x31a1,1255, --Brass Mittens
		0x3220,191, --Bronze Subligar
		0x3221,1840, --Brass Subligar
		0x32a0,117, --Bronze Leggings
		0x32a1,1140, --Brass Leggings
		0x3128,1145, --Kenpogi
		0x31a8,630, --Tekko
		0x3228,915, --Sitabaki
		0x32a8,584}  --Kyahan
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {} 
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {} 


i = 1;
while i <= (table.getn(stock1)-1) do
	--print("ITEM: ",stock1[i]);
	shop:addItem(stock1[i],stock1[i+1]*SHOP_PRICE);
	i = i+2;
	if (i >= table.getn(stock1)) then break; end
end

j = 1;
while j <= (table.getn(stock2)-1) do
	--print("ITEM: ",stock2[j]);
	shop:addItem(stock2[j],stock2[j+1]*SHOP_PRICE);
	j = j+2;
	if (j >= table.getn(stock2)) then break; end
end

if (player:getNation() == 2) then
k = 1;
while k <= (table.getn(stock3)-1) do
	--print("ITEM: ",stock3[k]);
	shop:addItem(stock3[k],stock3[k+1]*SHOP_PRICE);
	k = k+2;
	if (k >= table.getn(stock3)) then break; end
end
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