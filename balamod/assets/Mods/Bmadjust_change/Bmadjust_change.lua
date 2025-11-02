--- STEAMODDED HEADER
--- MOD_NAME: Bmadjust_change
--- MOD_ID: Bmadjust_change
--- MOD_AUTHOR: [BaiMao]
--- MOD_DESCRIPTION: Adjust and modify the original content
--- BADGE_COLOUR: D9D919
--- PRIORITY: 1000
--- VERSION: 1.0.8
----------------------------------------------
------------MOD CODE -------------------------

    local function juice_flip(used_tarot)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                used_tarot:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.hand.cards do
            local percent = 1.15 - (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.hand.cards[i]:flip(); play_sound('card1', percent); G.hand.cards[i]:juice_up(0.3, 0.3); return true
                end
            }))
        end
    end
    SMODS.Consumable:take_ownership('ouija', {
        use = function(self, card, area, copier)
            local used_tarot = copier or card
            juice_flip(used_tarot)
            local _rank = pseudorandom_element(SMODS.Ranks, pseudoseed('ouija'))
            for i = 1, #G.hand.cards do
                G.E_MANAGER:add_event(Event({
                    func = function()
                        local _card = G.hand.cards[i]
                        assert(SMODS.change_base(_card, nil, _rank.key))
                        return true
                    end
                }))
            end
            G.hand:change_size(1)
            for i = 1, #G.hand.cards do
                local percent = 0.85 + (i - 0.999) / (#G.hand.cards - 0.998) * 0.3
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.15,
                    func = function()
                        G.hand.cards[i]:flip(); play_sound('tarot2', percent, 0.6); G.hand.cards[i]:juice_up(0.3, 0.3); return true
                    end
                }))
            end
            delay(0.5)
        end,
    })

function find_chicot(name, non_debuff)
    local jokers = {}
    if not G.jokers or not G.jokers.cards then return {} end
    for k, v in pairs(G.jokers.cards) do
        if v and type(v) == 'table' and v.ability.name == name and v.ability.retriggers == 0 and (non_debuff or not v.debuff) then
            table.insert(jokers, v)
        end
    end
    return jokers
end

local Blind_set_blind_ref = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    local cc = find_chicot("Chicot")
    if cc and #cc == 1 and not reset then
        self.config.prize = nil
        if blind then
            self.in_blind = true
        end
        self.config.blind = blind or {}
        self.name = blind and blind.name or '' --'Small Blind'
        self.dollars = blind and blind.dollars or 0
        self.sound_pings = self.dollars + 2
        if G.GAME.modifiers.no_blind_reward and G.GAME.modifiers.no_blind_reward[self:get_type()] then self.dollars = 0 end
        self.debuff = blind and blind.debuff or {} --'Small Blind'
        self.pos = blind and blind.pos
        self.mult = blind and blind.boss and 1 or blind and blind.mult or 0 --'Small Blind'
        self.disabled = blind and blind.boss and true --'Small Blind'
        self.discards_sub = 0
        self.hands_sub = 0
        self.boss = blind and not not blind.boss --'Small Blind'
        self.blind_set = false
        self.triggered = nil
        self.prepped = true
        self:set_text()

        local obj = self.config.blind --'Small Blind'
        self.children.animatedSprite.atlas = G.ANIMATION_ATLAS[obj.atlas] or G.ANIMATION_ATLAS['blind_chips']
        G.GAME.last_blind = G.GAME.last_blind or {}
        G.GAME.last_blind.boss = self.boss
        G.GAME.last_blind.name = self.name

        if blind and blind.name then
            self:change_colour()
        else
            self:change_colour(G.C.BLACK)
        end

        self.chips = get_blind_amount(G.GAME.round_resets.ante)*self.mult*G.GAME.starting_params.ante_scaling
        self.chip_text = number_format(self.chips)

        if not blind then self.chips = 0 end

        G.GAME.current_round.dollars_to_be_earned = self.dollars > 0 and (string.rep(localize('$'), self.dollars)..'') or ('')
        G.HUD_blind.alignment.offset.y = -10
        G.HUD_blind:recalculate(false)

        if blind and blind.name and blind.name ~= '' then
            G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.05,blockable = false,func = (function()
                G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = false
                G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = false
                G.HUD_blind.alignment.offset.y = 0
                G.E_MANAGER:add_event(Event({trigger = 'after',delay = 0.15,blockable = false,func = (function()
                    G.HUD_blind:get_UIE_by_ID("HUD_blind_name").states.visible = true
                    G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").parent.parent.states.visible = true
                    G.HUD_blind:get_UIE_by_ID("dollars_to_be_earned").config.object:pop_in(0)
                    G.HUD_blind:get_UIE_by_ID("HUD_blind_name").config.object:pop_in(0)
                    G.HUD_blind:get_UIE_by_ID("HUD_blind_count"):juice_up()
                    self.children.animatedSprite:set_sprite_pos(self.config.blind.pos)
                    self.blind_set = true
                    G.ROOM.jiggle = G.ROOM.jiggle + 3
                    if not reset and not silent then
                        self:juice_up()
                        if blind then
                            play_sound('chips1', math.random()*0.1 + 0.55, 0.42);play_sound('gold_seal', math.random()*0.1 + 1.85, 0.26)
                        end
                    end
                return true end)}))
            return true end)}))
        end
        self.config.h_popup_config = {align="tm", offset = {x=0,y=-0.1}, parent = self}
        G.ARGS.spin.real = (G.SETTINGS.reduced_motion and 0 or 1)*(self.config.blind.boss and (self.config.blind.boss.showdown and 0.5 or 0.25) or 0)
    else
        Blind_set_blind_ref(self, blind, reset, silent)
    end
end

local Blind_disable_ref = Blind.disable
function Blind:disable()
    local cc = find_chicot("Chicot")
    if cc and #cc == 1 then
        return
    else
        Blind_disable_ref(self)
    end
end

local ease_dollars_ref = ease_dollars
function ease_dollars(mod, instant)
    if mod > 0 then
        G.GAME.round_ease = (G.GAME.round_ease or 0) + mod
    end
    for i = 1, #G.jokers.cards do
        G.jokers.cards[i]:calculate_joker({ease_dollars = true, mod = mod})
    end
    ease_dollars_ref(mod, instant)
end

local G_FUNCS_cash_out_ref = G.FUNCS.cash_out
G.FUNCS.cash_out = function(e)
    G_FUNCS_cash_out_ref(e)
    for i = 1, #G.jokers.cards do
        G.jokers.cards[i]:calculate_joker({cash_out = true})
    end
    G.GAME.round_ease = 0
end

local generate_UIBox_ability_table_ref = Card.generate_UIBox_ability_table
function Card:generate_UIBox_ability_table()
    local generate_UIBox_ability_table_val = generate_UIBox_ability_table_ref(self)
    if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and self.pinned and not self.debuff then
        generate_card_ui({key = 'pinned_hand', set = 'Other'}, generate_UIBox_ability_table_val)
    end
    if (self.ability.set == 'Default' or self.ability.set == 'Enhanced') and self.pinned then
        local badges = generate_UIBox_ability_table_val.badges
        badges[#badges + 1] = 'pinned_left'
    end
    return generate_UIBox_ability_table_val
end

local Card_add_to_deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    Card_add_to_deck_ref(self, from_debuff)
    if not self.added_to_deck then
        if self.ability.name == 'Chicot' then
            G.GAME.modifiers.scaling = 1
            G.GAME.round_resets.blind_ante = G.GAME.round_resets.blind_ante or G.GAME.round_resets.ante
        end
    end
end

----------------------------------------------
------------MOD CODE END----------------------