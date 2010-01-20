-----------------------------------
--	Author: Almendro
-- 	HideFlap.lua
-- 	Involved in the quest "The First Meeting" http://wiki.ffxiclopedia.org/wiki/The_First_Meeting
-----------------------------------
-- Includes
require("scripts/globals/settings");
package.loaded["scripts/zones/Davoi/TextIDs"] = nil;
require("scripts/zones/Davoi/TextIDs");
-----------------------------------
-- Initialization
SandOrianMartialArtsScroll = 0xC0;
SwordGripMaterial = 0xD0;
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
-- "The First Meeting"
if( player:getXPos() < -47)then
	player:startEvent(Event(0x6F));
-----------------------------------
else
	player:startEvent(Event(0x6E));
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
if(csid == 0x6F and option == 0)then
	if( player:getVar("temp_TheFirstMeeting") == 2 ) then
		local lastTimeKilledPlusTimeToGetCredit = getGlobalVar("[NM_Dead]Bilopdop_and_Deloknok");
		local bothOrOneIsPoped = getGlobalVar("[NM_poped]Bilopdop_and_Deloknok");
		if(player:hasKeyItem(SandOrianMartialArtsScroll) == 0 and getGlobalVar("[NM_poped]Bilopdop_and_Deloknok") == player:getId() and os.time() <= lastTimeKilledPlusTimeToGetCredit) then
			player:addKeyItem(SandOrianMartialArtsScroll);
			player:specialMessage(KEYITEM_OBTAINED,SandOrianMartialArtsScroll);
			player:setVar("temp_TheFirstMeeting",3);
		else
			if(os.time() > lastTimeKilledPlusTimeToGetCredit and bothOrOneIsPoped == 0)then
				zone = Zone(player:getZone());
				zone:spawnMob("Bilopdop",player:getXPos()-1,player:getYPos(),player:getZPos()-1,player:getRot(),player:getId());
				zone:spawnMob("Deloknok",player:getXPos() + 1,player:getYPos(),player:getZPos()+1,player:getRot(),player:getId()); -- +1 is simply a stetic modification
				setGlobalVar("[NM_poped]Bilopdop_and_Deloknok",player:getId());
			else
				player:specialMessage(1191); -- There is nothing inside.
			end			
		end
	else
		player:specialMessage(1191); -- There is nothing inside.
	end
elseif(csid == 0x6E and option == 0)then
	TheDoorman = player:getQuestStatus(1,54);
	if( TheDoorman == 1 ) then
		local lastTimeKilledPlusTimeToGetCredit = getGlobalVar("[NM_Dead]Gavotvut_and_Barakbok");
		local bothOrOneIsPoped = getGlobalVar("[NM_poped]Gavotvut_and_Barakbok");
		if(player:hasKeyItem(SwordGripMaterial) == 0 and player:getVar("[Quest-TheDoorman]NMs_killed") == 1 and os.time() <= lastTimeKilledPlusTimeToGetCredit) then
			player:addKeyItem(SwordGripMaterial);
			player:specialMessage(KEYITEM_OBTAINED,SwordGripMaterial);
		else
			if(os.time() > lastTimeKilledPlusTimeToGetCredit and bothOrOneIsPoped == 0)then
				zone = Zone(player:getZone());
				zone:spawnMob("Gavotvut",player:getXPos()-1,player:getYPos(),player:getZPos()-1,player:getRot(),player:getId());
				zone:spawnMob("Barakbok",player:getXPos() + 1,player:getYPos(),player:getZPos()+1,player:getRot(),player:getId()); -- +1 is simply a stetic modification
				setGlobalVar("[NM_poped]Gavotvut_and_Barakbok",player:getId());
			else
				player:specialMessage(1191); -- There is nothing inside.
			end			
		end
	else
		player:specialMessage(1191); -- There is nothing inside.
	end
end
end;