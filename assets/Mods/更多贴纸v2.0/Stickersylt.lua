--- STEAMODDED HEADER
--- MOD_NAME: stickersylt
--- MOD_ID: stickersylt
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds interesting stickers
--- BADGE_COLOUR: 00009C
--- PRIORITY: 100

SMODS.Atlas {  
    key = 'stickersylt',
    px = 71,
    py = 95,
    path = 'stickersylt.png'
}

SMODS.Sticker {
	key = "wall",
	loc_txt = {
            name = "Hoarding",
            text = {
                "When selecting {C:attention}Boss blind{}",
                "Score requirement {C:mult}X4",
                "At the end of each round, you will get {C:money}$8"
            },
        label = "Hoarding",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 0, y = 0 },
    order = 1,
	badge_colour = HEX 'dbdb70',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.end_of_round and not (context.individual or context.repetition) then
            ease_dollars(8)
            card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "+$8", colour = G.C.MONEY})
        end
        if context.setting_blind and context.blind.boss then
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.1,func = function()
                G.GAME.blind.chips = math.floor(G.GAME.blind.chips * 4)
                G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
                
                local chips_UI = G.hand_text_area.blind_chips
                G.FUNCS.blind_chip_UI_scale(G.hand_text_area.blind_chips)
                G.HUD_blind:recalculate() 
                chips_UI:juice_up()

                return true end }))
        end
    end
}

SMODS.Sticker {
	key = "overreroll",
	loc_txt = {
            name = "heavy",
            text = {
                "When playing a high card",
                "Reroll cost for this round",
                "Permanently increase {C:money}$1{}"
            },
        label = "heavy",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 1, y = 0 },
    order = 2,
	badge_colour = HEX '5c4033',
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == "High Card" then
                G.E_MANAGER:add_event(Event({func = function()
                    G.GAME.round_resets.reroll_cost = G.GAME.round_resets.reroll_cost + 1
                    G.GAME.current_round.reroll_cost = math.max(0, G.GAME.current_round.reroll_cost + 1)
                    return true end }))
            end
        end
    end
}

SMODS.Sticker {
	key = "mplanet",
	loc_txt = {
            name = "MSI",
            text = {
                "When skipping the {C:attention} booster pack{}",
                "Generate a {C:planet} planet card{}",
                "{C:inactive}(There must be space!){}",
            },
        label = "微星",
    },
	rate = 0.002,
    atlas = 'stickersylt',
	pos = { x = 2, y = 0 },
    order = 3,
	badge_colour = HEX("70dbdb"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.skipping_booster and not context.blueprint then
            if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                            local tarot = create_card('Planet',G.consumeables, nil, nil, nil, nil, nil, 'mpl')
                            tarot:add_to_deck()
                            G.consumeables:emplace(tarot)
                            G.GAME.consumeable_buffer = 0
                        return true
                    end)}))
                card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_planet'), colour = G.C.BLUE})
            end
        end
    end
}

SMODS.Sticker {
	key = "splucky",
	loc_txt = {
            name = "gamble",
            text = {
                "Each card played counts",
                "{C:attention}Lucky cards {} will make",
                "The price of this card has increased by {C:money}$7",
                "When you have a {C:attention} steel card{} in your hand",
                "You lose all your funds",
            },
        label = "gamble",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 3, y = 0 },
    order = 4,
	badge_colour = HEX("8e6b23"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card.ability.effect == "Lucky Card" then
                card.ability.extra_value = card.ability.extra_value + 7
			    card:set_cost()
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_val_up'), colour = G.C.MONEY})
			end
        end
        if context.cardarea == G.hand and context.individual and not context.end_of_round then
            if context.other_card.ability.effect == "Steel Card" then
                ease_dollars(-G.GAME.dollars, true)
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "归零!"..G.GAME.dollars, colour = G.C.MONEY})
            end
        end
    end
}

SMODS.Sticker {
	key = "shadow",
	loc_txt = {
            name = "shadow",
            text = {
                "After playing {C:attention} flush {}",
                "Lower the rank of all cards",
                "When playing a straight",
                "All {C:hearts} hearts in the deck",
                "Get {C:chips}+1 extra chip{}",
            },
        label = "shadow",
    },
	rate = 0.001,
    atlas = 'stickersylt',
	pos = { x = 4, y = 0 },
    order = 5,
	badge_colour = HEX("00009c"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        if context.joker_main and context.cardarea == G.jokers then
            if context.scoring_name == "Flush" then
                for k, v in pairs(G.GAME.hands) do
                    level_up_hand(card, k, true, -1)
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "降低牌型等级", colour = G.C.MULT})
            end
            if context.scoring_name == "Straight" then
                for k, v in pairs(G.playing_cards) do
                    if v:is_suit('Hearts') then
                        v.ability.perma_bonus = v.ability.perma_bonus or 0
                        v.ability.perma_bonus = v.ability.perma_bonus + 1
                    end
                end
                card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = "红桃获得筹码", colour = G.C.CHIPS})
            end
        end
    end
}

SMODS.Sticker {
	key = "sppinned",
	loc_txt = {
            name = "Heresy",
            text = {
                "This card is added {C:attention} fixed{}",
                "Generates at the end of each round",
                "A {C:dark_edition}negative of the {C:tarot}Wheel of Fortune",
            },
        label = "Heresy",
    },
	rate = 0.002,
    atlas = 'stickersylt',
	pos = { x = 1, y = 2 },
    order = 6,
	badge_colour = HEX("8e2323"),
	default_compat = true,
	compat_exceptions = {},
	sets = { Joker = true },
	needs_enable_flag = false,
    calculate = function(self, card, context)
        card.pinned = true
        if context.end_of_round and not (context.individual or context.repetition) then
            G.E_MANAGER:add_event(Event({
                trigger = 'before',
                delay = 0.0,
                func = (function()
                        local _card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, 'c_wheel_of_fortune', 'spp')
                        _card:set_edition({negative = true}, true)
                        _card:add_to_deck()
                        G.consumeables:emplace(_card)
                    return true
                end)}))
        end
    end
}
----------------------------------------------
------------MOD CODE END----------------------
