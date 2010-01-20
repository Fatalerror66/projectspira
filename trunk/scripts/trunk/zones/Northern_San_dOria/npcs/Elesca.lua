-----------------------------------
--	Author: Arcanedemon + Mana
--	Elesca
--	Map Vendor
-----------------------------------
-- OnTrade Action
-----------------------------------
 
function onTrade(player,npc,trade)
-- DO NOT DELETE !!!
-- All sandy NPCs not directly related to "Flyers for Regine" quest must have this conditional trade script.
-- it is just a conditional line to say the NPC refused to accept the flyer.
	if trade:hasItemQty(532,1) == true and player:getQuestStatus(0,16) == 1 then
		player:specialMessage(1767)
	end

end;
 
-- To use in other zones change the GetMap eventID to the appropriate
-- value. Change the Maps array to appropriate values
-- Maps = {MapID,Filter,OptionResult,Cost}
-----------------------------------
require("scripts/globals/settings");
GetMap = 0x0237;
NoGil = 297;
Maps = 	{0x0181,0x04,385,200,
	0x0182,0x08,386,200,
	0x0183,0x10,387,200,
	0x0184,0x20,388,600,
	0x018D,0x40,397,600,
	0x0194,0x80,404,600,
	0x0195,0x100,405,3000,
	0x01AD,0x200,429,3000};

-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)

Filter = 0x00;
i = 1;
while i <= (table.getn(Maps)) do
	CheckMap = player:hasKeyItem(Maps[i]);
	if (CheckMap == 1) then
		Filter = Filter + Maps[i+1];
	end
	i = i+4;
end

local eventGetMap = Event(GetMap);
eventGetMap:setParams(Filter);
player:startEvent(eventGetMap);

end; 
  
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
npc = player:getTarget();
CurrGil = player:getCurrGil();
if (csid == GetMap) then
	i = 1;
	while i <= (table.getn(Maps)) do
		if (option == Maps[i+2]) then
			if (CurrGil >= Maps[i+3]) then
				player:addKeyItem(Maps[i]);
				player:removeGil(Maps[i+3]);
			else
				player:showText(npc,NoGil);
			end
		end
		i = i+4;
	end
end
end;