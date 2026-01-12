-- todo list
-- kitty debuff (-10 chips per cat) | DONE
-- make siberian even worse? 1 in 6? | wait until testing kitty debuff, might fix problems (it probably did)
-- count chips/mult under description | DONE
-- figure out config
-- load_file
-- 20-30 jokers (sell cat to disable boss blind, if you do and have >1 cat, earn $10) ()
-- cat sticker tarot | DONE
-- make cat sticker bigger/better | DONE(?)
-- cat blind (debuff all cats)


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
            text = { 
                '{C:chips}+20{} Chips for',
                'each {C:purple}Cat{} Joker',
                '{C:inactive}(Currently {C:chips}+#1#{C:inactive} Chips){}' 
            }
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

    loc_vars = function(self, info_queue, card)
        if G.jokers then
            local a = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    a = a + 20
                end
            end
            return {vars = {a}}
        else
            return {vars = {20}}
        end
    end,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.chipsToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
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
            text = { 
                '{C:mult}+3{} Mult for',
                'each {C:purple}Cat{} Joker',
                '{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult){}'
            }
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

    loc_vars = function(self, info_queue, card)
        if G.jokers then
            local a = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    a = a + 3
                end
            end
            return {vars = {a}}
        else
            return {vars = {3}}
        end
    end,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.multToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat  then
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
            text = { 
                'Gains {X:mult,C:white}X0.25{} Mult for',
                'each {C:purple}Cat{} Joker',
                '{C:inactive}(Currently {X:mult,C:white}X#1#{C:inactive} Mult){}'
            }
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

    loc_vars = function(self, info_queue, card)
        if G.jokers then
            local a = 1
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    a = a + 0.25
                end
            end
            return {vars = {a}}
        else
            return {vars = {1.25}}
        end
    end,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.xMultToAdd = 1
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat  then
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
    key = "meowth",
    loc_txt = {
        ['default'] = {
            name = 'Meowth',
            text = { 
                'Earns {C:money}$2{} for each {C:purple}Cat{}', 
                'Joker at end of round', 
                '{C:inactive}(Currently {C:money}$#1#{C:inactive}){}' 
            }
        }
    },

    atlas = "cat_atlas",
    pos = { x = 2, y = 1 },

    config = {
        extra = {
            moneyToAdd = 0,
        }
    },

    rarity = "meow_cat_rarity",
    cost = 6,

    loc_vars = function(self, info_queue, card)
        if G.jokers then
            local a = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    a = a + 2
                end
            end
            return {vars = {a}}
        else
            return {vars = {2}}
        end
    end,

    calculate = function(self, card, context)
        if context.blind_defeated then
            card.ability.extra.moneyToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat  then
                    card.ability.extra.moneyToAdd = card.ability.extra.moneyToAdd + 2
                end
            end
            return {
                dollars = card.ability.extra.moneyToAdd
            }
        end
    end
}

SMODS.Joker {
    key = "siberian",
    loc_txt = {
        ['default'] = {
            name = 'Siberian Joker',
            text = { '{C:green}1 in 3{} chance to retrigger', 'each {C:purple}Cat{} Joker' }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 0, y = 1 },

    config = {extra = {
        numerator = 1,
        denominator = 3
    }},

    loc_vars = function(self,info_queue,card)
        local num,denom = SMODS.get_probability_vars(card, 1, 3)
        return {vars = {num,denom}}
    end,

    rarity = 'meow_cat_rarity',
    cost = 10,
    
    calculate = function(self, card, context)
        if context.retrigger_joker_check then
            if context.other_card.config.center.rarity == 'meow_cat_rarity' or context.other_card.ability.meow_counts_as_cat then
                if SMODS.pseudorandom_probability(card, 'five_nights_at_freddys', 1, 3) then
                    return {
                        repetitions = 1,
                        card = context.other_card,
                        message = 'Meow!'
                    }
                else
                    return {message = 'Aww...'}
                end
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
            text = { 
                '{C:chips}-1{} Chips per {C:purple}Cat{}', 
                'but scales other {C:purple}Cats{}',
                '{C:inactive}(Currently {C:chips}-#1#{C:inactive} Chips){}'
            }
        }
    },
    
    atlas = "cat_atlas",
    pos = { x = 1, y = 2 },

    rarity = 'meow_cat_rarity',
    cost = 1,

    config = {
        extra = {
            chipsToAdd = 0
        }
    },

    loc_vars = function(self, info_queue, card)
        if G.jokers then
            local a = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    a = a + 1
                end
            end
            return {vars = {a}}
        else
            return {vars = {1}}
        end
    end,

    calculate = function(self, card, context) 
        if context.joker_main then
            card.ability.extra.chipsToAdd = 0
            for _,joker in ipairs (G.jokers.cards) do
                if joker.config.center.rarity == 'meow_cat_rarity' or joker.ability.meow_counts_as_cat then
                    card.ability.extra.chipsToAdd = card.ability.extra.chipsToAdd - 1
                end
            end
            return {
                chips = card.ability.extra.chipsToAdd
            }
        end
    end
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
            text = { 'Counts as a {C:purple}Cat{}', 'for all calculations'}
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

SMODS.Consumable {
    key = 'cat_tarot',
    set = 'Tarot',
    loc_txt = {
        ['default'] = {
            name = 'Cat',
            text = { 'Turns one Joker', 'into a {C:Purple}Cat{}'}
        }
    },

    atlas = "cat_atlas",
    pos = { x = 0, y = 0 },

    cost = 3,
    
    can_use = function(self,card)
        local highlighted = G.jokers.highlighted or {}
        if #highlighted == 1 then
            return (not highlighted[1]:is_rarity('meow_cat_rarity')) and (not highlighted[1].ability.counts_as_cat)
        end
        return false
    end,

    use = function(self,card,area,copier)
        local highlighted = G.jokers.highlighted or {}
        highlighted[1]:add_sticker('meow_counts_as_cat', true)
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
                G.P_JOKER_RARITY_POOLS['meow_cat_rarity'].weight = 0.5
                return true
            end,
        }))
    end
}