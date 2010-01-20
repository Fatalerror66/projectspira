-----------------------------------
--	Author: ReaperX
--  Carol (effect)
--	Increases resistance to elemental spells.
--
-----------------------------------
 
require("scripts/globals/settings");
function OnGainEffect(target,effect)
	addpower = effect:getPower();
	addelement = math.floor(addpower/1000);
	addr = addpower - addelement*1000;
	switch (addelement): caseof {
	[1] = function (x) effect:addMod(MOD_FIRERES,addr); end,
	[2] = function (x) effect:addMod(MOD_EARTHRES,addr); end,
	[3] = function (x) effect:addMod(MOD_WATERRES,addr); end,
	[4] = function (x) effect:addMod(MOD_WINDRES,addr); end,
	[5] = function (x) effect:addMod(MOD_ICERES,addr); end,
	[6] = function (x) effect:addMod(MOD_THUNDERRES,addr); end,
	[7] = function (x) effect:addMod(MOD_LIGHTRES,addr); end,
	[8] = function (x) effect:addMod(MOD_DARKRES,addr); end,
	default = function (x) end,}	
end;

function OnTick(target,effect)
	--Do NOT add print lines to this, since this function will execute every few seconds.
end;

function OnLoseEffect(target,effect)
end;
--[[

	rempower = effect:getPower();
	remelement = math.floor(rempower/1000);
	remr = rempower - remelement*1000;
	switch (remelement): caseof {
	[1] = function (x) effect:subtractMod(MOD_FIRERES,remr); end,
	[2] = function (x) effect:subtractMod(MOD_EARTHRES,remr); end,
	[3] = function (x) effect:subtractMod(MOD_WATERRES,remr); end,
	[4] = function (x) effect:subtractMod(MOD_WINDRES,remr); end,
	[5] = function (x) effect:subtractMod(MOD_ICERES,remr); end,
	[6] = function (x) effect:subtractMod(MOD_THUNDERRES,remr); end,
	[7] = function (x) effect:subtractMod(MOD_LIGHTRES,remr); end,
	[8] = function (x) effect:subtractMod(MOD_DARKRES,remr); end,
	default = function (x) end,}
end;]]--