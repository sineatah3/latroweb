--- STEAMODDED HEADER
--- MOD_NAME: Bmenhancements
--- MOD_ID: Bmenhancements
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more enhancements
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.1g
----------------------------------------------
------------MOD CODE -------------------------

function Card:get_chip_x_bonus()
    if self.debuff then return 0 end
    if self.ability.set == 'Joker' then return 0 end
    if self.ability.x_chips <= 0 then return 0 end
    return self.ability.x_chips
end

function Card:get_chip_h_x_chips()
    if self.debuff then return 0 end
    if self.ability.h_x_chips <= -1.25 then
        if G.GAME.dollars >= 0 then
            return -self.ability.h_x_chips
        else
            return -((G.GAME.dollars/4) + self.ability.h_x_chips)
        end
    end
    return self.ability.h_x_chips
end

function Card:get_chip_h_p_dollars()
    if self.debuff then return 0 end
    return self.ability.h_p_dollars
end

local Blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    Blind_set_blind_ref(self, blind, reset, silent)
    if G.GAME.vagrancy_award and (not reset) and (not silent) then
        G.GAME.vagrancy_award = 0
    end
end

function Card:set_obedience(_obedience)
    self.ability.obedience = _obedience
end

local Card_get_end_of_round_effect_ref = Card.get_end_of_round_effect
function Card:get_end_of_round_effect(context)
    local Card_get_end_of_round_effect_val = Card_get_end_of_round_effect_ref(self, context)
    if self.ability.name == 'Obedience Card' and not self.debuff then
        G.E_MANAGER:add_event(Event({trigger = 'before', delay = 0.0, func = (function()
            local card = create_card('Tarot', G.consumeables, nil, nil, nil, nil, 'c_fool', 'obedience')
            card:set_edition({negative = true}, true)   
            card:set_obedience(true)
            card:set_cost()
            card:add_to_deck()
            G.consumeables:emplace(card)
        return true end)}))
        card_eval_status_text(self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.SECONDARY_SET.Tarot})
        Card_get_end_of_round_effect_val.effect = true
    end
    if self.ability.name == 'Vagrancy Card' and not self.debuff then
        ease_dollars(-3)
        G.GAME.vagrancy_award = (G.GAME.vagrancy_award or 0) + 2
        card_eval_status_text(self, 'extra', nil, nil, nil, {message = 'Super card pack!', colour = G.C.RED})
        G.GAME.vagrancy_award_complete = false
        Card_get_end_of_round_effect_val.effect = true
    end
    return Card_get_end_of_round_effect_val
end

SMODS.Atlas{
    key = 'enhancements',
    px = 71,
    py = 95,
    path = 'enhancements.png'
}

SMODS.Atlas{
    key = 'consumables',
    px = 71,
    py = 95,
    path = 'consumables.png'
}

SMODS.Enhancement{
    key = 'reward',
    unlocked = true,
    discovered = true,
    pos = { x = 9, y = 0 },
    loc_txt ={
        name = 'Bonus Cards',
        text = {
            '{X:chips,C:white}X#1#{}Chips',
        }
    },
    atlas = "enhancements",
    config = { Xchips = 2.5, extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.Xchips} }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Enhancement{
    key = 'aluminium',
    unlocked = true,
    discovered = true,
    pos = { x = 8, y = 0 },
    loc_txt ={
        name = 'Aluminum',
        text = {
            'This card is',
            'When left in hand',
            'Will give{X:chips,C:white}X#1#{}Chips',
        }
    },
    atlas = "enhancements",
    config = { h_x_chips = 2, extra = {} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.h_x_chips} }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Enhancement{
    key = 'obedience',
    name = 'Obedience Card',
    unlocked = true,
    discovered = true,
    pos = { x = 7, y = 1 },
    loc_txt ={
        name = 'Obedience Card',
        text = {
            'If this card',
            'Remain in hand at the end of the turn',
            'generate{C:attention}#1#{}open{C:dark_edition}negative{C:tarot}Fool',
        }
    },
    atlas = "enhancements",
    config = { extra = {amount = 1} },
    loc_vars = function(self, info_queue, card)
        return { vars = {self.config.extra.amount} }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Enhancement{
    key = 'vagrancy',
    name = 'Vagrancy Card',
    unlocked = true,
    discovered = true,
    pos = { x = 7, y = 0 },
    loc_txt ={
        name = 'Vagrancy Cards',
        text = {
            'This card was left',
            'Lose when in hand{C:money}$#1#{}',
            'give{X:chips,C:white}X#2#{}Chips',
            'If the card is still in hand at the end of the round',
            'Get two{C:green}random{C:attention}Super Booster Pack',
            '{C:inactive}（Every{C:red}Liabilities{C:money}$1{C:inactive}Increase{X:chips,C:white}X0.25{C:inactive}Chips）',
        }
    },
    atlas = "enhancements",
    config = { h_p_dollars = 3, h_x_chips = -1.25, extra = {} },
    loc_vars = function(self, info_queue, card)
        local money = 1.25
        if G.GAME.dollars and G.GAME.dollars < 0 then
            money = -((G.GAME.dollars/4) - money)
        end
        return { vars = {self.config.h_p_dollars, money} }
    end,
    calculate = function(self, card, context)
    end
}

SMODS.Consumable {
    key = 'artist',
    set = 'Tarot',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 3, y = 1 },
    loc_txt = {
        name = 'artist',
        text = {
            'Enhancement{C:attention}#1#{}open',
            'Select the card to become',
            '{C:attention}Bonus Cards{}or{C:attention}Aluminum'
        }
    },
    atlas = "consumables",
    config = { extra = {max_highlighted = 1} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bmen_reward
        info_queue[#info_queue+1] = G.P_CENTERS.m_bmen_aluminium
        return { vars = {self.config.extra.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
        return true end }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999)/(#G.hand.highlighted - 0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip()
                play_sound('card1', percent)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
            return true end }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local effect = math.random(1, 2)
                if effect == 1 then
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_bmen_reward, nil, nil)
                else
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_bmen_aluminium, nil, nil)
                end
            return true end }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999)/(#G.hand.highlighted - 0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip()
                play_sound('tarot2', percent, 0.6)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
            G.hand:unhighlight_all()
        return true end }))
        delay(0.5)
    end,      
    can_use = function(self, card)
        if self.config.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= (self.config.extra.min_highlighted or 1) then
            return true
        end
    end
}

SMODS.Consumable {
    key = 'void',
    set = 'Tarot',
    cost = 3,
    unlocked = true,
    discovered = true,
    pos = { x = 1, y = 1 },
    loc_txt = {
        name = 'nothingness',
        text = {
            'Enhancement{C:attention}#1#{}open',
            'Select the card to become',
            '{C:attention}Obedience Card{}or{C:attention}Vagrancy Cards'
        }
    },
    atlas = "consumables",
    config = { extra = {max_highlighted = 1} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_bmen_obedience
        info_queue[#info_queue+1] = G.P_CENTERS.m_bmen_vagrancy
        return { vars = {self.config.extra.max_highlighted} }
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
            play_sound('tarot1')
            card:juice_up(0.3, 0.5)
        return true end }))
        for i = 1, #G.hand.highlighted do
            local percent = 1.15 - (i - 0.999)/(#G.hand.highlighted - 0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip()
                play_sound('card1', percent)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
            return true end }))
        end
        delay(0.2)
        for i = 1, #G.hand.highlighted do
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                local effect = math.random(1, 2)
                if effect == 1 then
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_bmen_obedience, nil, nil)
                else
                    G.hand.highlighted[i]:set_ability(G.P_CENTERS.m_bmen_vagrancy, nil, nil)
                end
            return true end }))
        end
        for i = 1, #G.hand.highlighted do
            local percent = 0.85 + (i - 0.999)/(#G.hand.highlighted - 0.998)*0.3
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,func = function()
                G.hand.highlighted[i]:flip()
                play_sound('tarot2', percent, 0.6)
                G.hand.highlighted[i]:juice_up(0.3, 0.3)
            return true end }))
        end
        G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.2,func = function()
            G.hand:unhighlight_all()
        return true end }))
        delay(0.5)
    end,      
    can_use = function(self, card)
        if self.config.extra.max_highlighted >= #G.hand.highlighted and #G.hand.highlighted >= (self.config.extra.min_highlighted or 1) then
            return true
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------