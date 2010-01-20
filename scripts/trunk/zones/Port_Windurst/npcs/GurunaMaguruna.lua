-----------------------------------
--	Author: Tenjou
--	Guruna-Maguruna
--	Standard merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,936);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x331d,972, --Hemp Gorget
		0x3130,2470, --Doublet
		0x3138,216, --Robe
		0x3118,604, --Leather Vest
		0x31b0,1363, --Gloves
		0x31b8,118}  --Cuffs
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x3140,1260, --Tunic
		0x3131,12355, --Cotton Doublet
		0x3198,324, --Leather Gloves
		0x31c0,589, --Mitts
		0x31b1,6696} --Cotton Gloves
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x3322,4201, --Beetle Gorget
		0x3139,2776, --Linen Robe
		0x31b9,1570} --Linen Cuffs

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

player:sendShop(shop); end; 
 

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