-----------------------------------
--	Author: Arcanedemon
-- 	Waylea
-- 	Fame Checker
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
Sandy = player:getFame(0);
Bastok = player:getFame(1);
Fame = math.floor((Bastok + Sandy) / 2);
FameLvl = {0x0039,0,
	 0x003A,200,
	 0x003B,500,
	 0x003C,900,
	 0x003D,1300,
	 0x003E,1700,
	 0x003F,1952,
	 0x0040,2200,
	 0x0041,2450}

i = 1;
while i <= 18 do
	if (Fame >= FameLvl[i+1]) then
		FameScene = FameLvl[i];
	end
	i = i+2;
end

player:startEvent(Event(FameScene));

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