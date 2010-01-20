-----------------------------------
--	Author: ReaperX
-- 	Cavernous Maw
-- 	Teleports Players to Batallia_Downs_S
-----------------------------------

PureWhiteFeather = 0x38E;

require("scripts/globals/settings");

function onTrigger(player,npc)
	if player:hasKeyItem(PureWhiteFeather) == 0 then
		event = Event(0x1F4);
		event:setParams(0);
		player:startEvent(event);
	else
		if player:getVar("BATALLIA_MAW") == 1 then
			player:startEvent(Event(0x38E));
		end
	end
end;

function onEventSelection(player,csid,option) 
--print("CSID:",csid);
--print("RESULT:",option);
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
if (csid == 0x1F4) then
	r = math.random(1,3);
	player:addKeyItem(PureWhiteFeather);
	player:specialMessage(00212, PureWhiteFeather);
	player:completeMission(7,0);
	player:currentMission(7,1);
	if (r == 1) then
		player:setVar("BATALLIA_MAW",1);
		player:setPos(-48, 0, 437, 52, 0x54); -- Batallia_Downs[S] maw
	elseif (r == 2) then
		player:setVar("ROLANBERRY_MAW",1);
		player:setPos(-190, -8, 363, 11, 0x5b); -- Rolanberry_Fields_[S] maw
	elseif (r == 3) then
		player:setVar("SAUROMUGUE_MAW",1);
		player:setPos(372, 9, -228, 27, 0x62); -- Sauromugue_Champaign_[S] maw
	end;
elseif (csid == 0x38E) and (option == 1) then
	player:setPos(-48, 0, 437, 52, 0x54); -- Batallia_Downs[S] maw
end;
end;