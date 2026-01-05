
--[[to do: register runes:rune_bu as the non-glowing rune, and default:rune_bu_glowing as the node timer that turns to regular stone.]]

rune_bu = {}
rune_ke = {}
rune_hui = {}


-- creative check
local creative_mode_cache = minetest.settings:get_bool("creative_mode")

function is_creative(name)
	return creative_mode_cache or minetest.check_player_privs(name, {creative = true})
end

minetest.register_node("runes:lit_bu", {
	description = "Bu = Not",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png", {name = "rock_1x24.png^opaq_1x24.png^rune_bu_ani.png", animation = {type = "vertical_frames", length = 5.0}}},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:bu",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "knostone", pos)
        return itemstack
    end
})

minetest.register_node("runes:bu", {
	description = "Bu = Not",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {
		"rock.png^[transformR90",
		"rock.png^[transformFX",
		"rock.png", "rock.png",
--[[{name = "rune_bu_glowing.png", animation = {type = "vertical_frames", length = 60.0}}]]
		"rock.png^[transformR270", "rock.png^runelay_bu.png"
		},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:bu',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("runes:lit_ke", {
	description = "Ke = May",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^opaq.png", "rock.png^opaq.png", {name = "rock_1x24.png^opaq_1x24.png^rune_ke_ani.png", animation = {type = "vertical_frames", length = 4.0}}, "rock.png^opaq.png", "rock.png^opaq.png", "rock.png^opaq.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:ke",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "cryptic_wisdom", pos)
        return itemstack
    end,
})

echo = {}
-- Dialogue data
echo.dialogue = {
    cryptic_wisdom = {
        start = {text = "The shadows lengthen, but the \n path remains. What do you seek?",
            options = {
                {text = "I seek knowledge.", to = "a"},
                {text = "I seek nothing.", to = "b"},
                {text = "Who are you?", to = "c"},
                {text = "I seek absolution!", to = "d"},
                {text = "What path?", to = "e"}
            }
        },
        a = {text = "Knowledge is a river. Some drink from it,\n others are swept away. Be wary of its currents.", options = {{text = "I will be careful.", to = "a1a"}}},
        a1a = {text = "Caution is the shield of the wise. Go now.", is_end = true},
        b = {rancho = {
            {text = "To seek nothing is to find everything,\n and yet, you have found me. A paradox.", options = {{text = "Indeed.", to = "b1a"}}},
            {text = "Then click no further, little goblin, you're home and dry!", is_end = true}
        }},
        b1a = {text = "The world is full of such beautiful contradictions. Farewell.", is_end = true},
        c = {text = "I am the echo of the stone, the whisper of the world.\n I am what you make of me.", options = {{text = "A strange answer.", to = "c1a"}, {text = "Is that so?", to = "c1b"}}},
        c1a = {rancho = {
	    {text = "The truest answers often are. Until we speak again.", is_end = true},
	    {text = "Can you imagine a stranger one?", is_end = true},
	    {text = "Yeah, I was just a water rune, but was \n crafted into this by use of a gem.", is_end = true}
	}},
        c1b = {rancho = {
            {text = "So it is, m'lad.", options = {{text = "And are we speaking again now?", to = "c1b1a"}, {text = "Is it really?", to = "c1b1b"}}},
            {text = "Aye aye cap'n.", is_end = true}
        }},
        c1b1a = {rancho = {
            {text = "Maybe we're speaking, maybe we're typing,\n but words are going which way, and I'm poofed!", is_end = true},
            {text = "I wanna say no.", is_end = true},
            {text = "We've a long way to go before you call that 'speaking'.", is_end = true}
        }},
        c1b1b = {text = "Yes.", is_end = true},
        d = {rancho = {
            {text = "I seek absolution too! How about you tell me \n what you're doing so I can do it too!", is_end = true},
            {text = "Many's a fool goin down that road, partner,\n if'n they isn't got none to boot.", options = {{text = "You should have led me the other way then, halfwit!", to = "d2a"}, {text = "I go it alone, buddy", to = "d2b"}, {text = "There's no easy way, is there?", to = "d2c"}}},
            {text = "Who are you?", is_end = true}
        }},
        d2a = {text = "Should we split?", is_end = true},
        d2b = {rancho = {
            {text = "Fool! Tracks lie cold in the rush of weaker ditherers,\n you must quickly read them and avoid the same end!", is_end = true},
            {text = "Then you're half as wise as I,\n who saw no rush for absolution!", is_end = true},
            {text = "That puts me on the road to obsoletion, hahaha.\n So what did you do to get here?", options = {{text = "A promise was broken, and I was the one to break it.", to = "d2b3a"}, {text = "Is it one great misstep that brings a person here,\n or a thousand smaller ones?", to = "d2b3b"}, {text = "I told a dwarf his beard was splotchy \n and reccommended he give it a trim. It... escalated.", to = "d2b3c"}}}
        }},
        d2b3a = {text = "Either it wasn't set in stone, or you have a forked tongue.", is_end = true},
        d2b3b = {rancho = {
            {text = "Perhaps a single, profound error that echoed through time.", is_end = true},
            {text = "A cumulative weight, a slow erosion of intent.", is_end = true},
            {text = "It began with a tiny whisper of doubt, and here I am.", is_end = true}
        }},
        d2b3c = {rancho = {
            {text = "You did not! You should offer something useful if giving a dwarf advice,\n like a razor, shampoo, or a mirror.", is_end = true},
            {text = "That is a very personal thing to comment on in the dwarving community!\n You must have had a falling out after that!", is_end = true},
            {text = "A deliberate insult from a goblin, who of course does not grow beards \n unless in dwarven captivity, well I suppose you skipped town after that?", options = {{text = "I was locked in Master goblin Stax's toolshed and had to read \n books until them dwarves were able to forgive me.", to = "d2b3c3a"}, {text = "I became known as 'the barber', and not in a good way.\n It was difficult to find a boat with that reputation.", to = "d2b3c3b"}, {text = "No sooner had I spoken was I then taken to the dungeon.\n Hence this beard. It was easy to sneak out then.", to = "d2b3c3c"}}}
        }},
        d2b3c3a = {text = "So the beard is a mark of your residual \n dwarven penance-magic. Are you going to keep it?", is_end = true},
        d2b3c3b = {text = "How did you cover up the green skin?", is_end = true},
        d2b3c3c = {text = "Did you learn anything in the dwarven dungeons?", options = {{text = "I got the whole layout in here *taps wrinkly forehead*.", to = "d2b3c3c3a"}, {text = "I learned not to comment on a dwarf's beard, the hard way.\n It happened a few more times, and I was sent deeper and deeper...", to = "d2b3c3c3b"}, {text = "I overheard a guard saying Dwarf Dottimuck is plotting an uprising.", to = "d2b3c3c3c"}}},
        d2b3c3c3a = {text = "Is that the dwarf who famously defended the goblins \n when they rebelled against Dwarf Spottysoot?", is_end = true},
        d2b3c3c3b = {text = "Should you be concerned at all about what the guard said?\n It could have been a double ditch booby bounty just to fool you.", options = {{text = "There was only solemnity in his tone. War is coming for sure!", to = "d2b3c3c3c2a"}, {text = "I gave them nothing! Besides, Dottimuck is nowhere to \n be seen around here, why should I worry, even if it is true?", to = "d2b3c3c3c2b"}, {text = "I gave them very little. As far as I'm \n concerned, Dwarf Dotti is as finished as the Laws of Ley!", to = "d2b3c3c3c2c"}, {text = "I tried to ask around, but,\n you know, the beards... distracted me.", to = "d2b3c3c3c2d"}}},
        d2b3c3c3c = {text = "No, I mean did you learn any mathematics?", is_end = true},
        d2b3c3c3c2a = {text = "War is coming for sure!", is_end = true},
        d2b3c3c3c2b = {text = "Dottimuck is nowhere to be seen around here,\n why should I worry, even if it is true?", is_end = true},
        d2b3c3c3c2c = {text = "Dwarf Dotti is as finished as the Laws of Ley!", is_end = true},
        d2b3c3c3c2d = {text = "The beards... distracted me.", is_end = true},
        d2c = {text = "There's no easy way, is there?", is_end = true},
        e = {rancho = {
            {text = "That path you take your time on, of course.", is_end = true},
            {text = "The one you waste the whole day working on just to wind up where you started.\n Or am I wrong?", options = {{text = "If I wind up at the start again it will not have been in vain.", to = "e2a"}, {text = "It's no race to me, but it could be less work.", to = "e2b"}, {text = "Then I had better get back before darkness falls!", to = "e2c"}}},
            {text = "The path that will soon be submerged in darkness, my friend.", is_end = true}
        }},
        e2a = {text = "Reload and relate.", is_end = true},
        e2b = {rancho = {
            {text = "It's no work at all if you know the return!", is_end = true},
            {text = "Is it too much for you? Would you like some pointers?", options = {{text = "For this game?", to = "e2b2a"}, {text = "For node construction?", to = "e2b2b"}, {text = "It's meant to be hard, but not impossible. Less is more.", to = "e2b2c"}}},
            {text = "What are you building?", options = {{text = "A dialog path! This is [e2b3a] on the path!", to = "e2b3a"}, {text = "A little walkway around Stax's house.", to = "e2b3b"}, {text = "A school", to = "e2b3c"}}}
        }},
	e2b2a = {text = "Yes, for this game we call tuk. It is a game of building, of weaving words into worlds.", is_end = true},
	e2b2b = {text = "There are many steps. Would you like a quick walkthrough?", options = {{text = "Yes.", to = "e2b2b1a"}, {text = "No.", to = "e2b2b1b"}}},
	e2b2b1a = {text = "Basically draw it, label the vertices and faces, make a uv \n texture to map to, create an object file with a notepad that \n lists coordinates of vertices (right handed coord system) uv mappings, \n face normals and face definitions, and register the node in a \n lua file in some mod folder. A spreadsheet can help with animations.", options = {{text = "OK", to = "e2b2b1a1a"}}},
	e2b2b1a1a = {text = "See [https://github.com/flowingpoint/Notes/blob/main/flowingpoints_koin_notes.pdf] \n for the journal I made while creating my very first dynamic placeable node.", options = {{text = "OK", to = "e2b2b1a1a1a"}}},
	e2b2b1a1a1a = {text = "...", is_end = true},
	e2b2b1b = {text = "Dig it and dump it, order it in, smash it and crash it, throw in the bin.", is_end = true},
	e2b2c = {text = "It's meant to be hard, but not impossible. Less is more.", is_end = true},
        e2b3a = {rancho = {
            {text = "Indeed. A path of words can be a powerful thing. Where does it lead?", options = {{text = "Perhaps to a deeper understanding of the self, or the intricate dance of thought.", to = "e2b3a1a"}, {text = "It leads to new connections, new stories, and unforeseen destinations.", to = "e2b3a1b"}, {text = "To the heart of the labyrinth, where all paths eventually converge.", to = "e2b3a1c"}}},
            {text = "Fascinating. Is this path visible to others, or only to the mind's eye?", options = {{text = "It exists only within the architecture of thought, a private gallery.", to = "e2b3a2a"}, {text = "It is a blueprint, waiting to be shared and built upon by others.", to = "e2b3a2b"}, {text = "Its visibility depends on the clarity of the observer's own vision.", to = "e2b3a2c"}}},
            {text = "And what revelations do you hope to uncover on this dialog path?", is_end = true}
        }},
        e2b3a1a = {text = "Perhaps to a deeper understanding of the self, or the intricate dance of thought.", is_end = true},
        e2b3a1b = {text = "It leads to new connections, new stories, and unforeseen destinations.", is_end = true},
        e2b3a1c = {text = "To the heart of the labyrinth, where all paths eventually converge.", is_end = true},
        e2b3a2a = {text = "It exists only within the architecture of thought, a private gallery.", is_end = true},
        e2b3a2b = {text = "It is a blueprint, waiting to be shared and built upon by others.", is_end = true},
        e2b3a2c = {text = "Its visibility depends on the clarity of the observer's own vision.", options = {{text = "Then clarity is the key. How does one sharpen their vision?", to = "e2b3a2c1"}, {text = "A profound statement. So, the path reveals itself to the worthy.", to = "e2b3a2c2"}, {text = "And what if the observer is blind to their own potential?", to = "e2b3a2c3"}}},
        e2b3a2c1 = {rancho = {
            {text = "By possessing choice, then moving with intention in a continuous way.", is_end = true},
            {text = "By knowing how a completed mission should feel.", is_end = true},
            {text = "By eliminating the unneccessary, until the essential reveals itself. (quote from Bruce Lee)", is_end = true}
        }},
        e2b3a2c2 = {rancho = {
            {text = "A worthy path should reveal itself to all who step onto it.", is_end = true},
            {text = "The worthy path might also be a 'wordy' path, no?", is_end = true},
            {text = "Worthy of knowledge, or worthy of passage? There's a difference.\n You can know but not go, you can go but not know...", is_end = true}
        }},
        e2b3a2c3 = {rancho = {
            {text = "The observer can promise to return.", is_end = true},
            {text = "If the path itself has potential to challenge the observer...\n I can build it with my own potential, for it would make me worthy of the build.", is_end = true},
            {text = "The observer is not blind to everything. The path is a free choice,\n and if not taken at all, there are others unseen.", is_end = true}
        }},
        e2b3b = {rancho = {
            {text = "It's a matter of serving yourself \n with choices at the end of the day!", is_end = true},
            {text = "It's a question of subtlety and speed, which will win?", is_end = true},
            {text = "A fine operation, for a goblin's servant, flowingpoint!", is_end = true}
        }},
        e2b3c = {text = "A school?", is_end = true},
        e2c = {text = "Then I had better get back before darkness falls!", is_end = true}
    },
    j001_green = {
	start = {rancho = {
	    {text = "Hi Stax, you're looking very green today, what's eating you?", is_end = true},
	    {text = "Stax, what have you been up to?", options = {{text = "Ambitions run high.", to = "a"}, {text = "The Abyss", to = "b"}}}
	}},
	a = {text = "And so should you. Go and hike!", is_end = true},
	b = {text = "It calls sometimes.", is_end = true}
    },
    j001_blue = {
	start = {rancho = {
	    {text = "Good news and bad news, Stax... which do you want first?", options = {{text = "The good news.", to = "a"}, {text = "The bad news.", to = "b"}, {text = "I know already.", to = "c"}}},
	    {text = "Quiet today, isn't it, Stax?", is_end = true}
	}},
	a = {text = "The good guys managed to escape!", options = {{text = "And the bad news?", to = "a1a"}, {text = "Then our plan worked.", to = "a1b"}}},
	b = {text = "Jin Tang is no more.", options = {{text = "And the good news?", to = "b1a"}, {text = "Then their plan worked.", to = "b1b"}}},
	a1a = {text = "They're not here!", is_end = true},
	a1b = {text = "They have gone home.", is_end = true},
	b1a = {text = "The prisoners reformed.", is_end = true},
	b1b = {text = "And so should we.", is_end = true},
	c = {text = "...", is_end = true}
    },
    j001_red = {
	start = {rancho = {
	    {text = "Stax, why are we here?", options = {{text = "To mind the pock.", to = "aa"}, {text = "To find the Roc.", to = "ab"}, {text = "To pock the mons.", to = "ac"}, {text = "I don't know.", to = "ad"}}},
	    {text = "How do you do, Stax?", is_end = true},
	    {text = "Hmmph! My clock has stopped again!", is_end = true},
	    {text = "Time is short... like you, Stax, my little goblin friend.", options = {{text = "Let's go soon then.", to = "da"}, {text = "Not this time.", to = "db"}, {text = "Stax has time.", to = "dc"}, {text = "And the world is vast and indifferent... like your wit!", to = "dd"}}}
	}},
	aa = {text = "Then that is what I'll do!", is_end = true},
	ab = {text = "Well I hope it's safe!", is_end = true},
	ac = {text = "Leave some for me!", is_end = true},
	ad = {text = "You should think about it.", options = {{text = "I have...", to = "ada"}, {text = "I do...", to = "adb"}, {text = "I will...", to = "adc"}}},
	ada = {text = "...", is_end = true},
	adb = {text = "...", is_end = true},
	adc = {text = "...", is_end = true},
	da = {text = "...", is_end = true},
	db = {text = "I don't see how you do it. Good luck!", is_end = true},
	dc = {text = "Don't waste it talking to me! Write a poem or something.", options = {{text = "I'll think about it.", to = "dca"}, {text = "Don't worry, I won't.", to = "dcb"}, {text = "I have.", to = "dcc"}}},
	dd = {text = "...", is_end = true},
	dca = {text = "...", is_end = true},
	dcb = {text = "...", is_end = true},
	dcc = {text = "...", is_end = true}
    },
    knostone = {
	start = {text = "You feel a tremor beneath your feet.\n An ancient stone hums with a faint, almost forgotten energy.\n What do you do?", options = {{text = "Tap the stone with your foot.", to = "a"}, {text = "Speak randomly in the hopes that it will converse back.", to = "b"}, {text = "Make some mental calculations.", to = "c"}, {text = "Remember the old ways.", to = "d"}}},
	a = {rancho = {
	    {text = "Echoes… resonance… a forgotten language stirs within the stone.", options = {{text = "Tap a jazzy groove.", to = "a1a"}, {text = "Tap to an old classical.", to = "a1b"}, {text = "Stop tapping. It knows you're here.", to = "a1c"}}},
	    {text = "The echoes are pleasing to the ear. Well done.", is_end = true}
	}},
	b = {rancho = {
	    {text = "The knowstone is clearly struggling \n with accurately following complex instructions. \n You aren't sure you're in control here. \n What do you do?", options = {{text = "Begin whispering your thoughts to close the subject.", to = "b1a"}, {text = "Request a list of commands.", to = "b1b"}, {text = "Wait. Keep talking anyway. But what are you saying?", to = "b1c"}}},
	    {text = "Password is incorrect. Please try again later.", is_end = true},
	    {text = "Password accepted. Welcome back, Steve.", is_end = true}
	}},
	c = {text = "Do you require anything in particular \n to go with that obsoletist drudgery?", options = {{text = "Should I?", to = "c1a"}, {text = "I hope not, this is basic physics. Real basic.", to = "c1b"}, {text = "<Take offense>", to = "c1c"}}},
	d = {text = "Are we starting again?", options = {{text = "Is_end = true!", to = "d1a"}, {text = "Is_end = false... hmmm. That's new!", to = "d1b"}, {text = "Look, Knostone, you insulted me. How could you forget that?", to = "d1c"}}},
	a1a = {rancho = {
	    {text = "What are you playing?", options = {{text = "I don't really know. Something blue though...", to = "a1a1a"}, {text = "I was playing in the beginning, the mood all changed...", to = "a1a1b"}}},
	    {text = "The mysterious stone ceases its strange humming, \n as though listening.", is_end = true},
	    {text = "The Knostone glows radiantly, \n but since you can't seem to understand its purpose, \n you decide to abandon it and move on.", is_end = true}
	}},
	a1b = {rancho = {
	    {text = "What would you like me to play?", options = {{text = "Actually could you shut up, I'm trying to concentrate.", to = "a1b1a"}, {text = "Something from the early times, if you can.", to = "a1b1b"}, {text = "I'm actually *trying* to turn you on!", to = "a1b1c"}}},
	    {text = "The knostone responds to the player's evocative \n melody with a simple instrumental whinny, \n indicating a receptive curiosity.", is_end = true},
	    {text = "The penultimate blaze of the mysterious stone's glowing rune \n is accompanied by the sound of a distant explosion. \n Then it asks, 'What have I done?'", is_end = true}
	}},
	a1c = {rancho = {
	    {text = "You notice patterns on the walls. You don't like it.", is_end = true},
	    {text = "Someone, or some *thing*, is trying to distract you from your very important mission. They're very good.", is_end = true},
	    {text = "You're not giving anything away just yet.", is_end = true}
	}},
	a1a1a = {text = "The music continues...", is_end = true},
	a1a1b = {text = "I don't have time for the whole rap, I'm outie!", is_end = true},
	b1a = {text = "It's like you're not there. Nothing happens.", is_end = true},
	b1b = {text = "Yeah, but how?", is_end = true},
	b1c = {text = "You want me to take it from here, buddy?", is_end = true},
	c1a = {text = "?", is_end = true},
	c1b = {text = "I know physics. I'm the 'KNOWSTONE'! \n Ask me anything. I'll show you.", is_end = true},
	c1c = {text = "I mean, like, in a nice way. Just trying to help...", is_end = true},
	d1a = {text = "Then take all the time in the world. Things are as they should be.", is_end = true},
	d1b = {text = "Initiating backup world in 3... 2... 1...", is_end = true},
	d1c = {text = "Talk to the Echostone about your problems, ok?", is_end = true}
    },
    story = {
	start = {text = "Play Rindpebble Adventure?", options = {{text = "Ok.", to = "a"}, {text = "No.", to = "b"}, {text = "Insert notes.", to = "c"}}},
	a = {rancho = {
	{text = "Welcome to my Rindpebble Market Welcome Post, \n please choose a rent option.", options = {{text = "A week in the Reveller's Casket Inn, \n includes hedge clone work. \n ", to = "f"}, {text = "Five days in the Baroness's cellar, \n sharing with her soldier son. \n \n \n ", to = "f"}, {text = "One night in Mage Xao's attic  \n with book and potion priviledges. \n \n \n \n \n ", to = "f"}}},
	{text = "Produce now your documents.", options = {{text = "You offer a worn badge with a handwoven moniker.", to = "f"}, {text = "You extract a prison release letter and signed plans from an inner pocket.", to = "f"}, {text = "'I have only my word, and it is founded in honour and respect. \n I assure you I am of good will and being new \n to this small place you call Rindpebble I place this gold in trust \n that a man might pass nameless this night.' \n \n \n ", to = "f"}}},
	{text = "You are leaving the stalls and weedy hags whistle \n for you to behold their mangley lichens and veggy rot. \n 'Grab yourself a free bag of Junglebog Musk, \n or an Eggly Packratsnot', you are beckoned. \n As you inch away politely, a thin athlete somersaults toward you, \n wearing a mechanical device which would reduce his perception  \n of you, who stand most unfortunately in his path.", options = {{text = "You rush back towards the wenches' stall. \n \n \n ", to = "f"}, {text = "You brace for impact with the moving  \n cacophony of twirls and swirls. \n \n \n \n", to = "f"}, {text = "You holler and gesticulate expressively. \n \n \n \n \n ", to = "f"}}},
	{text = "Suddenly it is dark and your bed is made, \n you are tired from the day's events, \n but able for one more activity before you sleep.", options = {{text = "You prepare a pen and paper \n to write on if you are inspired by a dream. \n ", to = "f"}, {text = "You light a small fire of the scrap papers \n you collected and make a small prayer. \n \n \n ", to = "f"}, {text = "You fish out the keys you were given at the stall \n and make detailed and perceptive analysis, \n until you fall asleep with them in your hands. \n \n \n \n \n \n ", to = "f"}}},
	{text = "Your breakfast ticket is wrapped, with hundreds of other kinds of ticket, \n in a thick roll with an elastic band, and as you search you remember \n what your granny told you about greedy fingers making needy tinkers. \n Withdrawing only one, you store the rest away in your hammock-satchel \n and waltz over to the wall post to notch your departure. \n A black cat approaches and coughs dramatically at your feet. \n Being trained, you hum gently an ancient healing tune and the cough subsides.", options = {{text = "You gain a little experience, a lot of energy, but no health. \n \n \n ", to = "f"}, {text = "You gain a little energy, a lot of health, but no experience. \n \n \n ", to = "f"}, {text = "You gain a little health, a lot of experience, but no energy. \n \n \n ", to = "f"}}},
	{text = "You are pushed by a disgruntled employee of the empire \n who in haste has also knocked a woman forward into her cart of veggies and sweet-picks, \n revealing on her ankle a tattoo that is the mark of an evil-smelling potion sect \n known to be underground of this very village.", options = {{text = "You can't remember who gave you these clues and check your journal.", to = "f"}, {text = "You decide to track her and wait for her to right herself.", to = "f"}, {text = "'Hey, is that the mark of that potion sect?'", to = "f"}}},
	{text = "Another night in the village has you running low on vitamins \n and you stumble into the inn, there meeting a dogman and his walking kettle. \n He sings like a lark of woe and dead pirates. \n You are surprised when his dogwoman wife ambles out of the complex of trapdoors \n and shunts a stool beside him, knocking the kettle off into a hasty triple time dandy-dance. \n You ask may you burn rotten dragon tongue \n in his kettle for nutrients, and they chime a curse.", options = {{text = "'A tongue for thee, will cost you three: \n a farting beam, a splitting seam, and a squinting dream, \n but calum, kinestide, and welfog will provide.' \n \n \n \n \n ", to = "f"}, {text = "'To burn this bottle, will loosen your grip, \n to leave it idle, will cause it to drip.' \n \n \n \n \n \n \n \n ", to = "f"}, {text = "'The pressure within may seal the bin \n but the gaseous snout gives the fumes of doubt. \n Sip carefully, for this is a magic kettle.' \n \n \n \n \n \n \n \n \n \n \n ", to = "f"}}},
	{text = "Well fed and clothed in fabric suited to your mission, \n you part from the wandering nomad group and hurry towards the town wall, \n where a carousing priest is giving out leaflets. He catches your eye and soon \n is explaining with loving detail the squiggles and graphics most splendid on his sheets. \n It sounds like you would have a really good time if you \n followed him and wiggled your tongue while looking at the wordy papers, \n one of which he hands you, so you try voice an honest attempt at comprehension.", options = {{text = "A glitter of dancing nymphs swirl towards you from the direction of the sun. \n \n \n ", to = "f"}, {text = "You feel lightheaded and ask to be left alone. \n You remember your 5th birthday present, a grey flag and stickle for warding thieves. \n \n \n \n ", to = "f"}, {text = "Nothing happens. \n \n \n \n \n ", to = "f"}}},
	{text = "The road becomes thick with mud and your feet are being watched \n by hungry landbaers from under the broadleafs of the roadside ditches. \n You want to release the brushfaced camel here, before the wild creatures ahead \n enchant it and turn its hump to chocolate, as you were warned by a nobody somewhere. \n It pains you to let ol' Fussywug go, so you pause and dip into your sack.", options = {{text = "You find a map route which avoids \n the wild danger but involves lots of swimming and nymphs. \n \n ", to = "f"}, {text = "You enjoy a hearty meal of dried shrinkworts and hunglersots \n washed down with yuggus. The camel refuses \n to eat any of it, but takes water. \n \n \n \n \n ", to = "f"}, {text = "You redeem yourself of this side mission and dejectedly bear up \n to a long journey back, so that the camel may live. \n \n \n \n \n \n \n \n ", to = "f"}}},
	{text = "The wrestling triplets are hunting acties, which are little blobs of floating goo \n that reproduce around Gugg's farm with such speed that he must play \n immaculate fair tunes from his walkbot sidearm manager to stun them \n and protect his crop, but the triplets are leading \n by diving and grabbing them with special net-gloves. \n In reading mode, your parody-pet mainframe wristwatch has no functionality, \n but you can see that it has low battery.", options = {{text = "You enter the farm and draw power from the central supply unit. \n \n \n ", to = "f"}, {text = "You observe them until you feel a yawn coming and keep going. \n \n \n ", to = "f"}, {text = "You remove the watch and sack and join them, until all acties are got. \n \n \n ", to = "f"}}},
	{text = "Counting markers makes you brave for the Great Ba's Challenge, \n but you have lost much fog-tags and need rest more than anything. \n In ear you bring vectors and stolen hush. When you see the queen ahead \n you make no motion for she is waiting for the camel and speaks directly to it, \n letting you pass without incident or cautions.", options = {{text = "You move a little faster, with much improved storage capacity, but unchanged comfort. \n ", to = "f"}, {text = "You move with a little improved storage capacity, much more comfort, but unchanged speed. \n ", to = "f"}, {text = "You move with a little more comfort, much improved speed, but unchanged storage capacity. \n ", to = "f"}}},
	{text = "You do not know how the sky has stained, while your eyes remain darkened \n by the cursing fogs that issue like ugly florid gestures from your left and right.", options = {{text = "'I suppose that's worth a fortune back home, that stuff.'", to = "g"}, {text = "'I hope the others have survived this torrid \n discoloration of an otherwise standard landscape.' \n ", to = "g"}, {text = "'I am getting itchy, and it has something to do \n with the sky being that color.' \n \n \n ", to = "g"}}},
	{text = "After walking over a moorish battement where none other than Halkfrost \n himself gathered straw to beat the wolves from his garden,\n your vision coheres upon an old oaf with brazen blue hair. \n He shuggles his foresteps and frostcads a can of rootmeal to you. \n Instead of greeting him, what do you do?", options = {{text = "Accent your voice to sound like a robber \n that was on the newspaper as a hero of a fire incident. \n \n ", to = "f"}, {text = "Propose he attend a weekly gathering of aidsmen of the flowershows and rodgassings. \n \n \n", to = "f"}, {text = "Juxtapose yourself in time with his huffing and hawings \n for the sense of rythym but restrain yourself \n from giggling when a bunch of sheep join in. \n \n \n \n \n ", to = "f"}}},
	{text = "Into the woods now you find your legs have been aching without you noticing, \n so you sit back on a log and empty your satchel of its contents, \n so that they spread and gleam in the beam of light that cuts through the canopy. \n You have a rod, a gutter section, a fancy hammer with gold and jewel embossment, \n three loaves of elfen bread, a crusty scab from a rockjockey clouber- \n those deadly beasts which trip you up and gobble you, \n a yellow flag with green spots, miniature diggers- \n 5 of them, and 5 trained mice wearing little protective jackets. \n You also have sudocream, vaseline, aloe vera, soft glue, and a few letters \n and rare items crucial to your mission in an added compartment \n in your rucksack, which you do not remove. \n \n \n \n ", options = {{text = "You eat and set off with all your things towards the next village. \n \n \n \n \n \n \n \n \n \n \n ", to = "f"}, {text = "You nap, eat, and set off with only food and essentials \n toward the Mad Torquin's Shack, which is very far away. \n \n \n \n \n \n \n \n \n \n \n \n ", to = "f"}, {text = "You set up a small reality show \n and make the mice do flips until it is dark, \n then flee a strange and enchanting nymph, \n who takes the elfen bread, mice, and the stuff you don't \n really need for your story. \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n \n ", to = "f"}}}
	}},
	f = {text = "Note removed. *kachick!*", options = {{text = "Start", to = "start"}}},
	g = {text = "You arrive finally at a broad deserted landscape with some odd skeletons randomly dispersed in it.", options = {{text = "Ok.", to = "f"}}},
	b = {text = "Want to play 'carrot'?", options = {{text = "Ok", to = "d"}, {text = "No.", to = "e"}}},
	c = {text = "You drop an envelope containing a script into the can. \n It is absorbed into the stone's inner matrix structure \n in a show of fibres and beams. This should be more interesting.", options = {{text = "Start", to = "start"}}},
	d = {text = "Entrance of a dirty nightclub.", options = {{text = "Head to the dance floor.", to = "d1a"}, {text = "Get a drink at the bar.", to = "d1b"}, {text = "Find a table to sit at.", to = "d1c"}}},
	d1a = {text = "There are too many people here.", options = {{text = "Try to dance.", to = "d1a1a"}, {text = "Go back.", to = "d"}}},
	d1b = {text = "You spend all your money on drink.", options = {{text = "Leave bar tipsy.", to = "d1b1a"}}},
	d1a1a = {text = "You dance until you are tired.", options = {{text = "Get a drink at the bar.", to = "d1b"}, {text = "Leave.", to = "d1a1a1b"}}},
	d1a1a1b = {text = "You walk home.", is_end = true},
	d1b1a = {text = "You get a taxi home.", is_end = true},
	d1c = {text = "Your workmates are there.", options = {{text = "Sit with them.", to = "d1c1a"}, {text = "Go back.", to = "d"}}},
	d1c1a = {text = "You get some overtime done.", options = {{text = "Leave bar.", to = "d1c1a1a"}}},
	d1c1a1a = {text = "You get a lift home. You made it.", is_end = true},
	e = {text = "Game Over.", is_end = true}
    }
}

-- Player conversation state
local pconv = {}

-- Function to remove a player's current conversation HUD elements
local function xhud(player)
    local player_name = player:get_player_name()
    local conv_state = pconv[player_name]
    if conv_state and conv_state.hud_ids then
        for _, hid in pairs(conv_state.hud_ids) do
            player:hud_remove(hid)
        end
        conv_state.hud_ids = {}
    end
end

-- Function to display a dialogue step for a player
local function display_dialogue(player, dialogue_id, step_key)
    local player_name = player:get_player_name()
    local dialogue_data = echo.dialogue[dialogue_id]
    if not dialogue_data then
        minetest.chat_send_player(player_name, "Error: Dialogue not found!")
        return
    end

    local step = dialogue_data[step_key]
    if not step then
        minetest.chat_send_player(player_name, "Error: Dialogue step not found!")
        return
    end

    local current_display_step = step
    if step.rancho then
        local rand_idx = math.random(1, #step.rancho)
        current_display_step = step.rancho[rand_idx]
    end

    -- Clean up previous HUD elements
    xhud(player)
    local hud_ids = {}
    local y_offset = -150 -- Starting Y offset for dialogue text
    -- Display dialogue text
    local text_hud_id = player:hud_add({
        hud_elem_type = "text",
        position = {x = 0.5, y = 1},
        offset = {x = 0, y = y_offset},
        text = current_display_step.text,
        number = 0xFFFFFF, -- White
        alignment = {x = 0, y = 0},
        scale = {x = 100, y = 100},
    })
    table.insert(hud_ids, text_hud_id)
    y_offset = y_offset - 30 -- Move down for options
    -- Display options if any
    if current_display_step.options then
        for i, option in ipairs(current_display_step.options) do
            local option_text = "[" .. i .. "] " .. option.text
            local option_hud_id = player:hud_add({
                hud_elem_type = "text",
                position = {x = 0.5, y = 1},
                offset = {x = 0, y = y_offset - (i * 20)}, -- Adjust Y for each option
                text = option_text,
                number = 0xAAAAAA, -- Gray
                alignment = {x = 0, y = 0},
                scale = {x = 80, y = 80},
            })
            table.insert(hud_ids, option_hud_id)
        end
    end

    pconv[player_name] = pconv[player_name] or {}
    pconv[player_name].hud_ids = hud_ids
    pconv[player_name].current_dialogue_id = dialogue_id
    pconv[player_name].current_step_key = step_key
    pconv[player_name].active_options = current_display_step.options

    if current_display_step.is_end then
        minetest.after(5, function()
            xhud(player)
            pconv[player_name] = nil
            --minetest.chat_send_player(player_name, "Conversation ended.")
        end)
    end
end

-- Global function to start a conversation
function echo.start(player, dialogue_id, pos)
    local player_name = player:get_player_name()
    if pconv[player_name] then
        minetest.chat_send_player(player_name, "You are already in a conversation!")
        return
    end
    pconv[player_name] = {pos = pos, hud_visible = true}
    display_dialogue(player, dialogue_id, "start")
end

-- Chat command to select dialogue options
minetest.register_chatcommand("c", {
    params = "<choice_number>",
    description = "Select a dialogue option.",
    func = function(player_name, param)
        local build_command = nil
        local regular_param = param
        local build_mode_activated = false

        -- Check for and extract the build command
        local start_pos, end_pos = string.find(param, "%[%[.*%]%]")
        if start_pos then
            build_command = string.sub(param, start_pos + 2, end_pos - 2)
            regular_param = string.sub(param, end_pos + 1)
            regular_param = string.gsub(regular_param, "^%s*(.-)%s*$", "%1") -- Trim whitespace

            -- Activate build mode and process the command
            echo.build_and_append(build_command, player_name)
            build_mode_activated = true
        end

        -- If the only thing was a build command, we are done.
        if build_mode_activated and regular_param == "" then
            return true
        end

        local conv_state = pconv[player_name]
        if not conv_state or not conv_state.current_dialogue_id then
            -- If the user was just building, don't show an error.
            if not build_mode_activated then
                 minetest.chat_send_player(player_name, "You are not in a conversation.")
            end
            return false
        end

        local choice_number = tonumber(regular_param)
        if not choice_number then
            minetest.chat_send_player(player_name, "Please enter a number for your choice.")
            return false
        end

        local dialogue_data = echo.dialogue[conv_state.current_dialogue_id]
        if conv_state.active_options and choice_number >= 1 and choice_number <= #conv_state.active_options then
            local selected_option = conv_state.active_options[choice_number]
            local player = minetest.get_player_by_name(player_name)
            if player then
                display_dialogue(player, conv_state.current_dialogue_id, selected_option.to)
            end
        else
            minetest.chat_send_player(player_name, "Invalid choice.")
        end
        return true
    end
})

-- Clean up on player leave
minetest.register_on_leaveplayer(function(player)
    xhud(player)
    pconv[player:get_player_name()] = nil
end)

-- Global step for distance check
minetest.register_globalstep(function(dtime)
    for player_name, conv_state in pairs(pconv) do
        if conv_state.pos then
            local player = minetest.get_player_by_name(player_name)
            if player then
                local distance = vector.distance(player:get_pos(), conv_state.pos)
                if distance > 3 and conv_state.hud_visible then
                    xhud(player)
                    conv_state.hud_visible = false
                   -- minetest.chat_send_player(player_name, "You have moved too far away.")
                elseif distance <= 3 and not conv_state.hud_visible then
                    display_dialogue(player, conv_state.current_dialogue_id, conv_state.current_step_key)
                    conv_state.hud_visible = true
                    --minetest.chat_send_player(player_name, "You have returned.")
                end
            end
        end
    end
end)

--print("[echo] Conversation engine loaded.")

local hud_id

minetest.register_on_joinplayer(function(player)
    local player_name = player:get_player_name()
    if not player_name then return end
end)

minetest.register_on_leaveplayer(function(player)
    if hud_id then
        player:hud_remove(hud_id)
    end
end)

minetest.register_node("runes:ke", {
	description = "Ke = May",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"rock.png^[transformR270",
		"rock.png^[transformR90",
		"rock.png^runelay_ke.png", 
        "rock.png^[transformFX",
		"rock.png", "rock.png"},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:ke',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}
})

minetest.register_node("runes:lit_hui", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="runestone_1x24.png", animation = {type = "vertical_frames", length=3.0}}, "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:hui",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = {x=pos.x,y=pos.y,z=pos.z}
		s = minetest.env:get_node(pos)
		minetest.env:remove_node(wpos)
		minetest.set_node(wpos, {name="runes:hui", param2 = s.param2})
		local tpos = {x=pos.x,y=pos.y+1,z=pos.z}
		local hpos = {x=pos.x,y=pos.y,z=pos.z+1}
		local fpos = {x=pos.x,y=pos.y,z=pos.z-1}
		local rpos = {x=pos.x+1,y=pos.y,z=pos.z}
		local lpos = {x=pos.x-1,y=pos.y,z=pos.z}
		local bpos = {x=pos.x,y=pos.y-1,z=pos.z}
		if math.floor(s.param2/4) == 0 then
			minetest.set_node(tpos, {name="tool:prup", param2 = 0})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 1 then 
			minetest.set_node(hpos, {name="tool:prup", param2 = 4})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 2 then
			minetest.set_node(fpos, {name="tool:prup", param2 = 8})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 3 then
			minetest.set_node(rpos, {name="tool:prup", param2 = 12})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 4 then
			minetest.set_node(lpos, {name="tool:prup", param2 = 16})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 5 then
			minetest.set_node(bpos, {name="tool:prup", param2 = 20})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		end 

	end
})

minetest.register_node("runes:lit_hui_tempo", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="runestone_1x24.png", animation = {type = "vertical_frames", length=3.0}}, "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 5,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:hui",
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
	on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
		local wpos = {x=pos.x,y=pos.y,z=pos.z}
		s = minetest.env:get_node(pos)
		minetest.env:remove_node(wpos)
		minetest.set_node(wpos, {name="runes:hui", param2 = s.param2})
		local tpos = {x=pos.x,y=pos.y+1,z=pos.z}
		local hpos = {x=pos.x,y=pos.y,z=pos.z+1}
		local fpos = {x=pos.x,y=pos.y,z=pos.z-1}
		local rpos = {x=pos.x+1,y=pos.y,z=pos.z}
		local lpos = {x=pos.x-1,y=pos.y,z=pos.z}
		local bpos = {x=pos.x,y=pos.y-1,z=pos.z}
		if math.floor(s.param2/4) == 0 then
			minetest.set_node(tpos, {name="tool:prup", param2 = 0})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y+1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 1 then 
			minetest.set_node(hpos, {name="tool:prup", param2 = 4})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z+1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 2 then
			minetest.set_node(fpos, {name="tool:prup", param2 = 8})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y, z=wpos.z-1.5}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 3 then
			minetest.set_node(rpos, {name="tool:prup", param2 = 12})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x+1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 4 then
			minetest.set_node(lpos, {name="tool:prup", param2 = 16})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x-1.5, y=wpos.y, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		elseif math.floor(s.param2/4) == 5 then
			minetest.set_node(bpos, {name="tool:prup", param2 = 20})
		local vel_a = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_a = {x=0,y=-2,z=0}
		local obj_a = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_a:setvelocity(vel_a)
		obj_a:setacceleration(acc_a)
		local vel_b = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_b = {x=0,y=-2,z=0}
		local obj_b = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_b:setvelocity(vel_b)
		obj_b:setacceleration(acc_b)
		local vel_c = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_c = {x=0,y=-2,z=0}
		local obj_c = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_c:setvelocity(vel_c)
		obj_c:setacceleration(acc_c)
		local vel_d = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_d = {x=0,y=-2,z=0}
		local obj_d = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_d:setvelocity(vel_d)
		obj_d:setacceleration(acc_d)
		local vel_e = {x=math.random(-1,1)*math.sin(wpos.x), y=2+math.cos(2*wpos.y),z=math.random(-1,1)*math.sin(wpos.z)}
		local acc_e = {x=0,y=-2,z=0}
		local obj_e = minetest.env:add_entity({x=wpos.x, y=wpos.y-1.5, z=wpos.z}, "tool:bew")
		obj_e:setvelocity(vel_e)
		obj_e:setacceleration(acc_e)
		end 

	end
})

minetest.register_node("runes:hui", {
	description = "Hui = Return",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	tiles = {"runestone.png", "rock.png", "rock.png", "rock.png", "rock.png", "rock.png"},
	light_source = 0,
	groups = {cracky=3},
	drop = 'runes:hui',
	node_box = {type = "fixed", fixed = {-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "story", pos)
        return itemstack
    end
})

minetest.register_abm({
    nodenames = {"runes:hui"},
    interval = 3,
    chance = 75,
    action = function(pos, node)
        minetest.env:remove_node(pos)
        minetest.set_node(pos, {name = "runes:lit_hui_tempo", param2 = node.param2})
	minetest.add_particlespawner({
		amount = math.random(1,2),
		time = math.random(1,2),
		glow = 14,
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=-0.1+math.sin(pos.x), y=-0.1+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxvel = {x=0.1+math.sin(pos.x), y=0.4+math.sin(pos.x), z=0.1+math.cos(pos.x)},
		minacc = {x=-0.1+math.sin(pos.x), y=-0.4+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxacc = {x=0.1+math.cos(pos.x), y=0.1+math.sin(pos.x), z=0.1-math.sin(pos.x)},
		exptime = {min=2, max=5},
		collisiondetection = true,
		collision_removal = false,
		texpool = {
			{name = "glypy20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/40),y=(math.random(10,20)/40)}}}}
		})
    end
})

minetest.register_abm({
    nodenames = {"runes:lit_hui_tempo"},
    interval = 2,
    chance = 2,
    action = function(pos, node)
        minetest.env:remove_node(pos)
        minetest.set_node(pos, {name = "runes:hui", param2 = node.param2})
	minetest.add_particlespawner({
		amount = math.random(1,2),
		time = math.random(1,2),
		glow = 14,
		pos = {min={x=pos.x-0.5, y=pos.y+0.5, z=pos.z-0.5}, max={x=pos.x+0.5, y=pos.y+0.5, z=pos.z+0.5}, bias=math.random(0,1)},
		minvel = {x=-0.1+math.sin(pos.x), y=-0.1+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxvel = {x=0.1+math.sin(pos.x), y=0.4+math.sin(pos.x), z=0.1+math.cos(pos.x)},
		minacc = {x=-0.1+math.sin(pos.x), y=-0.4+math.sin(pos.x), z=-0.1+math.cos(pos.x)},
		maxacc = {x=0.1+math.cos(pos.x), y=0.1+math.sin(pos.x), z=0.1-math.sin(pos.x)},
		exptime = {min=2, max=5},
		collisiondetection = true,
		collision_removal = false,
		texpool = {
			{name = "glypy20.png", animation = {type = "vertical_frames", aspect_w = 6, aspect_h = 6, length = 2}, blend='alpha', scale_tween={{x=(math.random(10,20)/40),y=(math.random(10,20)/40)}}}}
		})
    end
})

function c(n)
	return n/32-1/2
end

minetest.register_node("runes:nbdx1", {
	description = "Niu Bi Da Xue Yi",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", "rock.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx1",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(1),c(32),c(10)},
	{c(1),c(0),c(0), c(2),c(32),c(13)},
	{c(2),c(0),c(0), c(3),c(32),c(15)},
	{c(3),c(0),c(0), c(4),c(32),c(17)},
	{c(4),c(0),c(0), c(5),c(32),c(18)},
	{c(5),c(0),c(0), c(6),c(32),c(19)},
	{c(6),c(0),c(0), c(7),c(32),c(20)},
	{c(7),c(0),c(0), c(8),c(32),c(22)},
	{c(8),c(0),c(0), c(9),c(32),c(23)},
	{c(9),c(0),c(0), c(10),c(32),c(24)},
	{c(10),c(0),c(0), c(12),c(32),c(25)},
	{c(12),c(0),c(0), c(13),c(32),c(26)},
	{c(13),c(0),c(0), c(14),c(32),c(27)},
	{c(14),c(0),c(0), c(15),c(32),c(28)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(19),c(32),c(30)},
	{c(19),c(0),c(0), c(22),c(32),c(31)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx1c", {
	description = "Niu Bi Da Xue Yi Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1c_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", "rock.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx1c",
	node_box = {type = "fixed", fixed = {
	{-0.5, -0.5, -0.5, 0.5, 0.5, 0.5}}},
})

minetest.register_node("runes:rbdx1", {
	description = "Ru Bli Da Xue Yi",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx1_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", "rubble.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:rbdx1",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(1),c(32),c(10)},
	{c(1),c(0),c(0), c(2),c(32),c(13)},
	{c(2),c(0),c(0), c(3),c(32),c(15)},
	{c(3),c(0),c(0), c(4),c(32),c(17)},
	{c(4),c(0),c(0), c(5),c(32),c(18)},
	{c(5),c(0),c(0), c(6),c(32),c(19)},
	{c(6),c(0),c(0), c(7),c(32),c(20)},
	{c(7),c(0),c(0), c(8),c(32),c(22)},
	{c(8),c(0),c(0), c(9),c(32),c(23)},
	{c(9),c(0),c(0), c(10),c(32),c(24)},
	{c(10),c(0),c(0), c(12),c(32),c(25)},
	{c(12),c(0),c(0), c(13),c(32),c(26)},
	{c(13),c(0),c(0), c(14),c(32),c(27)},
	{c(14),c(0),c(0), c(15),c(32),c(28)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(19),c(32),c(30)},
	{c(19),c(0),c(0), c(22),c(32),c(31)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx1c", {
	description = "Ru Bli Da Xue Yi Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx1c_1x11.png", animation = {type = "vertical_frames", length=3.7}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx1br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", "rubble.png", {name="dx1bb16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:rbdx1c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx2", {
	description = "Niu Bi Da Xue Er",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2",
	node_box = {type = "fixed", fixed = {
	{c(0), c(0), c(0), c(10), c(32), c(32)},
	{c(10),c(0),c(0), c(13),c(32),c(31)},
	{c(13),c(0),c(0), c(15),c(32),c(30)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(18),c(32),c(28)},
	{c(18),c(0),c(0), c(19),c(32),c(27)},
	{c(19),c(0),c(0), c(20),c(32),c(26)},
	{c(20),c(0),c(0), c(22),c(32),c(25)},
	{c(22),c(0),c(0), c(23),c(32),c(24)},
	{c(23),c(0),c(0), c(24),c(32),c(23)},
	{c(24),c(0),c(0), c(25),c(32),c(22)},
	{c(25),c(0),c(0), c(26),c(32),c(20)},
	{c(26),c(0),c(0), c(27),c(32),c(19)},
	{c(27),c(0),c(0), c(28),c(32),c(18)},
	{c(28),c(0),c(0), c(29),c(32),c(17)},
	{c(29),c(0),c(0), c(30),c(32),c(15)},	
	{c(30),c(0),c(0), c(31),c(32),c(13)},
	{c(31),c(0),c(0), c(32),c(32),c(10)}}},
})

minetest.register_node("runes:nbdx2c", {
	description = "Niu Bi Da Xue Er Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2c_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx2", {
	description = "Ru Bli Da Xue Er",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx2_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2",
	node_box = {type = "fixed", fixed = {
	{c(0), c(0), c(0), c(10), c(32), c(32)},
	{c(10),c(0),c(0), c(13),c(32),c(31)},
	{c(13),c(0),c(0), c(15),c(32),c(30)},
	{c(15),c(0),c(0), c(17),c(32),c(29)},
	{c(17),c(0),c(0), c(18),c(32),c(28)},
	{c(18),c(0),c(0), c(19),c(32),c(27)},
	{c(19),c(0),c(0), c(20),c(32),c(26)},
	{c(20),c(0),c(0), c(22),c(32),c(25)},
	{c(22),c(0),c(0), c(23),c(32),c(24)},
	{c(23),c(0),c(0), c(24),c(32),c(23)},
	{c(24),c(0),c(0), c(25),c(32),c(22)},
	{c(25),c(0),c(0), c(26),c(32),c(20)},
	{c(26),c(0),c(0), c(27),c(32),c(19)},
	{c(27),c(0),c(0), c(28),c(32),c(18)},
	{c(28),c(0),c(0), c(29),c(32),c(17)},
	{c(29),c(0),c(0), c(30),c(32),c(15)},	
	{c(30),c(0),c(0), c(31),c(32),c(13)},
	{c(31),c(0),c(0), c(32),c(32),c(10)}}},
})

minetest.register_node("runes:rbdx2c", {
	description = "Ru Bli Da Xue Er Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx2c_1x13.png", animation = {type = "vertical_frames", length=3.3}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2br16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx2rg16.png", animation = {type = "vertical_frames", length=3}}},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx2c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx3", {
	description = "Niu Bi Da Xue San",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(10),c(32),c(32)},
	{c(10),c(0),c(1), c(13),c(32),c(32)},
	{c(13),c(0),c(2), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(4), c(18),c(32),c(32)},
	{c(18),c(0),c(5), c(19),c(32),c(32)},
	{c(19),c(0),c(6), c(20),c(32),c(32)},
	{c(20),c(0),c(7), c(22),c(32),c(32)},
	{c(22),c(0),c(8), c(23),c(32),c(32)},
	{c(23),c(0),c(9), c(24),c(32),c(32)},
	{c(24),c(0),c(10), c(25),c(32),c(32)},
	{c(25),c(0),c(12), c(26),c(32),c(32)},
	{c(26),c(0),c(13), c(27),c(32),c(32)},
	{c(27),c(0),c(14), c(28),c(32),c(32)},
	{c(28),c(0),c(15), c(29),c(32),c(32)},
	{c(29),c(0),c(17), c(30),c(32),c(32)},
	{c(30),c(0),c(19), c(31),c(32),c(32)},
	{c(31),c(0),c(22), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx3c", {
	description = "Niu Bi Da Xue San Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3c_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx3", {
	description = "Ru Bli Da Xue San",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx3_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(0), c(10),c(32),c(32)},
	{c(10),c(0),c(1), c(13),c(32),c(32)},
	{c(13),c(0),c(2), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(4), c(18),c(32),c(32)},
	{c(18),c(0),c(5), c(19),c(32),c(32)},
	{c(19),c(0),c(6), c(20),c(32),c(32)},
	{c(20),c(0),c(7), c(22),c(32),c(32)},
	{c(22),c(0),c(8), c(23),c(32),c(32)},
	{c(23),c(0),c(9), c(24),c(32),c(32)},
	{c(24),c(0),c(10), c(25),c(32),c(32)},
	{c(25),c(0),c(12), c(26),c(32),c(32)},
	{c(26),c(0),c(13), c(27),c(32),c(32)},
	{c(27),c(0),c(14), c(28),c(32),c(32)},
	{c(28),c(0),c(15), c(29),c(32),c(32)},
	{c(29),c(0),c(17), c(30),c(32),c(32)},
	{c(30),c(0),c(19), c(31),c(32),c(32)},
	{c(31),c(0),c(22), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx3c", {
	description = "Ru Bli Da Xue San Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx3c_1x17.png", animation = {type = "vertical_frames", length=2.5}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx3gb16.png", animation = {type = "vertical_frames", length=3}}, {name="dx3rg16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx3c",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:nbdx4", {
	description = "Niu Bi Da Xue Si",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4c",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(22), c(1),c(32),c(32)},
	{c(1),c(0),c(19), c(2),c(32),c(32)},
	{c(2),c(0),c(17), c(3),c(32),c(32)},
	{c(3),c(0),c(15), c(4),c(32),c(32)},
	{c(4),c(0),c(14), c(5),c(32),c(32)},
	{c(5),c(0),c(13), c(6),c(32),c(32)},
	{c(6),c(0),c(12), c(7),c(32),c(32)},
	{c(7),c(0),c(10), c(8),c(32),c(32)},
	{c(8),c(0),c(9), c(9),c(32),c(32)},
	{c(9),c(0),c(8), c(10),c(32),c(32)},
	{c(10),c(0),c(7), c(12),c(32),c(32)},
	{c(12),c(0),c(6), c(13),c(32),c(32)},
	{c(13),c(0),c(5), c(14),c(32),c(32)},
	{c(14),c(0),c(4), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(2), c(19),c(32),c(32)},
	{c(19),c(0),c(1), c(22),c(32),c(32)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:nbdx4c", {
	description = "Niu Bi Da Xue Si Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4c_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rock.png"},
	light_source = 0,
	groups = {cracky=1, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:rbdx4", {
	description = "Ru Bli Da Xue Si",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="nbdx4_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{c(0),c(0),c(22), c(1),c(32),c(32)},
	{c(1),c(0),c(19), c(2),c(32),c(32)},
	{c(2),c(0),c(17), c(3),c(32),c(32)},
	{c(3),c(0),c(15), c(4),c(32),c(32)},
	{c(4),c(0),c(14), c(5),c(32),c(32)},
	{c(5),c(0),c(13), c(6),c(32),c(32)},
	{c(6),c(0),c(12), c(7),c(32),c(32)},
	{c(7),c(0),c(10), c(8),c(32),c(32)},
	{c(8),c(0),c(9), c(9),c(32),c(32)},
	{c(9),c(0),c(8), c(10),c(32),c(32)},
	{c(10),c(0),c(7), c(12),c(32),c(32)},
	{c(12),c(0),c(6), c(13),c(32),c(32)},
	{c(13),c(0),c(5), c(14),c(32),c(32)},
	{c(14),c(0),c(4), c(15),c(32),c(32)},
	{c(15),c(0),c(3), c(17),c(32),c(32)},
	{c(17),c(0),c(2), c(19),c(32),c(32)},
	{c(19),c(0),c(1), c(22),c(32),c(32)},
	{c(22),c(0),c(0), c(32),c(32),c(32)}}},
})

minetest.register_node("runes:rbdx4c", {
	description = "Ru Bli Da Xue Si Covol",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
tiles = {{name="rbdx4c_1x19.png", animation = {type = "vertical_frames", length=2.1}}, {name="rybble_x16.png", animation = {type = "vertical_frames", length=3}}, {name="dx4gb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png", {name="dx4bb16.png", animation = {type = "vertical_frames", length=3}}, "rubble.png"},
	light_source = 0,
	groups = {cracky=3, oddly_breakable_by_hand=0, not_in_creative_inventory=1},
	drop = "runes:nbdx4",
	node_box = {type = "fixed", fixed = {
	{-0.5,-0.5,-0.5, 0.5,0.5,0.5}}},
})

minetest.register_node("runes:0ur", {
	description = "0◣ red",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0red.png",
	tiles = {{name = "0ur_1x32.png",
		animation = {type = "vertical_frames",
		length = 25.8129}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0rd",
	node_box={type="fixed",fixed={
	{-0.5625,-0.5,-0.0625,-0.4375,-0.4875,0},
	{-0.4375,-0.5,-0.125,-0.375,-0.4875,-0.0625},
	{-0.375,-0.5,-0.1875,-0.3125,-0.4875,-0.125},
	{-0.3125,-0.5,-0.25,-0.25,-0.4875,-0.1875},
	{-0.25,-0.5,-0.3125,-0.1875,-0.4875,-0.25},
	{-0.1875,-0.5,-0.375,-0.125,-0.4875,-0.3125},
	{-0.125,-0.5,-0.4375,-0.0625,-0.4875,-0.375},
	{-0.0625,-0.5,-0.5625,0,-0.4875,-0.4375},
	{-0.125,-0.5,-0.625,-0.0625,-0.4875,-0.5625},
	{-0.1875,-0.5,-0.6875,-0.125,-0.4875,-0.625},
	{-0.25,-0.5,-0.75,-0.1875,-0.4875,-0.6875},
	{-0.3125,-0.5,-0.8125,-0.25,-0.4875,-0.75},
	{-0.375,-0.5,-0.875,-0.3125,-0.4875,-0.8125},
	{-0.4375,-0.5,-0.9325,-0.375,-0.4875,-0.875},
	{-0.5625,-0.5,-1,-0.4375,-0.4875,-0.9325},
	{-0.625,-0.5,-0.9325,-0.5625,-0.4875,-0.875},
	{-0.6875,-0.5,-0.875,-0.625,-0.4875,-0.8125},
	{-0.75,-0.5,-0.8125,-0.6875,-0.4875,-0.75},
	{-0.8125,-0.5,-0.75,-0.75,-0.4875,-0.6875},
	{-0.875,-0.5,-0.6875,-0.8125,-0.4875,-0.625},
	{-0.9375,-0.5,-0.625,-0.875,-0.4875,-0.5625},
	{-1,-0.5,-0.5625,-0.9375,-0.4875,-0.4375},
	{-0.9375,-0.5,-0.4375,-0.875,-0.4875,-0.375},
	{-0.875,-0.5,-0.375,-0.8125,-0.4875,-0.3125},
	{-0.8125,-0.5,-0.3125,-0.75,-0.4875,-0.25},
	{-0.75,-0.5,-0.25,-0.6875,-0.4875,-0.1875},
	{-0.6875,-0.5,-0.1875,-0.625,-0.4875,-0.125},
	{-0.625,-0.5,-0.125,-0.5625,-0.4875,-0.0625}}},
	collision_box={type="fixed",fixed={
	{-0.5625,-0.5,-0.0625,-0.4375,-0.4875,0},
	{-0.4375,-0.5,-0.125,-0.375,-0.4875,-0.0625},
	{-0.375,-0.5,-0.1875,-0.3125,-0.4875,-0.125},
	{-0.3125,-0.5,-0.25,-0.25,-0.4875,-0.1875},
	{-0.25,-0.5,-0.3125,-0.1875,-0.4875,-0.25},
	{-0.1875,-0.5,-0.375,-0.125,-0.4875,-0.3125},
	{-0.125,-0.5,-0.4375,-0.0625,-0.4875,-0.375},
	{-0.0625,-0.5,-0.5625,0,-0.4875,-0.4375},
	{-0.125,-0.5,-0.625,-0.0625,-0.4875,-0.5625},
	{-0.1875,-0.5,-0.6875,-0.125,-0.4875,-0.625},
	{-0.25,-0.5,-0.75,-0.1875,-0.4875,-0.6875},
	{-0.3125,-0.5,-0.8125,-0.25,-0.4875,-0.75},
	{-0.375,-0.5,-0.875,-0.3125,-0.4875,-0.8125},
	{-0.4375,-0.5,-0.9325,-0.375,-0.4875,-0.875},
	{-0.5625,-0.5,-1,-0.4375,-0.4875,-0.9325},
	{-0.625,-0.5,-0.9325,-0.5625,-0.4875,-0.875},
	{-0.6875,-0.5,-0.875,-0.625,-0.4875,-0.8125},
	{-0.75,-0.5,-0.8125,-0.6875,-0.4875,-0.75},
	{-0.8125,-0.5,-0.75,-0.75,-0.4875,-0.6875},
	{-0.875,-0.5,-0.6875,-0.8125,-0.4875,-0.625},
	{-0.9375,-0.5,-0.625,-0.875,-0.4875,-0.5625},
	{-1,-0.5,-0.5625,-0.9375,-0.4875,-0.4375},
	{-0.9375,-0.5,-0.4375,-0.875,-0.4875,-0.375},
	{-0.875,-0.5,-0.375,-0.8125,-0.4875,-0.3125},
	{-0.8125,-0.5,-0.3125,-0.75,-0.4875,-0.25},
	{-0.75,-0.5,-0.25,-0.6875,-0.4875,-0.1875},
	{-0.6875,-0.5,-0.1875,-0.625,-0.4875,-0.125},
	{-0.625,-0.5,-0.125,-0.5625,-0.4875,-0.0625}}}
})

minetest.register_node("runes:0rd", {
	description = "0 red",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0red.png",
	tiles = {{name = "0rd_1x32.png",
		animation = {type = "vertical_frames",
		length = 25.8129}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0rd",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.4375, 0.0625,-0.4875,0.5},
{0.0625,-0.5,0.375, 0.125,-0.4875,0.4375},
{0.125,-0.5,0.3125, 0.1875,-0.4875,0.375},
{0.1875,-0.5,0.25, 0.25,-0.4875,0.3125},
{0.25,-0.5,0.1875, 0.3125,-0.4875,0.25},
{0.3125,-0.5,0.125, 0.375,-0.4875,0.1875},
{0.375,-0.5,0.0625, 0.4375,-0.4875,0.125},
{0.4375,-0.5,-0.0625, 0.5,-0.4875,0.0625},
{0.375,-0.5,-0.125, 0.4375,-0.4875,-0.0625},
{0.3125,-0.5,-0.1875, 0.375,-0.4875,-0.125},
{0.25,-0.5,-0.25, 0.3125,-0.4875,-0.1875},
{0.1875,-0.5,-0.3125, 0.25,-0.4875,-0.25},
{0.125,-0.5,-0.375, 0.1875,-0.4875,-0.3125},
{0.0625,-0.5,-0.4325, 0.125,-0.4875,-0.375},
{-0.0625,-0.5,-0.5, 0.0625,-0.4875,-0.4325},
{-0.125,-0.5,-0.4325, -0.0625,-0.4875,-0.375},
{-0.1875,-0.5,-0.375, -0.125,-0.4875,-0.3125},
{-0.25,-0.5,-0.3125, -0.1875,-0.4875,-0.25},
{-0.3125,-0.5,-0.25, -0.25,-0.4875,-0.1875},
{-0.375,-0.5,-0.1875, -0.3125,-0.4875,-0.125},
{-0.4375,-0.5,-0.125, -0.375,-0.4875,-0.0625},
{-0.5,-0.5,-0.0625, -0.4375,-0.4875,0.0625},
{-0.4375,-0.5,0.0625, -0.375,-0.4875,0.125},
{-0.375,-0.5,0.125, -0.3125,-0.4875,0.1875},
{-0.3125,-0.5,0.1875, -0.25,-0.4875,0.25},
{-0.25,-0.5,0.25, -0.1875,-0.4875,0.3125},
{-0.1875,-0.5,0.3125, -0.125,-0.4875,0.375},
{-0.125,-0.5,0.375, -0.0625,-0.4875,0.4375}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.4375, 0.0625,-0.4875,0.5},
{0.0625,-0.5,0.375, 0.125,-0.4875,0.4375},
{0.125,-0.5,0.3125, 0.1875,-0.4875,0.375},
{0.1875,-0.5,0.25, 0.25,-0.4875,0.3125},
{0.25,-0.5,0.1875, 0.3125,-0.4875,0.25},
{0.3125,-0.5,0.125, 0.375,-0.4875,0.1875},
{0.375,-0.5,0.0625, 0.4375,-0.4875,0.125},
{0.4375,-0.5,-0.0625, 0.5,-0.4875,0.0625},
{0.375,-0.5,-0.125, 0.4375,-0.4875,-0.0625},
{0.3125,-0.5,-0.1875, 0.375,-0.4875,-0.125},
{0.25,-0.5,-0.25, 0.3125,-0.4875,-0.1875},
{0.1875,-0.5,-0.3125, 0.25,-0.4875,-0.25},
{0.125,-0.5,-0.375, 0.1875,-0.4875,-0.3125},
{0.0625,-0.5,-0.4325, 0.125,-0.4875,-0.375},
{-0.0625,-0.5,-0.5, 0.0625,-0.4875,-0.4325},
{-0.125,-0.5,-0.4325, -0.0625,-0.4875,-0.375},
{-0.1875,-0.5,-0.375, -0.125,-0.4875,-0.3125},
{-0.25,-0.5,-0.3125, -0.1875,-0.4875,-0.25},
{-0.3125,-0.5,-0.25, -0.25,-0.4875,-0.1875},
{-0.375,-0.5,-0.1875, -0.3125,-0.4875,-0.125},
{-0.4375,-0.5,-0.125, -0.375,-0.4875,-0.0625},
{-0.5,-0.5,-0.0625, -0.4375,-0.4875,0.0625},
{-0.4375,-0.5,0.0625, -0.375,-0.4875,0.125},
{-0.375,-0.5,0.125, -0.3125,-0.4875,0.1875},
{-0.3125,-0.5,0.1875, -0.25,-0.4875,0.25},
{-0.25,-0.5,0.25, -0.1875,-0.4875,0.3125},
{-0.1875,-0.5,0.3125, -0.125,-0.4875,0.375},
{-0.125,-0.5,0.375, -0.0625,-0.4875,0.4375}}}
})

minetest.register_node("runes:0br", {
	description = "0◤ blue",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0blue.png",
	tiles = {{name = "0br_1x28.png",
		animation = {type = "vertical_frames",
		length = 12}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0be",
	node_box={type="fixed",fixed={
	{-0.5625,-0.5,0.875,-0.4375,-0.4875,0.9375},
	{-0.4375,-0.5,0.8125,-0.375,-0.4875,0.875},
	{-0.375,-0.5,0.75,-0.3125,-0.4875,0.8125},
	{-0.3125,-0.5,0.6875,-0.25,-0.4875,0.75},
	{-0.25,-0.5,0.625,-0.1875,-0.4875,0.6875},
	{-0.1875,-0.5,0.5625,-0.125,-0.4875,0.625},
	{-0.125,-0.5,0.4375,-0.0625,-0.4875,0.5625},
	{-0.1875,-0.5,0.375,-0.125,-0.4875,0.4375},
	{-0.25,-0.5,0.3125,-0.1875,-0.4875,0.375},
	{-0.3125,-0.5,0.25,-0.25,-0.4875,0.3125},
	{-0.375,-0.5,0.1875,-0.3125,-0.4875,0.25},
	{-0.4375,-0.5,0.125,-0.375,-0.4875,0.1875},
	{-0.5625,-0.5,0.0625,-0.4375,-0.4875,0.125},
	{-0.625,-0.5,0.125,-0.5625,-0.4875,0.1875},
	{-0.6875,-0.5,0.1875,-0.625,-0.4875,0.25},
	{-0.75,-0.5,0.25,-0.6875,-0.4875,0.3125},
	{-0.8125,-0.5,0.3125,-0.75,-0.4875,0.375},
	{-0.875,-0.5,0.375,-0.8125,-0.4875,0.4375},
	{-0.9375,-0.5,0.4375,-0.875,-0.4875,0.5625},
	{-0.875,-0.5,0.5625,-0.8175,-0.4875,0.625},
	{-0.8125,-0.5,0.625,-0.75,-0.4875,0.6875},
	{-0.75,-0.5,0.6875,-0.6875,-0.4875,0.75},
	{-0.6875,-0.5,0.75,-0.625,-0.4875,0.8125},
	{-0.625,-0.5,0.8125,-0.5625,-0.4875,0.875}}},
	collision_box={type="fixed",fixed={
	{-0.5625,-0.5,0.875,-0.4375,-0.4875,0.9375},
	{-0.4375,-0.5,0.8125,-0.375,-0.4875,0.875},
	{-0.375,-0.5,0.75,-0.3125,-0.4875,0.8125},
	{-0.3125,-0.5,0.6875,-0.25,-0.4875,0.75},
	{-0.25,-0.5,0.625,-0.1875,-0.4875,0.6875},
	{-0.1875,-0.5,0.5625,-0.125,-0.4875,0.625},
	{-0.125,-0.5,0.4375,-0.0625,-0.4875,0.5625},
	{-0.1875,-0.5,0.375,-0.125,-0.4875,0.4375},
	{-0.25,-0.5,0.3125,-0.1875,-0.4875,0.375},
	{-0.3125,-0.5,0.25,-0.25,-0.4875,0.3125},
	{-0.375,-0.5,0.1875,-0.3125,-0.4875,0.25},
	{-0.4375,-0.5,0.125,-0.375,-0.4875,0.1875},
	{-0.5625,-0.5,0.0625,-0.4375,-0.4875,0.125},
	{-0.625,-0.5,0.125,-0.5625,-0.4875,0.1875},
	{-0.6875,-0.5,0.1875,-0.625,-0.4875,0.25},
	{-0.75,-0.5,0.25,-0.6875,-0.4875,0.3125},
	{-0.8125,-0.5,0.3125,-0.75,-0.4875,0.375},
	{-0.875,-0.5,0.375,-0.8125,-0.4875,0.4375},
	{-0.9375,-0.5,0.4375,-0.875,-0.4875,0.5625},
	{-0.875,-0.5,0.5625,-0.8175,-0.4875,0.625},
	{-0.8125,-0.5,0.625,-0.75,-0.4875,0.6875},
	{-0.75,-0.5,0.6875,-0.6875,-0.4875,0.75},
	{-0.6875,-0.5,0.75,-0.625,-0.4875,0.8125},
	{-0.625,-0.5,0.8125,-0.5625,-0.4875,0.875}}}
})

minetest.register_node("runes:0be", {
	description = "0 blue",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0blue.png",
	tiles = {{name = "0be_1x28.png",
		animation = {type = "vertical_frames",
		length = 12}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1},
	drop = "runes:0be",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.375, 0.0625,-0.4875,0.4375},
{0.0625,-0.5,0.3125, 0.125,-0.4875,0.375},
{0.125,-0.5,0.25, 0.1875,-0.4875,0.3125},
{0.1875,-0.5,0.1875, 0.25,-0.4875,0.25},
{0.25,-0.5,0.125, 0.3125,-0.4875,0.1875},
{0.3125,-0.5,0.0625, 0.375,-0.4875,0.125},
{0.375,-0.5,-0.0625, 0.4375,-0.4875,0.0625},
{0.3125,-0.5,-0.125, 0.375,-0.4875,-0.0625},
{0.25,-0.5,-0.1875, 0.3125,-0.4875,-0.125},
{0.1875,-0.5,-0.25, 0.25,-0.4875,-0.1875},
{0.125,-0.5,-0.3125, 0.1875,-0.4875,-0.25},
{0.0625,-0.5,-0.375, 0.125,-0.4875,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.4875,-0.375},
{-0.125,-0.5,-0.375, -0.0625,-0.4875,-0.3125},
{-0.1875,-0.5,-0.3125, -0.125,-0.4875,-0.25},
{-0.25,-0.5,-0.25, -0.1875,-0.4875,-0.1875},
{-0.3125,-0.5,-0.1875, -0.25,-0.4875,-0.125},
{-0.375,-0.5,-0.125, -0.3125,-0.4875,-0.0625},
{-0.4375,-0.5,-0.0625, -0.375,-0.4875,0.0625},
{-0.375,-0.5,0.0625, -0.3175,-0.4875,0.125},
{-0.3125,-0.5,0.125, -0.25,-0.4875,0.1875},
{-0.25,-0.5,0.1875, -0.1875,-0.4875,0.25},
{-0.1875,-0.5,0.25, -0.125,-0.4875,0.3125},
{-0.125,-0.5,0.3125, -0.0625,-0.4875,0.375}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.375, 0.0625,-0.4875,0.4375},
{0.0625,-0.5,0.3125, 0.125,-0.4875,0.375},
{0.125,-0.5,0.25, 0.1875,-0.4875,0.3125},
{0.1875,-0.5,0.1875, 0.25,-0.4875,0.25},
{0.25,-0.5,0.125, 0.3125,-0.4875,0.1875},
{0.3125,-0.5,0.0625, 0.375,-0.4875,0.125},
{0.375,-0.5,-0.0625, 0.4375,-0.4875,0.0625},
{0.3125,-0.5,-0.125, 0.375,-0.4875,-0.0625},
{0.25,-0.5,-0.1875, 0.3125,-0.4875,-0.125},
{0.1875,-0.5,-0.25, 0.25,-0.4875,-0.1875},
{0.125,-0.5,-0.3125, 0.1875,-0.4875,-0.25},
{0.0625,-0.5,-0.375, 0.125,-0.4875,-0.3125},
{-0.0625,-0.5,-0.4375, 0.0625,-0.4875,-0.375},
{-0.125,-0.5,-0.375, -0.0625,-0.4875,-0.3125},
{-0.1875,-0.5,-0.3125, -0.125,-0.4875,-0.25},
{-0.25,-0.5,-0.25, -0.1875,-0.4875,-0.1875},
{-0.3125,-0.5,-0.1875, -0.25,-0.4875,-0.125},
{-0.375,-0.5,-0.125, -0.3125,-0.4875,-0.0625},
{-0.4375,-0.5,-0.0625, -0.375,-0.4875,0.0625},
{-0.375,-0.5,0.0625, -0.3175,-0.4875,0.125},
{-0.3125,-0.5,0.125, -0.25,-0.4875,0.1875},
{-0.25,-0.5,0.1875, -0.1875,-0.4875,0.25},
{-0.1875,-0.5,0.25, -0.125,-0.4875,0.3125},
{-0.125,-0.5,0.3125, -0.0625,-0.4875,0.375}}}
})

minetest.register_node("runes:0bl", {
	description = "◥0 green",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0green.png",
	tiles = {{name = "0bl_1x24.png",
		animation = {type = "vertical_frames",
		length = 6.3405}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0gn",
	node_box={type="fixed",fixed={
	{0.4375,-0.5,0.8125,0.5625,-0.4875,0.875},
	{0.5625,-0.5,0.75,0.625,-0.4875,0.8125},
	{0.625,-0.5,0.6875,0.6875,-0.4875,0.75},
	{0.6875,-0.5,0.625,0.75,-0.4875,0.6875},
	{0.75,-0.5,0.5625,0.8125,-0.4875,0.625},
	{0.8125,-0.5,0.4375,0.875,-0.4875,0.5625},
	{0.75,-0.5,0.375,0.8125,-0.4875,0.4375},
	{0.6875,-0.5,0.3125,0.75,-0.4875,0.375},
	{0.625,-0.5,0.25,0.6875,-0.4875,0.3125},
	{0.5625,-0.5,0.1875,0.625,-0.4875,0.25},
	{0.4375,-0.5,0.125,0.5625,-0.4875,0.1875},
	{0.375,-0.5,0.1875,0.4375,-0.4875,0.25},
	{0.3125,-0.5,0.25,0.375,-0.4875,0.3125},
	{0.25,-0.5,0.3125,0.3125,-0.4875,0.375},
	{0.1875,-0.5,0.375,0.25,-0.4875,0.4375},
	{0.125,-0.5,0.4375,0.1875,-0.4875,0.5625},
	{0.1875,-0.5,0.5625,0.25,-0.4875,0.625},
	{0.25,-0.5,0.625,0.3125,-0.4875,0.6875},
	{0.3125,-0.5,0.6875,0.375,-0.4875,0.75},
	{0.375,-0.5,0.75,0.4375,-0.4875,0.8125}}},
	collision_box={type="fixed",fixed={
	{0.4375,-0.5,0.8125,0.5625,-0.4875,0.875},
	{0.5625,-0.5,0.75,0.625,-0.4875,0.8125},
	{0.625,-0.5,0.6875,0.6875,-0.4875,0.75},
	{0.6875,-0.5,0.625,0.75,-0.4875,0.6875},
	{0.75,-0.5,0.5625,0.8125,-0.4875,0.625},
	{0.8125,-0.5,0.4375,0.875,-0.4875,0.5625},
	{0.75,-0.5,0.375,0.8125,-0.4875,0.4375},
	{0.6875,-0.5,0.3125,0.75,-0.4875,0.375},
	{0.625,-0.5,0.25,0.6875,-0.4875,0.3125},
	{0.5625,-0.5,0.1875,0.625,-0.4875,0.25},
	{0.4375,-0.5,0.125,0.5625,-0.4875,0.1875},
	{0.375,-0.5,0.1875,0.4375,-0.4875,0.25},
	{0.3125,-0.5,0.25,0.375,-0.4875,0.3125},
	{0.25,-0.5,0.3125,0.3125,-0.4875,0.375},
	{0.1875,-0.5,0.375,0.25,-0.4875,0.4375},
	{0.125,-0.5,0.4375,0.1875,-0.4875,0.5625},
	{0.1875,-0.5,0.5625,0.25,-0.4875,0.625},
	{0.25,-0.5,0.625,0.3125,-0.4875,0.6875},
	{0.3125,-0.5,0.6875,0.375,-0.4875,0.75},
	{0.375,-0.5,0.75,0.4375,-0.4875,0.8125}}}
})

minetest.register_node("runes:0gn", {
	description = "0 green",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0green.png",
	tiles = {{name = "0gn_1x24.png",
		animation = {type = "vertical_frames",
		length = 6.3405}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0gn",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.3125, 0.0625,-0.4875,0.375},
{0.0625,-0.5,0.25, 0.125,-0.4875,0.3125},
{0.125,-0.5,0.1875, 0.1875,-0.4875,0.25},
{0.1875,-0.5,0.125, 0.25,-0.4875,0.1875},
{0.25,-0.5,0.0625, 0.3125,-0.4875,0.125},
{0.3125,-0.5,-0.0625, 0.375,-0.4875,0.0625},
{0.25,-0.5,-0.125, 0.3125,-0.4875,-0.0625},
{0.1875,-0.5,-0.1875, 0.25,-0.4875,-0.125},
{0.125,-0.5,-0.25, 0.1875,-0.4875,-0.1875},
{0.0625,-0.5,-0.3125, 0.125,-0.4875,-0.25},
{-0.0625,-0.5,-0.375, 0.0625,-0.4875,-0.3125},
{-0.125,-0.5,-0.3125, -0.0625,-0.4875,-0.25},
{-0.1875,-0.5,-0.25, -0.125,-0.4875,-0.1875},
{-0.25,-0.5,-0.1875, -0.1875,-0.4875,-0.125},
{-0.3125,-0.5,-0.125, -0.25,-0.4875,-0.0625},
{-0.375,-0.5,-0.0625, -0.3125,-0.4875,0.0625},
{-0.3125,-0.5,0.0625, -0.25,-0.4875,0.125},
{-0.25,-0.5,0.125, -0.1875,-0.4875,0.1875},
{-0.1875,-0.5,0.1875, -0.125,-0.4875,0.25},
{-0.125,-0.5,0.25, -0.0625,-0.4875,0.3125}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.3125, 0.0625,-0.4875,0.375},
{0.0625,-0.5,0.25, 0.125,-0.4875,0.3125},
{0.125,-0.5,0.1875, 0.1875,-0.4875,0.25},
{0.1875,-0.5,0.125, 0.25,-0.4875,0.1875},
{0.25,-0.5,0.0625, 0.3125,-0.4875,0.125},
{0.3125,-0.5,-0.0625, 0.375,-0.4875,0.0625},
{0.25,-0.5,-0.125, 0.3125,-0.4875,-0.0625},
{0.1875,-0.5,-0.1875, 0.25,-0.4875,-0.125},
{0.125,-0.5,-0.25, 0.1875,-0.4875,-0.1875},
{0.0625,-0.5,-0.3125, 0.125,-0.4875,-0.25},
{-0.0625,-0.5,-0.375, 0.0625,-0.4875,-0.3125},
{-0.125,-0.5,-0.3125, -0.0625,-0.4875,-0.25},
{-0.1875,-0.5,-0.25, -0.125,-0.4875,-0.1875},
{-0.25,-0.5,-0.1875, -0.1875,-0.4875,-0.125},
{-0.3125,-0.5,-0.125, -0.25,-0.4875,-0.0625},
{-0.375,-0.5,-0.0625, -0.3125,-0.4875,0.0625},
{-0.3125,-0.5,0.0625, -0.25,-0.4875,0.125},
{-0.25,-0.5,0.125, -0.1875,-0.4875,0.1875},
{-0.1875,-0.5,0.1875, -0.125,-0.4875,0.25},
{-0.125,-0.5,0.25, -0.0625,-0.4875,0.3125}}}
})

minetest.register_node("runes:0ul", {
	description = "◢0 black",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0black.png",
	tiles = {{name = "0ul_1x20.png",
		animation = {type = "vertical_frames",
		length = 2.0665}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = "runes:0bk",
	node_box={type="fixed",fixed={
	{0.4375,-0.5,-0.25,0.5625,-0.4875,-0.1875},
	{0.5625,-0.5,-0.3125,0.625,-0.4875,-0.25},
	{0.625,-0.5,-0.375,0.6875,-0.4875,-0.3125},
	{0.6875,-0.5,-0.4375,0.75,-0.4875,-0.375},
	{0.75,-0.5,-0.5625,0.8125,-0.4875,-0.4375},
	{0.6875,-0.5,-0.625,0.75,-0.4875,-0.5625},
	{0.625,-0.5,-0.6875,0.6875,-0.4875,-0.625},
	{0.5625,-0.5,-0.75,0.625,-0.4875,-0.6875},
	{0.4375,-0.5,-0.8125,0.5625,-0.4875,-0.75},
	{0.375,-0.5,-0.75,0.4375,-0.4875,-0.6875},
	{0.3125,-0.5,-0.6875,0.375,-0.4875,-0.625},
	{0.25,-0.5,-0.625,0.3125,-0.4875,-0.5625},
	{0.1875,-0.5,-0.5625,0.25,-0.4875,-0.4375},
	{0.25,-0.5,-0.4375,0.3125,-0.4875,-0.375},
	{0.3125,-0.5,-0.375,0.375,-0.4875,-0.3125},
	{0.375,-0.5,-0.3125,0.4375,-0.4875,-0.25}}},
	collision_box={type="fixed",fixed={
	{0.4375,-0.5,-0.25,0.5625,-0.4875,-0.1875},
	{0.5625,-0.5,-0.3125,0.625,-0.4875,-0.25},
	{0.625,-0.5,-0.375,0.6875,-0.4875,-0.3125},
	{0.6875,-0.5,-0.4375,0.75,-0.4875,-0.375},
	{0.75,-0.5,-0.5625,0.8125,-0.4875,-0.4375},
	{0.6875,-0.5,-0.625,0.75,-0.4875,-0.5625},
	{0.625,-0.5,-0.6875,0.6875,-0.4875,-0.625},
	{0.5625,-0.5,-0.75,0.625,-0.4875,-0.6875},
	{0.4375,-0.5,-0.8125,0.5625,-0.4875,-0.75},
	{0.375,-0.5,-0.75,0.4375,-0.4875,-0.6875},
	{0.3125,-0.5,-0.6875,0.375,-0.4875,-0.625},
	{0.25,-0.5,-0.625,0.3125,-0.4875,-0.5625},
	{0.1875,-0.5,-0.5625,0.25,-0.4875,-0.4375},
	{0.25,-0.5,-0.4375,0.3125,-0.4875,-0.375},
	{0.3125,-0.5,-0.375,0.375,-0.4875,-0.3125},
	{0.375,-0.5,-0.3125,0.4375,-0.4875,-0.25}}}
})

minetest.register_node("runes:0bk", {
	description = "0 black",
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	inventory_image = "0black.png",
	tiles = {{name = "0bk_1x20.png",
		animation = {type = "vertical_frames",
		length = 2.0665}}, "blue_fray.png"},
	light_source = 5,
	groups = {cracky=3},
	drop = "runes:0bk",
	node_box={type="fixed",fixed={
{-0.0625,-0.5,0.25, 0.0625,-0.4875,0.3125},
{0.0625,-0.5,0.1875, 0.125,-0.4875,0.25},
{0.125,-0.5,0.125, 0.1875,-0.4875,0.1875},
{0.1875,-0.5,0.0625, 0.25,-0.4875,0.125},
{0.25,-0.5,-0.0625, 0.3125,-0.4875,0.0625},
{0.1875,-0.5,-0.125, 0.25,-0.4875,-0.0625},
{0.125,-0.5,-0.1875, 0.1875,-0.4875,-0.125},
{0.0625,-0.5,-0.25, 0.125,-0.4875,-0.1875},
{-0.0625,-0.5,-0.3125, 0.0625,-0.4875,-0.25},
{-0.125,-0.5,-0.25, -0.0625,-0.4875,-0.1875},
{-0.1875,-0.5,-0.1875, -0.125,-0.4875,-0.125},
{-0.25,-0.5,-0.125, -0.1875,-0.4875,-0.0625},
{-0.3125,-0.5,-0.0625, -0.25,-0.4875,0.0625},
{-0.25,-0.5,0.0625, -0.1875,-0.4875,0.125},
{-0.1875,-0.5,0.125, -0.125,-0.4875,0.1875},
{-0.125,-0.5,0.1875, -0.0625,-0.4875,0.25}}},
	collision_box={type="fixed",fixed={
{-0.0625,-0.5,0.25, 0.0625,-0.4875,0.3125},
{0.0625,-0.5,0.1875, 0.125,-0.4875,0.25},
{0.125,-0.5,0.125, 0.1875,-0.4875,0.1875},
{0.1875,-0.5,0.0625, 0.25,-0.4875,0.125},
{0.25,-0.5,-0.0625, 0.3125,-0.4875,0.0625},
{0.1875,-0.5,-0.125, 0.25,-0.4875,-0.0625},
{0.125,-0.5,-0.1875, 0.1875,-0.4875,-0.125},
{0.0625,-0.5,-0.25, 0.125,-0.4875,-0.1875},
{-0.0625,-0.5,-0.3125, 0.0625,-0.4875,-0.25},
{-0.125,-0.5,-0.25, -0.0625,-0.4875,-0.1875},
{-0.1875,-0.5,-0.1875, -0.125,-0.4875,-0.125},
{-0.25,-0.5,-0.125, -0.1875,-0.4875,-0.0625},
{-0.3125,-0.5,-0.0625, -0.25,-0.4875,0.0625},
{-0.25,-0.5,0.0625, -0.1875,-0.4875,0.125},
{-0.1875,-0.5,0.125, -0.125,-0.4875,0.1875},
{-0.125,-0.5,0.1875, -0.0625,-0.4875,0.25}}}
})

minetest.register_node("runes:sl1", {
	description = "Lit Bit 1",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_1.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl2", {
	description = "Lit Bit 2",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_2.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl3", {
	description = "Lit Bit 3",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_3.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj"
})

minetest.register_node("runes:sl4", {
	description = "Lit Bit 4",
	paramtype = "light",
	light_source = 0.9,
	paramtype2 = "facedir",
	tiles = {{name="rgbo_4.png", animation = {type = "vertical_frames", length=8.0}}},
	groups = {cracky=1, oddly_breakable_by_hand=1,not_in_creative_inventory=1},
	drop = "stones:s_2216",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,0.0625,  0,-0.4375,0.5},
{-0.5,-0.4375,0.125, 0,-0.375,0.5},
{-0.5,-0.375,0.1875, 0,-0.3125,0.5},
{-0.5,-0.3125,0.25, 0,-0.25,0.5},
{-0.5,-0.25,0.3125, 0,-0.1875,0.5},
{-0.5,-0.1875,0.375, 0,-0.125,0.5},
{-0.5,-0.125,0.4375, 0,-0.0625,0.5}}},
	drawtype = "mesh",
	mesh = "sli.obj",
	on_rightclick = function(pos, node, clicker, pointed_thing)
	local paramap01 = {
	[0]=13, [1]=10, [2]=19, [3]=4, [4]=14, [5]=2, [6]=18, [7]=22, [8]=12,
	[9]=20, [10]=16, [11]=0, [12]=21, [13]=11, [14]=3, [15]=7, [16]=1, 
	[17]=9, [18]=23, [19]=5, [20]=17, [21]=8, [22]=15, [23]=6
	}
	minetest.set_node(pos, {name = "tool:board_2216", param2 = paramap01[node.param2]})
	end
})



minetest.register_node("runes:zendor", {
	description = "Zendor Crystal",
	paramtype = "light",
	light_source = 5,
	paramtype2 = "facedir",
	tiles = {{name="zend64.png", animation = {type = "vertical_frames", length=1.0}}},
	inventory_image = "zdcrunes.png",
	use_texture_alpha = "clip",
	groups = {cracky=1, oddly_breakable_by_hand=0,not_in_creative_inventory=1},
	drop = "runes:zendor",
	selection_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,-0.25,0.5}}},
	collision_box = {type="fixed",fixed={
{-0.5,-0.5,-0.5, 0.5,-0.25,0.5}}},
	drawtype = "mesh",
	mesh = "zendor.obj"
})

minetest.register_node("runes:boxbe", {
	description = "Box Be",
	paramtype = "light",
	light_source = 5,
	paramtype2 = "facedir",
	tiles = {{name="box8x480.png", animation = {type = "vertical_frames", length=6.0}}},
	inventory_image = "bluo8x8.png",
	use_texture_alpha = "clip",
	groups = {cracky=3, oddly_breakable_by_hand=0,not_in_creative_inventory=1},
	drop = "runes:boxbe",
	selection_box = {type="fixed",fixed={
{-0.4142,-0.4142,-0.4142, 0.4142,0.4142,0.4142}}},
	collision_box = {type="fixed",fixed={
{-0.4142,-0.4142,-0.4142, 0.4142,0.4142,0.4142}}},
	drawtype = "mesh",
	mesh = "boxbe.obj"
})

minetest.register_node("runes:defr",{
	description = "Deputy Frog",
	inventory_image = "defr.png",
	drawtype = "mesh",
    mesh = "defr.obj",
	visual_scale = 0.5,
	tiles = {"rock.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = 'runes:rubble 2',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.25, -0.5, -0.15, 0.25, 1.1, 0.22}}},
    collision_box = {type = "fixed", fixed = {
{-0.25, -0.5, -0.15, 0.25, 1.1, 0.22}}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "j001_green", pos)
        return itemstack
    end
})

minetest.register_node("runes:hudi",{
	description = "Mister Hudi",
	inventory_image = "hudi.png",
	drawtype = "mesh",
    mesh = "hudi.obj",
	visual_scale = 0.5,
	tiles = {"rock.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = 'runes:hudi',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {{-0.3, -0.5, -0.13, 0.3, -0.24, 0.15}, 
{-0.12,-0.24,-0.13, 0.1,0.16,0}}},
    collision_box = {type = "fixed", fixed = {{-0.3, -0.5, -0.13, 0.3, -0.24, 0.15}, 
{-0.1,-0.24,-0.13, 0.1,0.16,0}}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "j001_blue", pos)
        return itemstack
    end
})

minetest.register_node("runes:wiz",{
	description = "Poleman Wizero",
	inventory_image = "wiz.png",
	drawtype = "mesh",
	mesh = "wiz.obj",
	visual_scale = 0.5,
	tiles = {"rock.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky=1, not_in_creative_inventory=1},
	drop = 'runes:wiz',
	light_source = 0.5,
	use_texture_alpha = "clip",
	selection_box = {type = "fixed", fixed = {
{-0.36, -0.5, -0.4, 0.4, -0.37, 0.36},
{-0.15,-0.37,-0.15, 0.15,1.15,0.15},
{-0.1,1.15,-0.12, 0.1,1.41,0.08},
{-0.18,1.41,-0.22, 0.18,1.44,0.12},
{-0.03,1.44,-0.09, 0.03,1.7,-0.01},
{-0.03,-0.37,-0.33, 0.03,1.07,-0.28},
{-0.04,1.07,-0.34, 0.04,1.13,-0.27}}},
    collision_box = {type = "fixed", fixed = {
{-0.36, -0.5, -0.4, 0.4, -0.37, 0.36},
{-0.15,-0.37,-0.15, 0.15,1.15,0.15},
{-0.1,1.15,-0.12, 0.1,1.41,0.08},
{-0.18,1.41,-0.22, 0.18,1.44,0.12},
{-0.03,1.44,-0.09, 0.03,1.7,-0.01},
{-0.03,-0.37,-0.33, 0.03,1.07,-0.28},
{-0.04,1.07,-0.34, 0.04,1.13,-0.27}}},
    on_rightclick = function(pos, node, clicker, itemstack, pointed_thing)
        echo.start(clicker, "j001_red", pos)
        return itemstack
    end
})







