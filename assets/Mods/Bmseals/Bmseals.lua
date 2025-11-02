--- STEAMODDED HEADER
--- MOD_NAME: Bmseals
--- MOD_ID: Bmseals
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Create more seals
--- BADGE_COLOUR: D9D919
--- VERSION: 1.0.4h
----------------------------------------------
------------MOD CODE -------------------------

SMODS.Atlas {
    key = "deongaree",
    path = "deongaree.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "grey",
    path = "grey.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "silver",
    path = "silver.png",
    px = 71,
    py = 95
}

SMODS.Atlas {
    key = "peagreen",
    path = "peagreen.png",
    px = 71,
    py = 95
}

SMODS.Seal {
    key = 'deongaree',
    badge_colour = HEX("6891f2"),
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    loc_txt ={
        label = 'Dark blue seal',
        name = 'Dark blue seal',
        text = {
            'This card is played',
            'And score time',
            'Lift{C:attention}#1#{}Level',
            '{C:attention}Hand level{}'
        }
    },
    atlas = "deongaree",
    config = { extra = {level = 1} },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.extra.level} }
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.play then
            level_up_hand(card, context.scoring_name, nil, self.config.extra.level)
            return true
        end
    end
}

SMODS.Seal {
    key = 'grey',
    badge_colour = HEX("67748a"),
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    loc_txt ={
        label = 'Gray seal',
        name = 'Gray seal',
        text = {
            'When this card is discarded',
            'If this round{C:attention}First hand{}',
            'And only this card is discarded',
            'Get one{C:spectral}Phantom Cards{}',
            '{C:inactive}（There must be space）'
        }
    },
    atlas = "grey",
    config = { extra = {} },
    loc_vars = function(self, info_queue)
        return { vars = {} }
    end,
    calculate = function(self, card, context)
        if context.discard then
            if G.GAME.current_round.discards_used <= 0 and #context.full_hand == 1 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    G.E_MANAGER:add_event(Event({trigger = 'before',delay = 0.0,func = (function()
                        local card = create_card('Spectral',G.consumeables, nil, nil, nil, nil, nil, 'gre')
                        card:add_to_deck()
                        G.consumeables:emplace(card)
                        G.GAME.consumeable_buffer = 0
                    return true end)}))
                    card_eval_status_text(card, 'extra', nil, nil, nil, {message = localize('k_plus_spectral'), colour = G.C.SECONDARY_SET.Spectral})
                end
            end
        end
    end
}

SMODS.Seal {
    key = 'silver',
    badge_colour = HEX("c4cee3"),
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    loc_txt ={
        label = 'Silver seal',
        name = 'Silver seal',
        text = {
            'When this card is discarded',
            'like{C:attention}only{}The card is discarded',
            'Destroy this card and',
            'get{C:money}$#1#{}'
        }
    },
    atlas = "silver",
    config = { extra = {dollar = 25} },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.extra.dollar} }
    end,
    calculate = function(self, card, context)
        if context.pre_remove and #context.full_hand == 1 then
            ease_dollars(self.config.extra.dollar)
            return {
                message = localize('$')..self.config.extra.dollar,
                colour = G.C.MONEY,
                delay = 0.45, 
                remove = true,
                card = self
            }
        end
    end
}

SMODS.Seal {
    key = 'peagreen',
    badge_colour = HEX("b6ed8a"),
    unlocked = true,
    discovered = true,
    pos = { x = 0, y = 0 },
    loc_txt ={
        label = 'Light green seal',
        name = 'Light green seal',
        text = {
            'This card is played',
            'And score time',
            'Discard times{C:red}+#1#{}',
            'quilt{C:attention}Discard{}hour',
            'Number of cards played{C:red}+#2#{}'
        }
    },
    atlas = "peagreen",
    config = { extra = {discard = 1, hands_played = 1} },
    loc_vars = function(self, info_queue)
        return { vars = {self.config.extra.discard, self.config.extra.hands_played} }
    end,
    calculate = function(self, card, context)
        if not context.repetition_only and not context.before and context.cardarea == G.play then
            ease_discard(self.config.extra.discard, nil, nil)
        end
        if not context.repetition_only and context.discard then
            ease_hands_played(self.config.extra.hands_played, nil)
        end
    end
}

----------------------------------------------
------------MOD CODE END----------------------