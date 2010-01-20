-----------------------------------
--	Author: Tenjou
-- 	Upih Khachla
-- 	Working!
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
player:showText(npc,2236);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x1034,290, --Antidote
		0x764,3960, --Desalinator
		0x26e,44, --Dried Marjoram
		0x1036,2387, --Eye Drops
		0x3ff,5520, --Living Key (normally only sells for Windurst 3rd in conquest only)
		0x25d,180, --Pickaxe
		0x765,3960, --Salinator
		0x3fc,276, --Sickle
		0x4d9,354}  --Twinkle Powder
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x27c,119, --Chamomile
		0x1037,736, --Echo Drops
		0x1020,4445, --Ether
		0x3fe,3643} --Thief's Tools
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x43a1,1107, --Grenade
		0x1010,837, --Potion
		0x3b7,108} --Wijnruit

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