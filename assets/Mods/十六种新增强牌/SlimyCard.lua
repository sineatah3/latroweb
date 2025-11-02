--- STEAMODDED HEADER
--- MOD_NAME: Slimy Card
--- MOD_ID: SlimyCard
--- MOD_AUTHOR: [Nrio]
--- MOD_DESCRIPTION: Adds Slimy Card and The Rebirth. It is based on JellyTarots from Jellymods but not compatible

----------------------------------------------
------------MOD CODE -------------------------


function SMODS.INIT.JellyTarots()
    sendDebugMessage("Loaded JellyTarots~")
    local enhance_localization = {
        m_slimy = {
            name = "Slime Cards",
                text = {
                   "When being scored",
                   "There is a {C:green}#1#/#2#{} chance",
                    "Temporary {C:red}+#3#{} times of discarding cards",
       },
       },
    }

    updateLocalizationJelly(enhance_localization, "Enhanced")

    local enhancements = {
        m_slimy = {max = 500, order = 10, name = "Slimy Card", set = "Enhanced", pos = {x=0,y=0}, effect = "Slimy Card", label = "Slimy Card", config = {extra = 4}},
    }

    SMODS.Sprite:new("Slimy", SMODS.findModByID("SlimyCard").path, "Slimy Card.png", 71, 95, "asset_atli")
    :register()
    addEnhancementsToPools(enhancements, "Slimy")
    local rebirth_tarot_def = {
        name = "newborn",
        text = {
            "Enhanced {C:attention}#1#{}",
            "Select the card to become",
            "{C:attention}#2#"
        }
    }

    local rebirth_tarot = SMODS.Tarot:new("The Rebirth", "rebirth_tarot", {mod_conv = 'm_slimy', max_highlighted = 1}, { x = 0, y = 0 }, rebirth_tarot_def, 3, 1.0, "Suit Conversion", true, true)
    SMODS.Sprite:new("c_rebirth_tarot", SMODS.findModByID("SlimyCard").path, "c_rebirth_tarot.png", 71, 95, "asset_atli"):register();
    rebirth_tarot:register()
end

function updateLocalizationJelly(localizationTable, cardType)
  for k, v in pairs(localizationTable) do
    G.localization.descriptions[cardType][k] = v
  end
  
  -- Update localization
  for g_k, group in pairs(G.localization) do
      if g_k == 'descriptions' then
          for _, set in pairs(group) do
              for _, center in pairs(set) do
                  center.text_parsed = {}
                  for _, line in ipairs(center.text) do
                      center.text_parsed[#center.text_parsed + 1] = loc_parse_string(line)
                  end
                  center.name_parsed = {}
                  for _, line in ipairs(type(center.name) == 'table' and center.name or {center.name}) do
                      center.name_parsed[#center.name_parsed + 1] = loc_parse_string(line)
                  end
                  if center.unlock then
                      center.unlock_parsed = {}
                      for _, line in ipairs(center.unlock) do
                          center.unlock_parsed[#center.unlock_parsed + 1] = loc_parse_string(line)
                      end
                  end
              end
          end
      end
  end
end

function addEnhancementsToPools(enhanceTable, atlas)
    -- Add Jokers to center
    for k, v in pairs(enhanceTable) do
        v.key = k
        if atlas then v.atlas = atlas end
        v.order = table_length(G.P_CENTER_POOLS['Enhanced']) + v.order
        G.P_CENTERS[k] = v
        table.insert(G.P_CENTER_POOLS['Enhanced'], v)
    end
  
    table.sort(G.P_CENTER_POOLS["Enhanced"], function(a, b)
        return a.order < b.order
    end)
end

local eval_card_ref=eval_card
function eval_card(card, context)
	if context.cardarea == G.play and not context.repetition_only and not card.debuff and card.ability.name == 'Slimy Card' then
		if pseudorandom('sample') < G.GAME.probabilities.normal/card.ability.extra then
			ease_discard(1)
		end
	end
	return eval_card_ref(card,context)
end

local generate_card_ui_ref = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end)
    local customCard = false
    if _c.name == 'Slimy Card' or _c.name == 'The Rebirth' then
        customCard = true
    end
    if not customCard then return generate_card_ui_ref(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end) end
    local first_pass = nil
    if not full_UI_table then 
        first_pass = true
        full_UI_table = {
            main = {},
            info = {},
            type = {},
            name = nil,
            badges = badges or {}
        }
    end

    local desc_nodes = (not full_UI_table.name and full_UI_table.main) or full_UI_table.info
    local name_override = nil
    local info_queue = {}

    if full_UI_table.name then
        full_UI_table.info[#full_UI_table.info+1] = {}
        desc_nodes = full_UI_table.info[#full_UI_table.info]
    end

    if not full_UI_table.name then
        if specific_vars and specific_vars.no_name then
            full_UI_table.name = true
        elseif card_type == 'Locked' then
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'locked', nodes = {}}
        elseif card_type == 'Undiscovered' then 
            full_UI_table.name = localize{type = 'name', set = 'Other', key = 'undiscovered_'..(string.lower(_c.set)), name_nodes = {}}
        elseif specific_vars and (card_type == 'Default' or card_type == 'Enhanced') then
            if (_c.name == 'Stone Card') then full_UI_table.name = true end
            if (specific_vars.playing_card and (_c.name ~= 'Stone Card')) then
                full_UI_table.name = {}
                localize{type = 'other', key = 'playing_card', set = 'Other', nodes = full_UI_table.name, vars = {localize(specific_vars.value, 'ranks'), localize(specific_vars.suit, 'suits_plural'), colours = {specific_vars.colour}}}
                full_UI_table.name = full_UI_table.name[1]
            end
        elseif card_type == 'Booster' then
            
        else
            full_UI_table.name = localize{type = 'name', set = _c.set, key = _c.key, nodes = full_UI_table.name}
        end
        full_UI_table.card_type = card_type or _c.set
    end 

    local loc_vars = {}
    if main_start then 
        desc_nodes[#desc_nodes+1] = main_start 
    end

    if _c.set == 'Other' then
        localize{type = 'other', key = _c.key, nodes = desc_nodes, vars = specific_vars}
    elseif card_type == 'Locked' then
    elseif hide_desc then
        localize{type = 'other', key = 'undiscovered_'..(string.lower(_c.set)), set = _c.set, nodes = desc_nodes}
    elseif specific_vars and specific_vars.debuffed then
        localize{type = 'other', key = 'debuffed_'..(specific_vars.playing_card and 'playing_card' or 'default'), nodes = desc_nodes}
    elseif _c.set == 'Joker' then
    elseif _c.set == 'Tag' then
    elseif _c.set == 'Voucher' then
    elseif _c.set == 'Edition' then
        loc_vars = {_c.config.extra}
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
    elseif _c.set == 'Default' and specific_vars then 
        if specific_vars.nominal_chips then 
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if specific_vars.bonus_chips then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {specific_vars.bonus_chips}}
        end
    elseif _c.set == 'Enhanced' then 
        if specific_vars and _c.name ~= 'Stone Card' and specific_vars.nominal_chips then
            localize{type = 'other', key = 'card_chips', nodes = desc_nodes, vars = {specific_vars.nominal_chips}}
        end
        if _c.name == 'Slimy Card' then 
	    loc_vars = {G.GAME.probabilities.normal, _c.config.extra, 1}
	end
	localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
        if _c.name ~= 'Stone Card' and ((specific_vars and specific_vars.bonus_chips) or _c.config.bonus) then
            localize{type = 'other', key = 'card_extra_chips', nodes = desc_nodes, vars = {((specific_vars and specific_vars.bonus_chips) or _c.config.bonus)}}
        end
    elseif _c.set == 'Booster' then 
    elseif _c.set == 'Spectral' then 
    elseif _c.set == 'Planet' then
    elseif _c.set == 'Tarot' then
	if _c.name == "The Rebirth" then
		loc_vars = {_c.config.max_highlighted, localize{type = 'name_text', set = 'Enhanced', key = _c.config.mod_conv}}; info_queue[#info_queue+1] = G.P_CENTERS[_c.config.mod_conv]
	end
        localize{type = 'descriptions', key = _c.key, set = _c.set, nodes = desc_nodes, vars = loc_vars}
   end

    if main_end then 
        desc_nodes[#desc_nodes+1] = main_end 
    end

   --Fill all remaining info if this is the main desc
    if not ((specific_vars and not specific_vars.sticker) and (card_type == 'Default' or card_type == 'Enhanced')) then
        if desc_nodes == full_UI_table.main and not full_UI_table.name then
            localize{type = 'name', key = _c.key, set = _c.set, nodes = full_UI_table.name} 
            if not full_UI_table.name then full_UI_table.name = {} end
        elseif desc_nodes ~= full_UI_table.main then 
            desc_nodes.name = localize{type = 'name_text', key = name_override or _c.key, set = name_override and 'Other' or _c.set} 
        end
    end

    if first_pass and not (_c.set == 'Edition') and badges then
        for k, v in ipairs(badges) do
            if v == 'foil' then info_queue[#info_queue+1] = G.P_CENTERS['e_foil'] end
            if v == 'holographic' then info_queue[#info_queue+1] = G.P_CENTERS['e_holo'] end
            if v == 'polychrome' then info_queue[#info_queue+1] = G.P_CENTERS['e_polychrome'] end
            if v == 'negative' then info_queue[#info_queue+1] = G.P_CENTERS['e_negative'] end
            if v == 'negative_consumable' then info_queue[#info_queue+1] = {key = 'e_negative_consumable', set = 'Edition', config = {extra = 1}} end
            if v == 'gold_seal' then info_queue[#info_queue+1] = {key = 'gold_seal', set = 'Other'} end
            if v == 'blue_seal' then info_queue[#info_queue+1] = {key = 'blue_seal', set = 'Other'} end
            if v == 'red_seal' then info_queue[#info_queue+1] = {key = 'red_seal', set = 'Other'} end
            if v == 'purple_seal' then info_queue[#info_queue+1] = {key = 'purple_seal', set = 'Other'} end
            if v == 'green_seal' then info_queue[#info_queue+1] = {key = 'green_seal', set = 'Other'} end
            --if v == 'black_seal' then info_queue[#info_queue+1] = {key = 'black_seal', set = 'Other'} end
            if v == 'curseddice_seal' then info_queue[#info_queue+1] = {key = 'curseddice_seal', set = 'Other'} end
            if v == 'dice_seal' then info_queue[#info_queue+1] = {key = 'dice_seal', set = 'Other'} end
            --if v == 'orange_seal' then info_queue[#info_queue+1] = {key = 'orange_seal', set = 'Other'} end
            if v == 'pink_seal' then info_queue[#info_queue+1] = {key = 'pink_seal', set = 'Other'} end
            if v == 'silver_seal' then info_queue[#info_queue+1] = {key = 'silver_seal', set = 'Other'} end
            --if v == 'acm_seal' then info_queue[#info_queue+1] = {key = 'acm_seal', set = 'Other'} end
            --if v == 'qingse_seal' then info_queue[#info_queue+1] = {key = 'qingse_seal', set = 'Other'} end
            if v == 'eternal' then info_queue[#info_queue+1] = {key = 'eternal', set = 'Other'} end
            if v == 'pinned_left' then info_queue[#info_queue+1] = {key = 'pinned_left', set = 'Other'} end
        end
    end

    for _, v in ipairs(info_queue) do
        generate_card_ui(v, full_UI_table)
    end

    return full_UI_table
end

local init_game_objectobjref = Game.init_game_object
function Game.init_game_object(self)
    local gameObj = init_game_objectobjref(self)

    gameObj.foods_eaten = 0

    return gameObj
end



----------------------------------------------
------------MOD CODE END----------------------
