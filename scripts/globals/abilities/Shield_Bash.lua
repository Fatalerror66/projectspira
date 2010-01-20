-----------------------------------
--	Author: Tenjou and hyourin
-- 	Shield Bash
-- 	Delivers an attack that can stun the target.  Shield required.
--
--	Mainly added for enmity, but will also do damage.
--  damage sources:	http://ffxi.allakhazam.com/db/item.html?fitem=7979&page=1&howmany=50#m1163543946188528224
--  				http://ryuushin.com/blog/khimmoblin-maze
--  seems to generate random damage between player's level/3 and player's level/2
-----------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");

function OnUseAbility(user, target, ability, isFirstTarget)
--print();
level = user:getMainLvl(); --Complete guess at damage.
damage=math.floor(math.random((level/3),(level/2))+1);
if (user:getEquip(2) < 0x4000) then --Player is using a shield (or at least not a weapon).
	if (user:getEquip(2) == 0x3ade) then --Aegis
		damage = damage+200;
		crit=0.1;
		if(math.random()<crit) then
			damage=damage*3;
		end
	elseif (user:getEquip(2) == 0x304a) then --Highlander's Targe
		damage = damage+15;
	end
	if (user:getEquip(7) == 0x3a43 or user:getEquip(7) == 0x3b04) then --Valor Gauntlets
		damage = damage+10;
	end
	if (user:getEquip(14) == 0x3dd7 or user:getEquip(15) == 0x3dd7) then --Fenian Ring
		damage = damage+50;
	end
	if (user:getEquip(14) == 0x33ec or user:getEquip(15) == 0x33ec) then --Guardian's Ring
		hp = player:getHP()/player:getMaxHP();
		tp = player:getTP();
		if (hp >= 0.75 and tp >= 100) then --Latent effect active
			damage = damage+10;
		end
	end
	if (user:getEquip(12) == 0x39a6 or user:getEquip(13) == 0x39a6) then --Knightly Earring
		damage = damage+10;
	end
	target:removeHP(damage);
	target:updateEnmity(user,900,1);
	ability:setMsg(110);
	ability:setResult(damage);
else
	damage = 0; --Temporary solution, yes it should check in the code first, quit whining.
end
end;