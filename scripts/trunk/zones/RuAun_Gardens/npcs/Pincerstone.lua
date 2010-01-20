-----------------------------------
--	Author: Almendro
-- 	Pincerstone
-- 	NPCs which activates the blue teleports in sky
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
npcid = npc:getId();
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
if( npcid == 17310015 ) then
	if(os.time() <= getGlobalVar("Main-to-Seiryu-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Main-to-Seiryu-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310019 ) then
	if(os.time() <= getGlobalVar("Seiryu-to-Genbu-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Seiryu-to-Genbu-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310023 ) then
	if(os.time() <= getGlobalVar("Genbu-to-Byakko-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Genbu-to-Byakko-BlueTeleport",os.time() + 120);
	end	
elseif(npcid == 17310027 ) then
	if(os.time() <= getGlobalVar("Byakko-to-Suzaku-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Byakko-to-Suzaku-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310031 ) then
	if(os.time() <= getGlobalVar("Suzaku-to-Main-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Suzaku-to-Main-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310033 ) then
	if(os.time() <= getGlobalVar("Main-to-Suzaku-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Main-to-Suzaku-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310029 ) then
	if(os.time() <= getGlobalVar("Suzaku-to-Byakko-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Suzaku-to-Byakko-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310025 ) then
	if(os.time() <= getGlobalVar("Byakko-to-Genbu-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Byakko-to-Genbu-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310021 ) then
	if(os.time() <= getGlobalVar("Genbu-to-Seiryu-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Genbu-to-Seiryu-BlueTeleport",os.time() + 120);
	end
elseif(npcid == 17310017 ) then
	if(os.time() <= getGlobalVar("Seiryu-to-Main-BlueTeleport")) then
		player:specialMessage(1055); -- It is already functioning.
	else
		setGlobalVar("Seiryu-to-Main-BlueTeleport",os.time() + 120);
	end	
end
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
end;