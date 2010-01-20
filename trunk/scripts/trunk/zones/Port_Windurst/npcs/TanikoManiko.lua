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
player:showText(npc,934);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x4102,4198, --Bone Axe
		0x4180,309, --Bronze Zaghnal
		0x41c0,97, --Harpoon
		0x4300,39, --Shortbow
		0x43a7,4}  --Bone Arrow
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x4015,104, --Cat Baghnakhs
		0x4001,129, --Cesti
		0x4109,5864, --Bone Pick
		0x4301,482, --Self Bow
		0x43a6,3, --Wooden Arrow
		0x439c,54, --Hawkeye
		0x4380,1575} --Boomerang
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x4181,2542, --Brass Zaghnal
		0x4302,7128, --Wrapped Bow
		0x43ab,162, --Ice Arrow
		0x43ac,162} --Lightning Arrow

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