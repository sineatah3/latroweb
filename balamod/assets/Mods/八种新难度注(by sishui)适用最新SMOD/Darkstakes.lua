--- STEAMODDED HEADER
--- MOD_NAME: dkstakes
--- MOD_ID: dkstakes
--- MOD_AUTHOR: [sishui]
--- MOD_DESCRIPTION: Adds new dark stakes
--- BADGE_COLOUR: 3FC7EB
--- PRIORITY: 500


local Backapply_to_runRef = Back.apply_to_run
function Back.apply_to_run(self)
    if G.GAME.modifiers.dkst_dkgreen then
    G.P_BLINDS.bl_small.mult = 1.2
    G.P_BLINDS.bl_big.mult = 1.6
      if G.GAME.modifiers.dkst_dkpurple then
         G.P_BLINDS.bl_small.mult = 1.25
         G.P_BLINDS.bl_big.mult = 1.8
      end
    else
    G.P_BLINDS.bl_small.mult = 1
    G.P_BLINDS.bl_big.mult = 1.5
    end
    Backapply_to_runRef(self)
end



function Card:set_eternal(_eternal)
    self.ability.eternal = nil
    if self.config.center.eternal_compat and not self.ability.perishable then
        self.ability.eternal = _eternal
      if G.GAME.modifiers.dkst_dkblack then
        if pseudorandom('eternalpinned') < 1/2 then
            self.pinned = _eternal
        end
      end
    end
end



SMODS.Atlas {  
    key = 'dkstakes',
    px = 29,
    py = 29,
    path = 'dkstakes.png'
}

SMODS.Atlas {  
    key = 'stdkstake',
    px = 71,
    py = 95,
    path = 'stdkstake.png'
}

SMODS.Stake {
    key = "dkwhite",
    unlocked = true,
    applied_stakes = { "gold" },
    --above_stake = "gold",
    prefix_config = { applied_stakes = { mod = false } },
    --prefix_config = { above_stake = {{ "gold" }, mod = false }},
    atlas = 'dkstakes',
    pos = { x = 0, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 1, y = 0 },
    shiny = true,
    colour = G.C.ETERNAL,
    modifiers = function()
        G.GAME.interest_cap = 15
    end,
    loc_txt = {
        sticker = {
            name = "Dark white label",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark White Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark White Note",
            text = {
            "initial{C:attention}Interest rate cap{}Change to{C:money}$3"
            },
    },
}

SMODS.Stake {
    key = "dkred",
    unlocked = true,
    applied_stakes = { "dkst_dkwhite" },
    atlas = 'dkstakes',
    pos = { x = 1, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 2, y = 0 },
    shiny = true,
    colour = G.C.MULT,
    modifiers = function()
        G.GAME.inflation = 1
    end,
    loc_txt = {
        sticker = {
            name = "Dark red note sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Red Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Red Note",
            text = {
            "All items in the store",
            "Buy{C:attention}cost{}Increase{C:money}$1"
            },
    },
}

SMODS.Stake {
    key = "dkgreen",
    unlocked = true,
    applied_stakes = { "dkst_dkred" },
    atlas = 'dkstakes',
    pos = { x = 2, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 3, y = 0 },
    shiny = true,
    colour = G.C.GREY,
    modifiers = function()
        G.GAME.modifiers.dkst_dkgreen = true
    end,
    loc_txt = {
        sticker = {
            name = "Dark green note sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Green Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Green Note",
            text = {
            "{C:attention}Small Blind{}and{C:attention}Big Blind{}of",
            "Slightly increased the score required to pass the level"
            },
    },
}

SMODS.Stake {
    key = "dkblue",
    unlocked = true,
    applied_stakes = { "dkst_dkgreen" },
    atlas = 'dkstakes',
    pos = { x = 3, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 4, y = 0 },
    shiny = true,
    colour = G.C.CHIPS,
    modifiers = function()
        G.GAME.modifiers.booster_ante_scaling = true
    end,
    loc_txt = {
        sticker = {
            name = "Dark blue note sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Blue Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Blue Note",
            text = {
            "{C:attention}Booster Pack {}Cost",
            "Each Ante Increase{C:money}$1{}",
            },
    },
}

SMODS.Stake {
    key = "dkblack",
    unlocked = true,
    applied_stakes = { "dkst_dkblue" },
    atlas = 'dkstakes',
    pos = { x = 4, y = 0 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 0, y = 1 },
    shiny = true,
    colour = G.C.RENTAL,
    modifiers = function()
        G.GAME.modifiers.dkst_dkblack = true
    end,
    loc_txt = {
        sticker = {
            name = "Dark Note Sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Note",
            text = {
            "The store appears{C:attention}eternal{}Joker",
            "It may also come with{C:attention}fixed{}Effect",
            "{C:inactive,s:0.8}(Fixed to the far left of the clown bar)"
            },
    },
}

SMODS.Stake {
    key = "dkpurple",
    unlocked = true,
    applied_stakes = { "dkst_dkblack" },
    atlas = 'dkstakes',
    pos = { x = 0, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 1, y = 1 },
    shiny = true,
    colour = G.C.MONEY,
    modifiers = function()
        G.GAME.modifiers.dkst_dkpurple = true
    end,
    loc_txt = {
        sticker = {
            name = "Dark purple note sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Purple",
                    "Winning on difficult level"
            }
        },
            name = "Dark Purple",
            text = {
            "{C:attention}Small Blind {} and{C:attention}Big Blind {}",
            "The score required to pass the level has been further increased"
            },
    },
}

SMODS.Stake {
    key = "dkorange",
    unlocked = true,
    applied_stakes = { "dkst_dkpurple" },
    atlas = 'dkstakes',
    pos = { x = 1, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 2, y = 1 },
    shiny = true,
    colour = G.C.PERISHABLE,
    modifiers = function()
        G.GAME.perishable_rounds = 3
    end,
    loc_txt = {
        sticker = {
            name = "Dark orange note sticker",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Orange Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Orange Note",
            text = {
            "The store appears{C:attention}Perishable{}Joker",
            "go through{C:attention}3{}Weakened after the round",
            },
    },
}

SMODS.Stake {
    key = "dkgold",
    unlocked = true,
    applied_stakes = { "dkst_dkorange" },
    atlas = 'dkstakes',
    pos = { x = 2, y = 1 },
    sticker_atlas = 'stdkstake',
    sticker_pos = { x = 3, y = 1 },
    shiny = true,
    colour = G.C.DARK_EDITION,
    modifiers = function()
        G.GAME.rental_rate = 5
    end,
    loc_txt = {
        sticker = {
            name = "Dark gold label",
            text = {
                "Use this Joker card",
                    "exist{C:attention}Dark Gold Note",
                    "Winning on difficult level"
            }
        },
            name = "Dark Gold Note",
            text = {
            "The store appears{C:attention}Rent{}Joker",
            "Cost per turn{C:money}$5{}",
            },
    },
}
----------------------------------------------
------------MOD CODE END----------------------
