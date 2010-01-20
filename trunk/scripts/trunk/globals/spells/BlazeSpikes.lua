--------------------------------------
--	Author: ReaperX
-- 	Blaze Spikes
--	Covers you with magical fire spikes. Enemies that hit you take fire damage.
--------------------------------------
 
require("scripts/globals/settings");
require("/scripts/globals/combat");
require("/scripts/globals/spell_definitions");

function OnSpellCast(caster,target,spell)
	  
  if (target:getStatusEffect(EFFECT_SHOCK_SPIKES) ~= nil) then
	  target:removeStatusType(EFFECT_SHOCK_SPIKES);
	elseif (target:getStatusEffect(EFFECT_BLAZE_SPIKES) ~= nil) then
	  target:removeStatusType(EFFECT_BLAZE_SPIKES);
	elseif (target:getStatusEffect(EFFECT_ICE_SPIKES) ~= nil) then
	  target:removeStatusType(EFFECT_ICE_SPIKES);
	end;

  -- setting the effect size to 1 since spikes dmg depends on INT and MAB 
  -- and will have to be handled by the server on a per hit basis anyway.	
		
	target:addStatusEffect(EFFECT_BLAZE_SPIKES,1,0,SPIKE_EFFECT_DURATION,FLAG_DISPELABLE);
		
	target:updateEnmity(caster,1,480);
	final = EFFECT_BLAZE_SPIKES;
	return final;
end;