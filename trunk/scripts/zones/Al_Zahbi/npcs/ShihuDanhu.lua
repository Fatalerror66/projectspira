-----------------------------------
--	Author: Almendro
-- 	Shihu-Danhu
-- 	Teleports you to Jeuno
-----------------------------------

-----------------------------------
-- onTrigger Action
-----------------------------------
require("scripts/globals/settings");
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
	player:startEvent(Event(0x67));
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
if(csid == 0x67 and option == 1) then
	RuLudeGardens = 0xF3;
	BatalliaDowns = 0x69;
	   Rolanberry = 0x6E;
	   Sauromugue = 0x78;
	        Qufim = 0x7E;
	if (getGlobalVar("AstralCandescence") == 1) then
	--[[* Ru'Lude Gardens (H-9)
    * Batallia Downs (K-8)
    * Rolanberry Fields (J-6)
    * Sauromugue Champaign (F-5)
    * Qufim Island (I-9) ]]--
	randomTeleport = math.random(1,5);
	switch (randomTeleport): caseof {
	[1] = function (x)
		player:setPos(-0.203,9,-51.303,195,RuLudeGardens);
	end,
	[2] = function (x)
		player:setPos(369.2,8.1,-114.894,16,BatalliaDowns);
	end,	
	[3] = function (x)
		player:setPos(213.289,16.331,419.212,214,Rolanberry);
	end,
	[4] = function (x)
		player:setPos(-329.926,-0.200,431.778,103,Sauromugue);
	end,
	[4] = function (x)
		player:setPos(167.081,18.083,-213.439,85,Qufim);
	end,}
	elseif(os.time() >= player:getVar("WGWarpTaruUsedTimeRemaining") ) then
	hours = getVanaHour();
	minutes = getVanaMinute();
	wholeVanaDayInMinutes = 1440;
	currentVanaDayInMinutes = hours*60 + minutes;
	timeRemainingVanaMinutes = wholeVanaDayInMinutes - currentVanaDayInMinutes;
	timeRemainingRealSeconds = math.floor(timeRemainingVanaMinutes*2.4);
	player:setVar("WGWarpTaruUsedTimeRemaining",os.time()+ timeRemainingRealSeconds);
	--[[ to do (I don't know the exact positions)
	If the Astral Candescence is lost, it will instead be one of:

    * Batallia Downs (D-7)
    * Rolanberry Fields (J-13)
    * Sauromugue Champaign (L-7)
    * Qufim Island (F-8) ]]--
	else
		player:specialMessage(1432); -- I-I'm terribly s-sorry... I s-seem to be out of m-magic. M-maybe you can h-help me out another t-time...?
	end
	player:setVar("reekofamateursorcery",os.time()+57*60+36); -- A vana'diel day in real seconds
end
end;