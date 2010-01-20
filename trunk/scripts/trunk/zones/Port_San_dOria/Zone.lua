require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option) 
--print("CSID:",csid);
--print("Option:",option);
if(csid == 0x1f4) then
	player:setVar("firstLogin",-1);
	--print("Firstlogin now set to -1");
end
end;

---------------------------------
-- onZoneIn
---------------------------------

function onZoneIn(player,prevZone)
-- reset variables that stop the server from spamming the special message
if player:getQuestStatus(0,16) == 1 then
	player:setVar("answaldMess",0)
	player:setVar("portaureMess",0)
	player:setVar("mieneMess",0)
	player:setVar("priettaMess",0)
	player:setVar("auvareMess",0)
end
cs = -1;
--- New Character Cut-Scene---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-104,-8,-128,227)
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
   cs = 0x1f4;
   player:setPos(-104,-8,-128,227);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
   --print("Firstlogin now set to -1");
end
return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
	currZone = 0xe8;
--	Answald
	--print("Initializing Port San d'Oria NPCs related to Flyers for Regine Quest");
	registerRegion(currZone,1,71.6,79.6,-17,-15,-132.5,-124.5);
--	Portaure
	registerRegion(currZone,2,-25.75,-17.75,-5,-3,-111.355,-103.355);
--	Miene
	registerRegion(currZone,3,-3.6,4.6,-5,-3,-85.1,-77.1);
--	Prietta
	registerRegion(currZone,4,-17.722,-9.722,-15,13,-100.1,-92.1);
--	Auvare
	registerRegion(currZone,5,-52,-34.136,-9,-7,15,44.891);

end;
 
 
function onRegionEnter(player, regionID)
-- debug print messages, can be deleted once this script is confirmed working
--print("Entered defined region >> ",player:getName())
--print("Region ID: ",regionID)

if player:getQuestStatus(0,16) == 1 and player:hasItem(532) == 1 then

-- Quest related variables, disables message if you have already traded the item
	answald = player:getVar("answald")
	portaure = player:getVar("portaure")
	miene = player:getVar("miene")
	prietta = player:getVar("prietta")
	auvare = player:getVar("auvare")
-- Zone related variables, checks to see if you have already heard the message at least once
	answaldMess = player:getVar("answaldMess")
	portaureMess = player:getVar("portaureMess")
	mieneMess = player:getVar("mieneMess")
	priettaMess = player:getVar("priettaMess")
	auvareMess = player:getVar("auvareMess")


	switch (regionID): caseof {
	---------------------------------
	[1] = function (x)  -- Answald
	---------------------------------
		if answaldMess == 0 and answald == 0 then
			--print("Answald")
			player:setVar("answaldMess",1)
			player:specialMessage(1521);
		end
	end,
	---------------------------------
	[2] = function (x)  -- Portaure
	---------------------------------
		if portaureMess == 0 and portaure == 0 then
			--print("Portaure")
			player:setVar("portaureMess",1)
			player:specialMessage(1524);
		end
	end,
	---------------------------------
	[3] = function (x)  -- Miene
	---------------------------------
		if mieneMess == 0 and miene == 0 then
			--print("Miene")
			player:setVar("mieneMess",1)
			player:specialMessage(1523);
		end
	end,
	---------------------------------
	[4] = function (x)  -- Prietta
	---------------------------------
		if priettaMess == 0 and prietta == 0 then
			--print("Prietta")
			player:setVar("priettaMess",1)
			player:specialMessage(1522);
		end
	end,
	---------------------------------
	[5] = function (x)  -- Auvare
	---------------------------------
		if auvareMess == 0 and auvare == 0 then
			--print("Auvare")
			player:setVar("auvareMess",1)
			player:specialMessage(1525);
		end
	end,
	---------------------------------
	default = function (x) end,}
	end;
 end
 