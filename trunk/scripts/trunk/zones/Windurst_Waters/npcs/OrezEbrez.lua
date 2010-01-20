-----------------------------------
--	Author: Tenjou
-- 	Orez-Ebrez
-- 	Standard Merchant.
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2240);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x30b0,1742, --Headgear
		0x30a8,552, --Hachimaki
		0x30d2,1800, --Cotton Headband
		0x30a0,151, --Bronze Cap
		0x30a1,1471} --Brass Cap
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x30b8,144, --Circlet
		0x30b1,8024, --Cotton Headgear
		0x3098,396, --Leather Bandana
		0x30b9,1863, --Poet's Circlet
		0x30d3,14400, --Flax Headband
		0x30a9,3272, --Cotton Hachimaki
		0x30a6,3520, --Bone Mask
		0x30ba,10924} --Wool Hat
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x30b2,20000, --Red Cap
		0x30aa,8972, --Soil Hachimaki
		0x30a7,7026} --Beetle Mask

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