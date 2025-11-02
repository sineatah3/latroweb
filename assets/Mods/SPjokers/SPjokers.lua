--- STEAMODDED HEADER
--- MOD_NAME: SPjokers
--- MOD_ID: SPjokers
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Repair the old jokers
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.0
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas{
    key = 'plasma',
    px = 71,
    py = 95,
    path = 'plasma.png'
}

SMODS.Atlas{
    key = 'query',
    px = 71,
    py = 95,
    path = 'query.png'
}

SMODS.Atlas{
    key = 'oda',
    px = 71,
    py = 95,
    path = 'oda.png'
}

SMODS.Joker{
    key = 'plasma',
    name = 'plasma',
    rarity = 3,
    cost = 10,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 0 },
    loc_txt ={
        name = 'Plasma Clown',
        text = {
            '{C:attention} balance {} your',
            '{C:chips} Chips {} and {C:mult} Multiple{}'
        }
    },
    atlas = 'plasma',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Joker{
    key = 'query',
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    loc_txt ={
        name = '？？？',
        text = {
            'When playing cards{C:attention}Temporary upgrade{}',
            'You typed{C:attention}Hand level{}',
            'The upgrade level is the sum of the levels of other cards.'
        }
    },
    atlas = 'query',
    config = { extra = {final_sum = 0} },
    loc_vars = function(self, info_queue, card)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        local sum = 0
        local query_list = {}
        if context.before then
            for k, v in pairs(G.handlist) do
                if G.GAME.hands[v].visible then
                    query_list[#query_list + 1] = v
                end
            end
            for k, v in pairs(query_list) do
                sum = sum + G.GAME.hands[v].level
            end
            card.ability.extra.final_sum = sum - G.GAME.hands[context.scoring_name].level
            level_up_hand(context.blueprint_card or card, context.scoring_name, nil, card.ability.extra.final_sum)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "临时升级", colour = G.C.RED})
        end
        if context.after then
            level_up_hand(context.blueprint_card or card, context.scoring_name, nil, -card.ability.extra.final_sum)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "还原", colour = G.C.BLUE})
        end
    end
}

SMODS.Joker{
    key = 'oda',
    rarity = 4,
    cost = 20,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    loc_txt ={
        name = 'Oda',
        text = {
            'beat{C:attention}Boss Blind{}back',
            'for{C:attention}#1#{}Zhang basic version',
            'random{C:attention}Joker{}Add to{C:dark_edition}negative{}'
        }
    },
    atlas = 'oda',
    config = { extra = {negative_num = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = {card.ability.extra.negative_num} }
    end,
    calculate = function(self, card, context)
        if G.GAME.blind:get_type() == 'Boss' and context.end_of_round and not context.repetition and not context.individual then
            local base_jokers = {}
            local indices = {}
            local negative_cards = {}
            for k, v in ipairs(G.jokers.cards) do
                if not v.edition then
                    base_jokers[#base_jokers + 1] = v
                end
            end
            for i = 1, #base_jokers do
                indices[i] = i
            end
            for i = #indices, 2, -1 do
                local j = math.random(i)
                indices[i], indices[j] = indices[j], indices[i]
            end
            local num_to_select = math.min(card.ability.extra.negative_num, #base_jokers)
            for i = 1, num_to_select do
                local chosen_index = indices[i]
                if chosen_index and base_jokers[chosen_index] then
                    local chosen_card = base_jokers[chosen_index]
                    negative_cards[#negative_cards + 1] = chosen_card
                end
            end
            for i = 1, #negative_cards do
                negative_cards[i]:set_edition({negative = true}, true)
            end
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------