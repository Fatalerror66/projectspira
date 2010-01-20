-----------------------------------
--	Author: ChrisKara10
--  Matthias	
--  It's the NPC that handle the Dancer AF	
--	INCOMPLETE Needs to start the quest in UPPER JEUNO!!!
-----------------------------------
-- Includes


-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcname = npc:getName();
npcid = npc:getId();
bf = player:getFame(1);
nation = player:getNation();
char = player:getId();
zone = player:getZone();
lvl = player:getMainLvl();
job = player:getMainJob();

--print("Name:",npcname);
--print("NPC ID:",npcid);
--print("Bastok Fame",bf);

-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
--danceraf = player:getVar("dancerArtifactArmor");

	player:startEvent(Event(0x1F3));
end; 
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
--DELETE THE BELOW IF UNUSED--
for i=1,table.getn(arg) do
end 
npc = arg[1];
player= arg[2];
---EIGHT TRADE SLOTS--
item1,quantity1 = player:getItemInfo(arg[3]);
item2,quantity2 = player:getItemInfo(arg[5]);
item3,quantity3 = player:getItemInfo(arg[7]);
item4,quantity4 = player:getItemInfo(arg[9]);
item5,quantity5 = player:getItemInfo(arg[11]);
item3,quantity6 = player:getItemInfo(arg[13]);
item4,quantity7 = player:getItemInfo(arg[15]);
item5,quantity8 = player:getItemInfo(arg[17]);

	if arg[3] == 0 then
	giltraded = arg[4]
	else
	giltraded = 0
	end;
npcname = npc:getName();
npcid = npc:getId();
bf = player:getFame(1);
nation = player:getNation();
char = player:getId();
zone = player:getZone();
lvl = player:getMainLvl();
job = player:getMainJob();

--print("Name:",npcname);
--print("NPC ID:",npcid);
--print("Bastok Fame",bf);
--print("Item1 ID: ",item1,"\n Quantity: ",quantity1);
--print("Item2 ID: ",item2,"\n Quantity: ",quantity2);
--print("Item3 ID: ",item3,"\n Quantity: ",quantity3);
--print("Item4 ID: ",item4,"\n Quantity: ",quantity4);
--print("Item5 ID: ",item5,"\n Quantity: ",quantity5);

end; 