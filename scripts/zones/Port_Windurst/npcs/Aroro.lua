-----------------------------------
--	Author: Tenjou
--	Aroro
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
player:showText(npc,930);

--Open shop!!
shop = player:createShop(2);
--Total stock cuts off after 16 items.  If you add more than that the extras won't display.

--Stock1 is regular stock, available to all.
stock1 = {0x129f,62, --Stone
		0x12a9,143, --Water
		0x129a,331, --Aero
		0x1290,855, --Fire
		0x1295,1619, --Blizzard
		0x12a4,3334, --Thunder
		0x12eb,4747, --Burn
		0x12ec,3770, --Frost
		0x12ed,2300, --Choke
		0x12ee,1867, --Rasp
		0x12ef,1393, --Shock
		0x12f0,6508}  --Drown
--Stock2 has some restrictions, in this case Windurst 2nd in conquest.
stock2 = {0x12dc,84, --Poison
		0x12e6,368, --Bio
		0x12fd,2300} --Sleep 
--Stock3 has the most restrictions, in this case Windurst in first and Windurstians only.
stock3 = {0x12fe,114} --Blind

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