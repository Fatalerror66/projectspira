-----------------------------------
--	Author: Arcanedemon + Tenjou
-- 	Mhoji Roccoruh
-- 	Map Vendor
-----------------------------------
-----------------------------------
-- To use in other zones change the GetMap eventID to the appropriate
-- value. Change the Maps array to appropriate values
-- Maps = {MapID,Filter,OptionResult,Cost}
-----------------------------------
require("scripts/globals/settings");
GetMap = 0x2710;
NoGil = 1533;
Maps = 	{0x0181,0x04,385,200,
	0x0182,0x08,386,200,
	0x0183,0x10,387,200,
	0x0184,0x20,388,600,
	0x018F,0x100,399,600,
	0x0198,0x40,408,600,
	0x0199,0x80,409,3000};

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