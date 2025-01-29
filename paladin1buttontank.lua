function pallytank()
    -- spell names
    local seal_of_wisdom = "Seal of Wisdom"
    local judgement = "Judgement"
    local judgement_of_wisdom = "Judgement of Wisdom"
    local holy_shield = "Holy Shield"
    local holy_strike = "Holy Strike"
    local right = "Seal of Righteousness"
    local zeal = "Zeal"
    local crusader = "Crusader Strike"


    if not buffed(holy_shield) then
        cast(holy_shield)
    end

    if not buffed(zeal) and cooldown_for(crusader) == 0 then
        cast_and_downrank(crusader)
    end

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

    -- Keep up Right when Wisdom up
    if not buffed(right) and cooldown_for(right) == 0 then
       cast(right)
        return
    end

    if buffed(right) and cooldown_for(judgement) == 0 then
      cast(judgement)
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
