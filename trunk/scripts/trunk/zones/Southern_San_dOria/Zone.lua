require("/scripts/globals/common");
require("/scripts/globals/settings");

---------------------------------
---   General zone eventhandling goes here ...  ---------
---------------------------------
function onEventFinish(player,csid,option) 
--print("CSID:",csid);
--print("Option:",option);
if(csid == 0x1f7) then
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
	player:setVar("adaunelMess",0)
	player:setVar("blendareMess",0)
	player:setVar("leuveretMess",0)
	player:setVar("maugieMess",0)
	player:setVar("roselMess",0)
end
cs = -1;

--- New Character Cut-Scene---
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE == 1) then
	player:setPos(-96,1,-40,224);
	player:setVar("firstLogin",-1);
	player:setHomePoint();
	--print("Opening cutscene bypassed, firstLogin set to -1.");
end
if (player:getVar("firstLogin") ~= -1 and OPENING_CUTSCENE_DISABLE ~= 1) then
   cs = 0x1f7;
   player:setPos(-96,1,-40,224);
   player:setVar("firstLogin",-1);
   player:setHomePoint();
   --print("Firstlogin now set to -1");
end
if (player:getVar("must_watch_ssandy_cs") == 1) then
	 cs = 0; -- San d'Oria Missions final CS after getting rank 10
	 player:setVar("must_watch_ssandy_cs",0);
end;

return cs;
end;


---------------------------------
---   Initialize code here ...   ----------------
---------------------------------

function onInitialize()
	currZone = 0xe6;
--	adaunel
	POS1 = {80.304,-7.4,-24.714}
	--print("Initializing Southern San d'Oria");
	registerRegion(currZone,1,(POS1[1] - 4),(POS1[1] + 4),(POS1[2] - 4),(POS1[2] + 4),(POS1[3] - 4),(POS1[3] + 4));
--	blendare
	POS2 = {32.922,2,-30.434}
	registerRegion(currZone,2,(POS2[1] - 4),(POS2[1] + 4),(POS2[2] - 4),(POS2[2] + 4),(POS2[3] - 4),(POS2[3] + 4));
--	leuveret
	POS3 = {-136.344,-8.8,22.05}
	registerRegion(currZone,3,(POS3[1] - 4),(POS3[1] + 4),(POS3[2] - 4),(POS3[2] + 4),(POS3[3] - 4),(POS3[3] + 4));
--	maugie
	POS4 = {104.984,2,-16.827}
	registerRegion(currZone,4,(POS4[1] - 4),(POS4[1] + 4),(POS4[2] - 4),(POS4[2] + 4),(POS4[3] - 4),(POS4[3] + 4));
--	rosel
	POS5 = {70.058,0,41.133}
	registerRegion(currZone,5,(POS5[1] - 4),(POS5[1] + 4),(POS5[2] - 4),(POS5[2] + 4),(POS5[3] - 4),(POS5[3] + 4));

end;
 
 
function onRegionEnter(player, regionID)
-- debug print messages, can be deleted once this script is confirmed working
--print("Entered defined region >> ",player:getName())
--print("Region ID: ",regionID)
if player:getQuestStatus(0,16) == 1 and player:hasItem(532) == 1 then

-- Quest related variables, disables message if you have already traded the item
	adaunel = player:getVar("adaunel")
	blendare = player:getVar("blendare")
	leuveret = player:getVar("leuveret")
	maugie = player:getVar("maugie")
	rosel = player:getVar("rosel")
-- Zone related variables, checks to see if you have already heard the message at least once
	adaunelMess = player:getVar("adaunelMess")
	blendareMess = player:getVar("blendareMess")
	leuveretMess = player:getVar("leuveretMess")
	maugieMess = player:getVar("maugieMess")
	roselMess = player:getVar("roselMess")


	switch (regionID): caseof {
	---------------------------------
	[1] = function (x)  -- adaunel
	---------------------------------
		if adaunelMess == 0 and adaunel == 0 then
			--print("adaunel")
			player:setVar("adaunelMess",1)
			player:specialMessage(2136);
		end
	end,
	---------------------------------
	[2] = function (x)  -- blendare
	---------------------------------
		if blendareMess == 0 and blendare == 0 then
			--print("blendare")
			player:setVar("blendareMess",1)
			player:specialMessage(2131);
		end
	end,
	---------------------------------
	[3] = function (x)  -- leuveret
	---------------------------------
		if leuveretMess == 0 and leuveret == 0 then
			--print("leuveret")
			player:setVar("leuveretMess",1)
			player:specialMessage(2138);
		end
	end,
	---------------------------------
	[4] = function (x)  -- maugie
	---------------------------------
		if maugieMess == 0 and maugie == 0 then
			--print("maugie")
			player:setVar("maugieMess",1)
			player:specialMessage(2134);
		end
	end,
	---------------------------------
	[5] = function (x)  -- rosel
	---------------------------------
		if roselMess == 0 and rosel == 0 then
			--print("rosel")
			player:setVar("roselMess",1)
			player:specialMessage(2132);
		end
	end,
	---------------------------------
	default = function (x) end,}
	end;
 end
 