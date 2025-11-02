--- STEAMODDED HEADER
--- MOD_NAME: EWF_Jokers
--- MOD_ID: EWF_Jokers
--- MOD_AUTHOR: [EWF]
--- MOD_DESCRIPTION: Adds some jokers to the game.

----------------------------------------------
------------MOD CODE -------------------------

local MOD_ID = "EWF_Jokers";

-- Thanks chariart, Limofeus, Pop Shop Packs, Lorc, TeamPhoenix, Extremely OK Games, Nikita Kryukov and Deconstructeam !
-- https://chariart.itch.io/witchkitty
-- https://limofeus.itch.io/40-random-items
-- https://pop-shop-packs.itch.io/tea-cups-free-2d-pixel-asset-pack
-- https://game-icons.net/1x1/lorc/moebius-triangle.html
-- https://teamphoenix.itch.io/2d-medieval-modular-characters-pack
-- https://store.steampowered.com/app/504230/Celeste/
-- https://store.steampowered.com/app/1392820/Milk_inside_a_bag_of_milk_inside_a_bag_of_milk/
-- https://store.steampowered.com/app/1340480/The_Cosmic_Wheel_Sisterhood/


function calculateAge(birthDate) --calculate age
    local currentTime = os.time()
    local birthTime = os.time{year=birthDate.year, month=birthDate.month, day=birthDate.day}
    
    local ageInSeconds = currentTime - birthTime
    local ageInYears = math.floor(ageInSeconds / (60*60*24*365.25)) -- учитываем високосные года
    
    return ageInYears
	end

    birthDate = {year=1994, month=5, day=14} -- с днём рождения! даже если он уже прошёл :)
				age = calculateAge(birthDate)

function destroyCard(self,sound)
    G.E_MANAGER:add_event(Event({
        func = function()
            play_sound(sound, math.random()*0.2 + 0.9,0.5)
            self.T.r = -0.2
            self:juice_up(0.3, 0.4)
            self.states.drag.is = true
            self.children.center.pinch.x = true
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.3, blockable = false,
                func = function()
                        G.jokers:remove_card(self)
                        self:remove()
                        self = nil
                    return true; end})) 
            return true
        end
    })) 
    self.gone = true
end

function shakecard(self)
    G.E_MANAGER:add_event(Event({
        func = function()
            self:juice_up(0.5, 0.5)
            return true
        end
    }))
end
function fakemessage(_message,_card,_colour)
    G.E_MANAGER:add_event(Event({ trigger = 'after',delay = 0.15,       
        func = function() card_eval_status_text(_card, 'extra', nil, nil, nil, {message = _message, colour = _colour, instant=true}); return true
        end}))
    return
end


function poll_enhancement(seed)
    local enhancements = {}
    --add all enhancements but m_stone to list
    for k, v in pairs() do
        if v.key ~= 'm_stone' then 
            enhancements[#enhancements+1] = v
        end
    end
    return pseudorandom_element(enhancements, pseudoseed(seed))
end

function poll_seal(seed)
    local seals = {}
    for k, v in pairs(G.P_SEALS) do
        seals[#seals+1] = v
    end
    return pseudorandom_element(seals, pseudoseed(seed)).key
end

function poll_FromTable(_table,seed,filter)
    local items = {}    
    for k, v in pairs(_table) do
        if v.key ~= filter then
            items[#items+1] = v
        end        
    end
    return pseudorandom_element(items, pseudoseed(seed))
end


    --G.P_TAGS 
    --G.P_CARDS
    --G.P_SEALS
function randomFromTable(source)
    local keys = {} 
    for k in pairs(source) do
        table.insert(keys, k)
    end    
    local choiceIndex = math.random(1,#keys) 
    local choiceKey = keys[choiceIndex] 
    local choice = source[choiceKey]
    return {key = choiceKey, value = choice}
end


function addjoker(joker)
    local card = create_card('Joker', G.jokers, nil, 0, nil, nil, joker, nil)
    card:add_to_deck()
    G.jokers:emplace(card)
    G.GAME.used_jokers[joker] = true
end



local jokers = {
      WitchKitty = {
        name = "Witch Kitty",
        text = {
            "Each scored {C:attention}9{}",			
			"adds {X:mult,C:white}x1.5{} Mult",
			
		},
		ability = {extra={x_mult=1.5, counter=0}},
		pos = { x = 0, y = 0 },
        rarity=2,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
            if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 9) then
                return {
                message = localize{type='variable',key='a_xmult',vars={self.ability.extra.x_mult}},
                x_mult = self.ability.extra.x_mult,
                card = self
                }
            end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.x_mult, self.ability.extra.counter}
        end        
	},
	FastWatch = {
        name = "Fast Watch",
        text = {
            "{C:chips}+Chips{} of {C:attention}minute at which past round ended * 2{}",
			"{C:inactive}(Currently {C:chips}+#1#{} Chips)",
		},
		ability = {extra={chips=0, counter=0}},
		pos = { x = 1, y = 0 },
		chip_mod = 0,
        rarity=1,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
		if context.other_joker then      
                if context.other_joker == self then
                    return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                    chip_mod = self.ability.extra.chips
                    }
                end 
            end
		if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
                self.ability.extra.chips=os.date("%M")*2
				self.text = {
				"{C:chips,s:1.1}+"..tostring((os.date("%M")*2)).."{} current minutes chips",
				}
				return {
                    message = 'tick-tick',
                    colour = G.C.RED,
                    card = self
                    }
            end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.chips, self.ability.extra.counter}
        end        
	},
	PixelTea = {
        name = "Tea Time",
        text = {
            "{C:mult}+"..tostring(age).."{} number of years since mid-May 1994",			
		},
		ability = {extra={mult=age, counter=0}},
		pos = { x = 2, y = 0 },
		mult_mod = age,
        rarity=2,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
		
		if context.other_joker then      
                if context.other_joker == self then
                    return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                    mult_mod = self.ability.extra.mult
                    }
                end 
            end
		
            
        end,
        loc_def=function(self)
            return {self.ability.extra.mult, self.ability.extra.counter}
        end        
	},
	Triangle = {
        name = "Triangle",
        text = {
            "Each scored {C:attention}3{}",			
			"adds {C:mult}+3{} Mult,",
			"and Joker adds +3 Mult if played hand contains",
			"{C:attention}Three of a Kind{}",
		},
		ability = {
            extra={mult=3} ,
        },
		pos = { x = 3, y = 0 },
        rarity=1,
        cost = 4,
		mult_mod = 0,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
            if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 3) then
                return {
                message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                mult = self.ability.extra.mult,
                card = self
                }
            end
			
			if context.cardarea==G.jokers and context.before and next(context.poker_hands['Three of a Kind']) then
			--if context.other_joker then      
                --if context.other_joker == self then
                    return {
                    message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                    mult_mod = self.ability.extra.mult
                    }
                --end 
           -- end
			end
			
			if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
                mult_mod = 0
            end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.mult, self.ability.extra.counter}
        end        
	},
	EndlessEight = {
        name = "Endless Eight",
        text = {
            "Each scored {C:attention}8{}",			
			"adds a copy of itself to your hand",
			
		},
		ability = {extra={x_mult=1.5, counter=0}},
		pos = { x = 4, y = 0 },
        rarity=2,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
            if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 8) then
              --[[  G.E_MANAGER:add_event(Event({
                    --trigger = 'after',
                    delay = 0.1,
                    func = function()
                        local _suit, _rank = nil, nil
                        _rank = '8'
                        _suit = pseudorandom_element({'S','H','D','C'}, pseudoseed('endless')) --context.other_card:is_suit
                        local cen_pool = {}
                        for k, v in pairs(G.P_CENTER_POOLS["Demo"]) do
                            if v.key ~= 'm_stone' then 
                                cen_pool[#cen_pool+1] = v
                            end
                        end
                        local card = create_playing_card({front = G.P_CARDS[_suit..'_'.._rank], center = G.P_CENTERS.c_base}, G.hand, nil, false, {G.C.SECONDARY_SET.Spectral})
                        playing_card_joker_effects({card})
                        return true end })) --]]
						
						
						
--if #context.full_hand == 1 then
                            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                            local _card = copy_card(context.other_card, nil, nil, G.playing_card)
                            _card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, _card)
                            G.hand:emplace(_card)
                            _card.states.visible = nil

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    _card:start_materialize()
                                    return true
                                end
                            })) 
                            return {
                                message = localize('k_copied_ex'),
                                colour = G.C.CHIPS,
                                card = self,
                                playing_cards_created = {true}
                            }
                        --end
						
            end
            
			
			
        end,
        loc_def=function(self)
            return {self.ability.extra.x_mult, self.ability.extra.counter}
        end        
	},
	BinaryCode = {
        name = "Binary Code",
        text = {
            "Each scored {C:attention}10{}",			
			"with {C:green}#1# in #2#{} chance {C:green}",
			"adds {C:mult}+10{} Mult,",
		},
		ability = {
            extra={ mult=10 }--odds = 2, },
        },
		--config = {
        --    extra = { odds = 2 }
        --},
		pos = { x = 5, y = 0 },
        rarity=1,
        cost = 4,
		mult_mod = 0,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
            if context.individual and context.cardarea == G.play and (context.other_card:get_id() == 10) and pseudorandom('binary') < G.GAME.probabilities.normal/2 then
                return {
                message = localize{type='variable',key='a_mult',vars={self.ability.extra.mult}},
                mult = self.ability.extra.mult,
                card = self
                }
            end
			
			
            
        end,
        loc_def=function(self)
            return {''..(G.GAME and G.GAME.probabilities.normal or 1), 2, self.ability.extra.mult}
        end        
	},
	Noble = {
        name = "Noble",
        text = {
            "Gains {C:chips}+5{} chips for each {C:attention}jack{}",
			"held in hand on every played hand",
			"{C:inactive}(Currently {C:chips}+#1#{} Chips)",			
		},
		ability = {extra={chips=0}},
		pos = { x = 6, y = 0 },
		chip_mod = 0,
        rarity=1,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
		if context.individual and context.cardarea == G.hand and (context.other_card:get_id() == 11) and not context.end_of_round then     
                         if  context.other_card.debuff then
							return {
                                message = localize('k_debuffed'),
                                colour = G.C.RED,
                                card = self,
                            }
                        else
						self.ability.extra.chips = self.ability.extra.chips + 5
                            return {
							    message = localize{type='variable',key='a_chips',vars={5}},
                               
                                card = self
                            }
                        end
						end
						

						
						if context.other_joker then      
					if context.other_joker == self then
                    return {
                    message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips}},
                    chip_mod = self.ability.extra.chips,
                    }
					end 
					end
                    
				-- if context.after and not (context.individual or context.repetition or context.blueprint) then
                -- chip_mod = 0
				-- end
                    
           -- end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.chips}
        end        
	},
	GoldenStrawberry = {
        name = "Golden Strawberry",
        text = {
            "At the end of a {C:attention}round{} you gain {C:money}${},",			
			"equal count of {C:attention}High Card{} played",
			"{C:inactive}(Currently {C:money}+#1#{} dollars)",
		},
		ability = {
            extra={dollars=0} ,
        },
		pos = { x = 7, y = 0 },
        rarity=2,
        cost = 4,
		mult_mod = 0,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
			
			if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
				self.ability.extra.dollars = G.GAME.hands['High Card'].played
				ease_dollars(self.ability.extra.dollars)
                G.GAME.dollar_buffer = (G.GAME.dollar_buffer or 0) + self.ability.extra.dollars
                return {
				message = localize('$')..self.ability.extra.dollars,
                        colour = G.C.MONEY,
                        delay = 0.45, 
                        remove = true,
                        card = self
				}
				
            end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.dollars}
        end        
	},
	MilkInside = {
        name = "Milk inside a bag of milk inside a bag of milk ...",
        text = {
			"{C:chips}+#1#{} Chips {C:attention}squared{}",
            "At the end of a {C:attention}round{} gains {C:chips}+1{},",
			"{C:inactive}(Currently {C:chips}+#2#{} Chips)",			
		},
		ability = {extra={chips=1}},
		pos = { x = 8, y = 0 },
		chip_mod = 1,
        rarity=1,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
		
						

						
					if context.other_joker then      
					if context.other_joker == self then
                    return {
                    chip_mod = self.ability.extra.chips^2,
					message = localize{type='variable',key='a_chips',vars={self.ability.extra.chips^2}},
                    }
					end 
					end
                    
					if context.end_of_round and not (context.individual or context.repetition or context.blueprint) then
					self.ability.extra.chips = self.ability.extra.chips + 1
					return {
                    message = 'O!',
                    colour = G.C.Blue,
                    card = self
                    }
					end
					
				-- if context.after and not (context.individual or context.repetition or context.blueprint) then
                -- chip_mod = 0
				-- end
                    
           -- end
            
        end,
        loc_def=function(self)
            return {self.ability.extra.chips, self.ability.extra.chips^2}
        end        
	},
	Fortuna = {
        name = "Fortuna",
        text = {
            "Create {C:attention}2{} random {C:tarot}Tarot{} card (may exceed the limit)",			
			"after skipping each blind",
			
		},
		ability = {extra={}},
		pos = { x = 9, y = 0 },
        rarity=2,
        cost = 4,
        blueprint_compat=true,
        eternal_compat=true,
        effect=nil,
        soul_pos=nil,
        calculate = function(self,context)
            if context.skip_blind and not (context.blueprint_card or self).getting_sliced then
			G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 2
			G.E_MANAGER:add_event(Event({
                    func = (function()
                G.E_MANAGER:add_event(Event({
                    func = (function()
                        G.E_MANAGER:add_event(Event({
                            func = function() 
                                local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'for')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
								local card = create_card('Tarot',G.consumeables, nil, nil, nil, nil, nil, 'tuna')
                                card:add_to_deck()
                                G.consumeables:emplace(card)
                                G.GAME.consumeable_buffer = 0
                                return true
                            end}))   
                            card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})                       
                        return true
                    end)}))
					card_eval_status_text(context.blueprint_card or self, 'extra', nil, nil, nil, {message = localize('k_plus_tarot'), colour = G.C.PURPLE})
					return true
                    end)}))
            end
            
        end,
        loc_def=function(self)
            return {}
        end        
	},
	}
	
	function SMODS.INIT.EWF_Jokers()
	
    init_localization()

    --Create and register jokers
    for k, v in pairs(jokers) do
		
        local joker = SMODS.Joker:new(v.name, k, v.ability, v.pos, { name = v.name, text = v.text }, v.rarity, v.cost, true, true, v.blueprint_compat, v.eternal_compat, v.effect, "EWF_Jokers", v.soul_pos)
        -- SMODS.Joker:new(name, slug, config, spritePos, tloc_tx, rarity, cost, unlocked, discovered, blueprint_compat, eternal_compat, effect, atlas, soul_pos)
        joker:register()
        --added calculate function into jokers to make code cleaner
        SMODS.Jokers[joker.slug].calculate=v.calculate
        --added loc_def function into jokers to make code cleaner
        SMODS.Jokers[joker.slug].loc_def=v.loc_def
        if(v.tooltip ~= nil) then
            SMODS.Jokers[joker.slug].tooltip=v.tooltip
        end
    end
    --Create sprite atlas
    SMODS.Sprite:new("EWF_Jokers", SMODS.findModByID("EWF_Jokers").path, "EWF_Jokers.png", 71, 95, "asset_atli"):register()
end	


----------------------------------------------
------------MOD CODE END----------------------
