--------------------------------------
--	Author: Tenjou
-- 	Retrace
-- 	Transports qualified party member to heir nation of allegiance in the past.
--
--	Will probably crash those without the expansion.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");
function OnSpellCast(caster,target,spell)
--print();
nation = target:getNation();
if (nation == 0) then --San d'Oria
	x = 103.978;
	y = 1.000;
	z = -47.951;
	r = 0xa0;
	a = 0x50;
elseif (nation == 1) then --Bastok
	x = -233.879;
	y = 0.000;
	z = 94.000;
	r = 0x40;
	a = 0x57;
elseif (nation == 2) then --Windurst
	x = -40.000;
	y = -5.000;
	z = 235.000;
	r = 0x40;
	a = 0x5e;
end

--Secret Surprise
jail = target:getZone();
if (jail == 0x83) then
	x = 260;
	y = 12;
	z = 230;
	r = 0x40;
	a = 0x83;
	target:setHP(1);
	target:setMP(0);
	--print("LOL DENIED!!!");
end

--Do it!
target:setPos(x,y,z,r,a);

final = 0;
return final;
end;