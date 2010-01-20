-----------------------------------
--	Author: ReaperX
-- 	Hajawaa
-- 	Item Storage NPC, Aht Urhgan Whitegate
-----------------------------------

eventid1 = 0x273D;
eventid2 = 0x273E;

require("scripts/globals/settings");
require("scripts/globals/Gearsets");
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
require("scripts/zones/Lower_Jeuno/TextIDs");

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
event = Event(eventid1);
-- event params:
-- parameter 1: a bitmask for the level 21-30 gear. 
-- parameter 2: a bitmask for the level 31-40 gear.
-- parameter 3: a bitmask for the level 41-50 gear.
-- parameter 4: a bitmask for AF gear.
-- parameter 5: the player's gil.
-- parameter 6: a bitmask for relic gear.
-- if any of these is nonzero, the introductory dialog will be suppressed.
param1 = 0;
ttpi = 1;
for i=1,12 do
	if (player:hasKeyItem(ClaimSlips24_30[i]) == 1) then
		param1 = param1 + ttpi;
	end;
	ttpi = ttpi*2;
end
param2 = 0;
ttpi = 1;
for i=1,19 do
	if (player:hasKeyItem(ClaimSlips31_40[i]) == 1) then
		param2 = param2 + ttpi;
	end;
	ttpi = ttpi*2;
end
param3 = 0;
ttpi = 1;
for i=1,14 do
	if (player:hasKeyItem(ClaimSlips41_50[i]) == 1) then
		param3 = param3 + ttpi;
	end;
	ttpi = ttpi*2;
end
param4 = 0;
ttpi = 1;
for i=1,24 do
	if (player:hasKeyItem(ClaimSlipsAF[i]) == 1) then
		param4 = param4 + ttpi;
	end;
	ttpi = ttpi*2;
end
param6 = 0;
ttpi = 1;
for i=1,20 do
	if (player:hasKeyItem(ClaimSlipsRelic[i]) == 1) then
		param6 = param6 + ttpi;
	end;
	ttpi = ttpi*2;
end
event:setParams(param1,param2,param3,param4,player:getCurrGil(),param6);
player:startEvent(event);
end; 
 
function onEventSelection(player,csid,option) 
	--print("-->",csid, option);
	if (csid == eventid1) then
		items = getArmorSetByOption(option);
		player:updateEvent(items[1], items[2], items[3], items[4], items[5], items[6]);
	end;
end;

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
matchfound = nil;
i = 0;
while (i <= 89) and not(matchfound) do
	i = i + 1;
	items = getArmorSetByOption(i);
	itemsinset = 0;
	for i=1,5 do
		if items[i] > 0 then
			itemsinset = itemsinset + 1;
		end;
	end;
	if (itemsinset == trade:getItemCount()) then
		k = 1;
		maybematch = true;
		while (k <= 5) and maybematch do
			if (items[k]~=0) then
				maybematch = trade:hasItemQty(items[k],1);
			end;
			k = k + 1;
		end;
		matchfound = maybematch;
	end
end;
if matchfound then
	player:addKeyItem(items[7]);
	event = Event(eventid2);
	event:setParams(0,0,0,0,0,items[6]);
	trade:isComplete();
	player:startEvent(event);
end;
end; 
   
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
--print("CSID:",csid);
--print("RESULT:",option);
if (csid == eventid1) and (option ~= 1073741824) then
	items = getArmorSetByOption(option);
	itemsinset = 0;
	for i=1,5 do
		--print("items[",i,"] = ",items[i]);
		if items[i] > 0 then
			itemsinset = itemsinset + 1;
		end;
	end;
	free = player:getFreeSlotCount(0)
	free = player:getFreeSlotCount(0)
	if (free >= itemsinset) and (itemsinset > 0) then
		for i=1,5 do
			if items[i] > 0 then
				player:addItem(items[i]);
				player:specialMessage(ITEM_OBTAINED, items[i]);
			end;
		end;
		player:removeGil(items[6]);
		player:removeKeyItem(items[7]);
		player:specialMessage(KEYITEM_OBTAINED+1, items[7]);
	else 
		--print("not enough inventory space.");
	end;
elseif (csid == eventid2) then
	items = getArmorSetByOption(i);
	player:specialMessage(KEYITEM_OBTAINED, items[7]);
end;
end;