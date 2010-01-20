-----------------------------------
--	Author: Kegsay
-- 	Mug (300VE 1CE)
-- 	Steals gil from an enemy. 
-- Not 100% proc. 
-- Gil can only be stolen from BEASTMEN and some NMs.
-- Deleted the duplicate Mug which had animationID of 184. KEEP 183.
-- Assassin's Bonnet (+1) mugs extra gil.
-- MobIDs: 
-- orc = 139;
--	orcwarmachine = 140;
--	yag = 197;
--	quad = 150/231/232;
--	goblin = 103;
--	antica = 21;
--	sahagin = 158;
--	tonberry = 178/244;
--	giga = 100/218/219/220/221;
--	kindred = 122;
--	mamoolja = 128;
--	mamooljaknight = 129;
--	lamia = 124;
--	merrow = 134;
--	moblin = 136;
--	qiqirn = 149;
--	poroggo = 146;
--	bugbear = 51;
--  troll = 180;
--TODO: Fine tune amount stolen. Allow NMs to be mugged (e.g. Sky gods).
-- Note to whoever edits this:
--
--   THE AMOUNT STOLEN FORMULA MUST ACCOUNT FOR SKY NMs WHICH CAN BE MUGGED
--        FOR UPWARDS OF 3000+ GIL. IF IT DOESN'T ACCOUNT FOR IT,
--                            DON'T ADD IT.
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();
	--Determine if success or not. Since no testing is available on proc rate
	--but it is said to be high, I am presuming it to be 95% (max acc %)
	rand = math.random();
	bonn = 0x3AE5;
	bonnpone = 0x3B92; 
	family = target:getFamily();
	if (rand<=0.95 and family == 180 or family == 51 or family == 146 or family == 149 or family == 136
	 or family == 134 or family == 124 or family == 129 or family == 128 or family == 122 or family == 100
	  or family == 218 or family == 219 or family == 220 or family == 221 or family == 178 or family == 244
	   or family == 158 or family == 21 or family == 103 or family == 150 or family == 231 or family == 197
	    or family == 232 or family == 140 or family == 139) then
	final = target:getMainLvl()*165/83;
	if (user:getEquip(5)==bonn or user:getEquip(5)==bonnpone) then
	final = target:getMainLvl()*215/83;
	end
	user:addGil(final);
	ability:setMsg(129);
	ability:setResult(final);
	elseif (rand>0.95) then
	ability:setMsg(244);
	else
	ability:setMsg(244);
	end
	--Update enmity.
	target:updateEnmity(user,300,1);
end;