require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
--------------------------------
-- "Out of One's Shell" Time has passed check
--------------------------------
if(player:getVar("OutofOnesShell") == 2) then
	player:setVar("OutofOnesShell",3);
end
--------------------------------
-- "Forever to Hold" Quest. Zone out check
if(player:getVar("ForevertoHold") == 3)then
	player:setVar("ForevertoHold",0);
end
--------------------------------
-- "Ghosts of the Past" MNK AF1 Quest. Zone out check
if(player:getVar("temp_justDoneMNK_AF1") == 1)then
	player:setVar("temp_justDoneMNK_AF1",0);
end
--------------------------------
-- "Love and Ice" quest . Zone out check
if(player:getVar("temp_justDoneLoveandIce") == 1)then
	player:setVar("temp_justDoneLoveandIce",0); -- Deletes
end
--------------------------------
-- "A Test of True Love" quest . Zone out check
if(player:getVar("temp_ATestofTrueLove") == 1)then
	player:setVar("temp_ATestofTrueLove",2);
end
--------------------------------

player:setAnimation(0);
	cs = -1;
	---Port Bastok start CS---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPost(132,-8.5,-13,179);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
 	   cs = 0x1; 
		player:setPos(132,-8.5,-13,179);
		player:setVar("firstLogin",-1);
		player:setHomePoint();

	end;
	
	return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize(zone)
registerRegion(0xec, 1, -102, -99, -3, -2 , -10, -5 );  -- for CoP 3-1: "The Call of the Wyrmking" CS 
end;

function onRegionEnter(player, regionID)

cop_status = player:getMissionStatus(6,11);            -- mission status for Call of the Wyrmking
wyrm_king_status = player:getVar("CallOfTheWyrmking"); -- tracks fine progress within this mission; 0 means hasn't seen Port Bastok CS yet

--print("CoP/Wyrmking status = ",cop_status,wyrm_king_status);

if (regionID == 1) and (cop_status == 1) and (wyrm_king_status ==0) then
  player:startEvent(Event(0x0131));
end;
end;

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,menuchoice) 
if(csid == 0x1) then		
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end;
--print("CSID ==================",csid);
if (csid == 0x0131) then
  --print("setting mission var");
  player:setVar("CallOfTheWyrmking",1);
end;
end;
