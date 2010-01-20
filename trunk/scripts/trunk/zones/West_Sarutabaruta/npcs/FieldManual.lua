-----------------------------------
--	Author: Kegsay
-- 	Field Manual
-- 	Working, 100%.
-----------------------------------
-- Includes
require("/scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
package.loaded["/scripts/zones/RuAun_Gardens/TextIDs"] = nil;
require("/scripts/zones/RuAun_Gardens/TextIDs");
-----------------------------------
-- onTrigger Action
-----------------------------------
function onTrigger(player,npc)
-----------------------------------
-- Dialogues,cutscenes,etc. go below.
-----------------------------------
local hasRegime = player:getVar("fov_regimeid");
--if has no regime active
if (hasRegime==0) then --no regime active
	fm_event1 = Event(0x0034);
	local tabs = player:getVar("tabs");
	fm_event1:setParams(0,0,0,0,0,0,tabs,0);
	player:startEvent(fm_event1);
else --has regime active, get amount of mobs killed
	local numkilled1 = player:getVar("fov_numkilled1");
	local numkilled2 = player:getVar("fov_numkilled2");
	local numkilled3 = player:getVar("fov_numkilled3");
	local numkilled4 = player:getVar("fov_numkilled4");
	local numneeded1 = player:getVar("fov_numneeded1");
	local numneeded2 = player:getVar("fov_numneeded2");
	local numneeded3 = player:getVar("fov_numneeded3");
	local numneeded4 = player:getVar("fov_numneeded4");
	--start event
	fm_event1 = Event(0x0034);
	local tabs = player:getVar("tabs");
	fm_event1:setParams(numneeded1,numneeded2,numneeded3,numkilled3,numkilled1,numkilled2,tabs,hasRegime);
	player:startEvent(fm_event1);
end

 
end;
 

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
end; 
 
 
--------------------------------------
-- onEventSelection
--------------------------------------
function onEventSelection(player,csid,menuchoice)
if(menuchoice==18) then --Page 1
	player:updateEvent(6,0,0,0,0,1,5,26);
elseif(menuchoice==34) then --Page 2
	player:updateEvent(6,0,0,0,0,2,5,27);
elseif(menuchoice==50) then --Page 3
	player:updateEvent(5,1,0,0,0,3,8,28);
elseif(menuchoice==66) then --Page 4
	player:updateEvent(4,2,0,0,0,4,8,29);
elseif(menuchoice==82) then --Page 5
	player:updateEvent(4,2,0,0,0,4,8,61);
end
--print("csid: ",csid);
--print("menuchoice: ",menuchoice);

end;
 
-----------------------------------
-- onEventFinish Action
-----------------------------------
function onEventFinish(player,csid,option)
-- ================= FIELD SUPPORT ===============================================
if(option==53) then --Chose Regen. Regen from FoV removes all forms of regen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-20;
	player:setVar("tabs",newtabs);
	--Removes regen if on player
	regen = player:getStatusEffect(EFFECT_REGEN);
	if (regen ~= nil) then
		player:removeStatusType(EFFECT_REGEN);
	end
	--Adds regen
	player:addStatusEffect(EFFECT_REGEN,1,3,3600,FLAG_DISPELABLE);
elseif(option==69) then --Chose Refresh, removes all other refresh.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-20;
	player:setVar("tabs",newtabs);
	--Removes refresh if on player
	refresh = player:getStatusEffect(EFFECT_REFRESH);
	if (refresh ~= nil) then
		player:removeStatusType(EFFECT_REFRESH);
	end
	--Add refresh
	player:addStatusEffect(EFFECT_REFRESH,1,3,3600,FLAG_DISPELABLE);
elseif(option==85) then --Chose Protect, removes all other protect.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-15;
	player:setVar("tabs",newtabs);
	--Removes protect if on player
	protect = player:getStatusEffect(EFFECT_PROTECT);
	if (protect ~= nil) then
		player:removeStatusType(EFFECT_PROTECT);
	end
	--Work out how much def to give (highest tier dependant on level)
	local def = 0;
	if (player:getMainLvl()<27) then --before protect 2, give protect 1
		def=10;
	elseif (player:getMainLvl()>=27 and player:getMainLvl()<47) then --after p2, before p3
		def=25;
	elseif (player:getMainLvl()>=47 and player:getMainLvl()<63) then --after p3, before p4
		def=40;
	elseif (player:getMainLvl()>=63) then --after p4
		def=55;
	end
	--Add protect
	player:addStatusEffect(EFFECT_PROTECT,def,0,1800,FLAG_DISPELABLE);
elseif(option==101) then --Chose Shell, removes all other shell.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-15;
	player:setVar("tabs",newtabs);
	--Removes shell if on player
	shell = player:getStatusEffect(EFFECT_SHELL);
	if (shell ~= nil) then
		player:removeStatusType(EFFECT_SHELL);
	end
	--Work out how much mdef to give (highest tier dependant on level)
	--values taken from Shell scripts by Tenjou.
	local def = 0;
	if (player:getMainLvl()<37) then --before shell 2, give shell 1
		def=10;
	elseif (player:getMainLvl()>=37 and player:getMainLvl()<57) then --after s2, before s3
		def=16;
	elseif (player:getMainLvl()>=57 and player:getMainLvl()<68) then --after s3, before s4
		def=23;
	elseif (player:getMainLvl()>=68) then --after s4
		def=28;
	end
	--Add shell
	player:addStatusEffect(EFFECT_SHELL,def,0,1800,FLAG_DISPELABLE);
elseif (option==37) then --Reraise chosen.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-10;
	player:setVar("tabs",newtabs);
	--Remove any other RR
	reraise = player:getStatusEffect(EFFECT_RERAISE);
	if (reraise ~= nil) then
		player:removeStatusType(EFFECT_RERAISE);
	end
	--apply RR, 2 hour duration.
	player:addStatusEffect(EFFECT_RERAISE,power,0,7200,FLAG_DISPELABLE);
elseif (option==21) then --Return to home nation.
	--Decrease tabs
	local tabs = player:getVar("tabs");
	local newtabs = tabs-50;
	player:setVar("tabs",newtabs);
	--get home nation (2=Windurst) (1=Bastok) (0=Sandy)
	local nation = player:getNation();
	if (nation==2) then --Windurst
	player:setPos(193,-12,222,75,0xF0);
	end
	if (nation==1) then --Bastok
	player:setPos(82,0,-71,249,0xEA);
	end
	if (nation==0) then --San d'Oria
	player:setPos(31,0,23,247,0xE7);
	end


--if(option==149) then --chose Hard Cookie, INT +4, MP +30 for 30 minutes 
--effect = player:getStatusEffect(EFFECT_FOOD);
--end

-- =========================== ELITE REGIMES =================================
-- =========================== TRAINING REGIMES ================================
elseif(option==3) then --Cancelled Regime.
	player:setVar("fov_regimeid",0);
	--Display message about cancelled regime.
	player:specialMessage(REGIME_CANCELED);
elseif(option==18) then --Page 1
	--print("Accepted.");
	player:setVar("fov_regimeid",26);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:setVar("fov_numneeded1",6);
	player:setVar("fov_numneeded2",0);
	player:setVar("fov_numneeded3",0);
	player:setVar("fov_numneeded4",0);
	--display message about training regime accepted!
	player:specialMessage(REGIME_ACCEPTED);
	player:specialMessage(DONT_SWAP_JOBS);
elseif(option==34) then --Page 2
	player:setVar("fov_regimeid",27);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:setVar("fov_numneeded1",6);
	player:setVar("fov_numneeded2",0);
	player:setVar("fov_numneeded3",0);
	player:setVar("fov_numneeded4",0);
	--display message about training regime accepted!
	player:specialMessage(REGIME_ACCEPTED);
	player:specialMessage(DONT_SWAP_JOBS);
elseif(option==50) then --Page 3
	player:setVar("fov_regimeid",28);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:setVar("fov_numneeded1",5);
	player:setVar("fov_numneeded2",1);
	player:setVar("fov_numneeded3",0);
	player:setVar("fov_numneeded4",0);
	--display message about training regime accepted!
	player:specialMessage(REGIME_ACCEPTED);
	player:specialMessage(DONT_SWAP_JOBS);
elseif(option==66) then --Page 4
	player:setVar("fov_regimeid",29);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:setVar("fov_numneeded1",4);
	player:setVar("fov_numneeded2",2);
	player:setVar("fov_numneeded3",0);
	player:setVar("fov_numneeded4",0);
	--display message about training regime accepted!
	player:specialMessage(REGIME_ACCEPTED);
	player:specialMessage(DONT_SWAP_JOBS);
elseif(option==82) then --Page 5
	player:setVar("fov_regimeid",61);
	player:setVar("fov_numkilled1",0);
	player:setVar("fov_numkilled2",0);
	player:setVar("fov_numkilled3",0);
	player:setVar("fov_numkilled4",0);
	player:setVar("fov_numneeded1",4);
	player:setVar("fov_numneeded2",2);
	player:setVar("fov_numneeded3",0);
	player:setVar("fov_numneeded4",0);
	--display message about training regime accepted!
	player:specialMessage(REGIME_ACCEPTED);
	player:specialMessage(DONT_SWAP_JOBS);
end

--print("CSID:",csid);
--print("RESULT:",option);
end;