SMODS.current_mod.optional_features = function()
    return {
        retrigger_joker = true
    }
end

SMODS.Atlas {
    key = "cat_atlas",
    px = 71,
    py = 95,
    path = "catatlas.png"
}

SMODS.Atlas {
    key = "cat_ears",
    px = 71,
    py = 95,
    path = "catears.png"
}

SMODS.Rarity {
    key = "cat_rarity",
    loc_txt = {
        ['default'] = {
            name = 'Cat'
        }
    },

    badge_colour = G.C.PURPLE,

    pools = {
        ["Joker"] = true
    },

    default_weight = 0.25
}

SMODS.Joker {
    key = "siamese",
    loc_txt = {
        ['default'] = {
            name = 'Siamese Joker',
            text = { '{C:chips}+20{} chips for', 'each {C:purple}Cat{} Joker.'}
        }
    },

    atlas = "cat_atlas",
    pos = { x = 0, y = 0 },

    config = {
        extra = {
            chipsToAdd = 0,
        }
    },

    rarity = 'meow_cat_rarity',
    cost = 4,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.chipsToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' then
                    card.ability.extra.chipsToAdd = card.ability.extra.chipsToAdd + 20
                end
            end
            return {
                chips = card.ability.extra.chipsToAdd
            }
        end
    end
}

SMODS.Joker {
    key = "persian",
    loc_txt = {
        ['default'] = {
            name = 'Persian Joker',
            text = { '{C:mult}+3{} Mult for', 'each {C:purple}Cat{} Joker.'}
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 1, y = 0 },

    config = {
        extra = {
            multToAdd = 0,
        }
    },

    rarity = 'meow_cat_rarity',
    cost = 4,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.multToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' then
                    card.ability.extra.multToAdd = card.ability.extra.multToAdd + 3
                end
            end
            return {
                mult = card.ability.extra.multToAdd
            }
        end
    end
}

SMODS.Joker {
    key = "shorthair",
    loc_txt = {
        ['default'] = {
            name = 'Shorthair Joker',
            text = { 'Gains {X:mult,C:white}X0.25{} Mult for', 'each {C:purple}Cat{} Joker.' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 2, y = 0 },

    config = {
        extra = {
            xMultToAdd = 1,
        }
    },

    rarity = 'meow_cat_rarity',
    cost = 5,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.xMultToAdd = 1
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' then
                    card.ability.extra.xMultToAdd = card.ability.extra.xMultToAdd + 0.25
                end
            end
            return {
                xmult = card.ability.extra.xMultToAdd
            }
        end
    end
}

SMODS.Joker {
    key = "siberian",
    loc_txt = {
        ['default'] = {
            name = 'Siberian Joker',
            text = { 'Retriggers all {C:purple}Cat{} Jokers.' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 0, y = 1 },

    config = { extra = { repetitions = 1 } },

    rarity = 'meow_cat_rarity',
    cost = 10,
    
    calculate = function(self, card, context)
        if context.retrigger_joker_check then
            if context.other_card.config.center.rarity == 'meow_cat_rarity' then
                return {
                    repetitions = card.ability.extra.repetitions,
                    card = context.other_card
                }
            end
        end
    end
}

SMODS.Joker {
    key = 'sphynx',
    loc_txt = {
        ['default'] = {
            name = 'Sphynx Joker',
            text = { 'Creates a random {C:purple}Cat{} Joker', 'at the end of round' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 1, y = 1 },

    rarity = 'meow_cat_rarity',
    cost = 10,

    calculate = function(self, card, context)
        if context.blind_defeated then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    SMODS.add_card{ set = 'Joker', area = G.jokers, rarity = 'meow_cat_rarity' }
                    return true
                end,
            })) 
            return {
                message = "Meow!"
            }
        end
    end
}

SMODS.Joker { -- mother cat
    key = 'mother',
    loc_txt = {
        ['default'] = {
            name = 'Mother Cat',
            text = { 'Creates a {C:dark_edition}Negative{} Kitty {C:purple}Cat{}', 'at the end of round' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 0, y = 2 },

    rarity = 'meow_cat_rarity',
    cost = 7,

    calculate = function(self, card, context)
        if context.blind_defeated then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    SMODS.add_card{ set = 'Joker', area = G.jokers, key = 'j_meow_kitty', edition = 'e_negative' }
                    return true
                end,
            })) 
            return {
                message = "Meow!"
            }
        end
    end
}

SMODS.Joker { -- kitty
    key = 'kitty',
    loc_txt = {
        ['default'] = {
            name = 'Kitty Cat',
            text = { 'Does nothing,', 'but scales other Cats' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 1, y = 2 },

    rarity = 'meow_cat_rarity',
    cost = 1,
}

SMODS.ObjectType {
    key = "cat_type",
    cards = {
        ["j_meow_siamese"] = true, -- +20 chips per
        ["j_meow_persian"] = true, -- +3 mult per
        ["j_meow_shorthair"] = true, -- x1.25 mult per
        ["j_meow_siberian"] = true, -- retriggers cats
        ["j_meow_sphynx"] = true, -- adds random cat
        ["j_meow_mother"] = true, -- adds negative kitty
        ["j_meow_kitty"] = true, -- nothing
    }
}

SMODS.Sticker {
    key = "counts_as_cat",
    loc_txt = {
        ['default'] = {
            name = 'Cat Sticker',
            text = { 'Counts as a {C:purple}Cat{}.'}
        }
    },

    atlas = "cat_ears",
    pos = { x = 0, y = 0 },

    badge_colour = G.C.PURPLE,
    default_compat = true,

    should_apply = function(self,card,center,area,bypass_roll)
        print(card.config.center.key)
        for index,value in ipairs({'j_lucky_cat', 'j_jolly', 'j_joker', 'j_8_ball', 'j_loyalty_card'}) do
            if value == card.config.center.key then
                print("card is in cat sticker list")
                return true
            end
        end
        print("card is not in cat sticker list")
        return false
    end
}

SMODS.Tag {
    key = 'cat_tag',
    loc_txt = {
        ['default'] = {
            name = 'Cat Tag',
            text = { 'cat sticker' }
        }
    },

    atlas = 'cat_atlas',
    pos = { x = 0, y = 0 },

    in_pool = function(self,args)
        return true
    end,

    trigger = function(joker)
        joker:add_sticker('counts_as_cat')
    end,

    apply = function(self,tag,context)
        for _,joker in ipairs (G.jokers.cards) do
            if joker.config.center.rarity ~= 'meow_cat_rarity' then
                tag:yep('meow!',G.C.PURPLE,joker:add_sticker('meow_counts_as_cat', true))
                tag.triggered = true
            end
        end
        return false
    end
}

SMODS.Back {
    key = "cat_deck",
    loc_txt = {
        ['default'] = {
            name = 'Cat Deck',
            text = { 'Start with a Mother Joker.', 'Cats are {X:mult,C:white}2X{} as common.' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 0, y = 0 },

    apply = function(self, back)
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.5,
            func = function()
                SMODS.add_card{ set = "Joker", area = G.jokers, key = 'j_meow_mother' }
                G.P_JOKER_RARITY_POOLS['meow_cat_rarity'].weight = 5
                return true
            end,
        }))
    end
}