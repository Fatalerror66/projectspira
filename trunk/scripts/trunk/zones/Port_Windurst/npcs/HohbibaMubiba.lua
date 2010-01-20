-----------------------------------
--	Author: Tenjou
--	Hohbiba-Mubiba
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
player:showText(npc,933);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x4299,47, --Maple Wand
		0x4280,66, --Ash Club
		0x4281,1600, --Chestnut Club
		0x42c0,58, --Ash Staff
		0x42c7,386, --Ash Pole
		0x4040,143}  --Bronze Dagger
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x429a,340, --Willow Wand
		0x4282,4945, --Bone Cudgel
		0x42c1,584, --Holly Staff
		0x42c8,4669} --Holly Pole
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x429b,1440, --Yew Wand
		0x42a3,91, --Bronze Rod
		0x42c2,3642, --Elm Staff
		0x42c9,18422} --Elm Pole

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