function paladin_1buttonedward()
    -- spell names
    local holy_strike = "Holy Strike"
    local judgement = "Judgement"
    local crusader_strike = "Crusader Strike"
    local seal_of_the_crusader = "Seal of The Crusader"
    local exorcism = "Exorcism"
    local holy_shield = "Holy Shield"
    local holy_light = "Holy Light"
    local focus = "Focus"
    local judgement_of_wisdom = "Judgement of Wisdom"
    local seal_of_wisdom = "Seal of Wisdom"

    -- Check for hand of edward proc, cast heal
    if buffed(focus) then
        cast_and_downrank(holy_light)
        return
    end

    -- Keep up Holy Shield
    if not buffed(holy_shield) then
        cast(holy_shield)
        return
    end

    -- Holy Strike on cooldown.
    if cooldown_for(holy_strike) == 0 then
        cast_and_downrank(holy_strike)
    end

    -- Keep up Judgement of Wisdom.
    if not buffed(judgement_of_wisdom, "target") and cooldown_for(seal_of_wisdom) == 0 then
        if not buffed(seal_of_wisdom) then
            cast(seal_of_wisdom)
            return
        end

        cast(judgement)
        return
    end

    -- Keep up Seal of The Crusader
    if not buffed(seal_of_the_crusader) then
        cast(seal_of_the_crusader)
        return
    end

    -- Apply the first stack of Crusader Strike.
    -- TODO: write a function to get the number of stacks
    if not buffed(crusader_strike, "target") and cooldown_for(crusader_strike) == 0 then
        cast(crusader_strike)
        return
    end

    -- Cast Exorcism if the target is an undead or demon, and we have 30% or more mana.
    local mana = UnitMana("player")
    local max_mana = UnitManaMax("player")

    local target_type = UnitCreatureType("target")
    if ((target_type == "Undead") or (target_type == "Demon")) and ((mana/max_mana) > .3) and (cooldown_for(exorcism) == 0) then
        cast(exorcism)
        return
    end

    -- Judge Seal of the Crusader on cooldown if we are above 20% mana.

    if (mana/max_mana) > 0.2 and cooldown_for(judgement) == 0 then
        cast(judgement)
        return
    end

    -- Finally, spam Crusader Strike.
    -- The rank only really matters on the first application.
    if cooldown_for(crusader_strike) == 0 then
        cast_and_downrank(crusader_strike)
    end
end

function cooldown_for(spell_name)
    local index = spell_index(spell_name)
    local _, cd, _ = GetSpellCooldown(index, BOOKTYPE_SPELL)
    return cd
end

function spell_index(spell_name, spell_rank)
    local i = 1
    while true do
        local name, rank = GetSpellName(i, BOOKTYPE_SPELL)
        if not name then
            error(string.format("spell not found: %s, scanned: %d", spell_name, i))
            return
        end

        if (not spell_rank and name == spell_name) or (name == spell_name and rank == spell_rank) then
            return i
        end

        i = i + 1
    end
end

-- If under 20% mana, cast the Rank 1 version of a spell.
function cast_and_downrank(spell_name)
    local mana = UnitMana("player")
    local max_mana = UnitManaMax("player")
    if mana/max_mana < 0.2 then
        spell_name = string.format("%s(Rank 1)", spell_name)
    end

    cast(spell_name)
end