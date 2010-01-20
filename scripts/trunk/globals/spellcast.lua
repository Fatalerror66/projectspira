function OnSpellCastFinish(caster,spell)
--print();
cost = spell:getMPCost(); --This cost will have already been reduced via SCH stratagems.
--print("COST:",cost);

math.randomseed(os.time());

if (cost >= 1000) then --Only ninjutsu has an Item ID as its cost.  No ninjutsu item ID is under 1000, and no spells cost over 1000 MP.
	nte = math.random(); nte = math.random(); nte = math.random();
	if (nte*100 > caster:getMod(MOD_NINJA_TOOL_EXPERTISE)) then
		caster:removeItem(cost,1);
	end
else --All other magic
	if (caster:getStatusEffect(EFFECT_MANAFONT) ~= nil) then
		cost = 0;
	end

	--Conserve MP for BLM and SCH.
	conservemp = math.random(); conservemp = math.random(); conservemp = math.random();
	if (conservemp*100 < caster:getMod(MOD_CONSERVE_MP)) then
		conserved = math.random(8,15);
		cost = math.floor(cost*(conserved/16));
		--print("Conserve MP reduced spell cost to " .. conserved .. "/16.");
	end
	
	
	caster:removeMP(cost);
end


--Kill all seals and stratagems.
caster:removeStatusType(EFFECT_DIVINE_SEAL);
caster:removeStatusType(EFFECT_ELEMENTAL_SEAL);
caster:removeStatusType(EFFECT_DARK_SEAL);
caster:removeStatusType(EFFECT_PENURY);
caster:removeStatusType(EFFECT_PARSIMONY);
caster:removeStatusType(EFFECT_CELERITY);
caster:removeStatusType(EFFECT_ALACRITY);
caster:removeStatusType(EFFECT_RAPTURE);
caster:removeStatusType(EFFECT_EBULLIENCE);
caster:removeStatusType(EFFECT_ACCESSION);
caster:removeStatusType(EFFECT_MANIFESTATION);
caster:removeStatusType(EFFECT_ALTRUISM);
caster:removeStatusType(EFFECT_FOCALIZATION);
caster:removeStatusType(EFFECT_TRANQUILITY);
caster:removeStatusType(EFFECT_EQUANIMITY);

end;