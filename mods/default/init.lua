default = {}

-- The hand
minetest.register_item(":", {
	type = "none",
	wield_image = "wieldhand.png",
	wield_scale = {x=1,y=1,z=2.5},
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level = 0,
		groupcaps = {
			cracky = {times={[1]=10, [2]=5, [3]=0.3}, uses=0, maxlevel=1},
			fleshy = {times={[2]=2.00, [3]=1.00}, uses=0, maxlevel=1},
			crumbly = {times={[2]=3.00, [3]=0.70}, uses=0, maxlevel=1},
			snappy = {times={[1]=10,[2]=5,[3]=0.40}, uses=0, maxlevel=1},
			oddly_breakable_by_hand = {times={[0]=30,[1]=7.00,[2]=4.00,[3]=0.10}, uses=0, maxlevel=3},
		},
		damage_groups = {fleshy=1},
	}
})

-- Global environment step function
function on_step(dtime)
	-- print("on_step")
end
minetest.register_globalstep(on_step)

function on_placenode(p, node)
	--print("on_placenode")
end
minetest.register_on_placenode(on_placenode)

function on_dignode(p, node)
	--print("on_dignode")
end
minetest.register_on_dignode(on_dignode)

function on_punchnode(p, node)
end
minetest.register_on_punchnode(on_punchnode)

voidtime_messages = {"Am I boring you? Getting to eat what you want is a vision of the creators that has not been buried, nor will ever be. We understand if you try to use a more heated effort to extract new flavors for one and all to enjoy, yet be safe, and not sorry that you're food had to be picked for you by more experienced miners. Here is a list of some things to avoid. Webbed satchel-flaps, Writing rye, Quoth keystones and their green mosses, Winkleberry, and Primesh. Avoid those.", 
"Render yesterday a new seamless twin end- Rain easy and Root wend.",
"Once I fled the scene, I left a low level wooden tool at the dirt show I was playing in. Hunted, sunkissed skins all on my decieving and tardy trail. Wag not your head or tail as though a font as noble as this could not have had such underpinnings. Does he pronounce death as eerily as his unseen ghosts do? Now I will show you how to use a Mortar and Pestle. Try to flick seeds into it. Reel the wheel to the prepared or cleared slot and get ready. I am used to bushels being handed early in but for the currier of newcomers favours it seems daft to presume your bread has any ingredients at all, now I see no reason to think otherwise. Even out the scene, where are the freshest greenest places to heal those huger wounds?",
"Get wood then from a log, and seeds from a patch of grass, and expect to wait. When that is done, take the bushel that you will turn to bread using the Mortar and Pestle, and even now you may be thinking, does this evil device serve another purpose? It does indeed have a capacity to, shall we say, greet you with malice when you need bread, and just to be safe, you packed nothing else. Ready? Good. Put four in. Use the Pestle on it. You can also mix rye, wheat, oat and barley to make the Bracken of the Bog, which is all over called brown, for those darker times, for the colour, and for your soul, but I won't recommend it here. Use just one type instead. Get shaking and baking!",
"Even thoough it is compulsory to eat, some don't. Whereas until now none in the kingdom would deny its invaluable space in our culture, we don't really absolutely need to eat, it's true. You can't see it, but you'll slowly start to dissappear, thinner and thinner until you're thin as a plank... Remind yourself and be a part of common decency, and stay visible, eat bread, and use tools.",
"Eating does not make a king.",
"Where are you going, Mr Oyrost? -I am planning to combine two important pieces of information. One is the original, and another is a combination of an old copy with a new one, which will remain as is but the resulting amalgamation will replace the original. -Are you going to be free to throw ball? -My, no. I will have to repeatedly combine the two pieces I'm left with, such that the one which has fewer sources is replaced each time. -Come play ball, Mr Oyrost!",
"To give up my dream is to rake in a day, And feed my candlelit seance. Won't you fold in your joan of arc? I do not remember why or how.",
"I know often you say bells are great for the village, Samlive, but frog's wit and tell infests their ringing. Croak croak croak.",
"We won every war, let's congee soup forever. We will right our every headshake under the weather. Kindly massage away those hideous gum disorders, and come to bed to sleep like a fighter.",
"Ask Spakle, d'littlest show. Sands gone tundra, panther got fog, kerbs rotting like ants wedded neath.",
"Long ago, there was a tree which gave fruit of electric blue, which if left outdoors in winter, would harden and could be used to slowly mold a rare curtain exterior which could combine with others to form a new tree. This is now long forgotten and all people do is prop up what's left of the tree with cracked magma sheaves.",
"Often three corners are not enough. If you can believe it, a fourth can be sought in isolation from the others, and reconnected to fulfill the purpose of completing a square. Still, many times I have landed myself with three only, and sometimes two and one. Be prepared to drop these extras if a complete square is beyond your scope, but do so with further combination in mind.",
"Can you be the holy?",
"Each grunt ended a vision a time and a half to add to the next, as three continued over the dark patch that wasn't meant to be. It had to be remembered every which way, wringing the straggling hunks of earth for minutes to extract clues. It was refreshing when they heard a whistle acres off the track, and hounds protecting a fox emerged. Pills in a box won't give you that. Keenly a stale bread was fished out and broken for them and they were in more of a hurry than the party of curious pan-spearers that called themselves Rockmeat and Grassdew.",
"Emiliano Zaphtra the painter argued that his garden grew nothing in the shade of the new black tower, but let's not blame the tower, for it was also in the shade of the great storehouse and the house of Tomás the warrior. Tomás knew that cocoa beans would grow on a dead jungle log even in the shade if it was hot enough but was not always there to resow. Some days he would simply dissappear en route to a convenience in Pragdice Magee, to see Knud Jeppeson or to visit the Mazuric Institute, and return empty-handed in the night without a word of it...",
"...Then a visit by Martin, who had had his house blown in half in an accident, would visit with his tamed wolf and bolster Emeliano with his news on forest-keeping. On one such day Emeliano had been losing himself in blackening a spider's legs on a large canvas. -News, Emiliano. said Martin, Tower's range has increased threefold. We are going to see if we can get in and manage it. -It isn't range they're after, but stealth. said Emiliano, Range reduces stealth. Tea?...",
"...Tomas, who was preparing a lunch of wheaten cookies tapped his kitchen window, alerting the pair in the garden that he too would have tea. -I'll see what is safe to eat in my kitchen, said Emiliano, laying down a brush that was a long twig with a dandelion tip, but take off that headgear won't you? -After tea we are climbing this tower. Tomas found a rotting loaf and broke it. -You'll see what's in it. Knud climbed the Mazuric and spied in. He has just gone to milk his cows but when he returns, we are going to scale your roof from my balcony, and there's an entryway to one of its legs up there. -Cool. Emiliano nodded that he was game on the gamble.",
"It complaining takes his time makes way for the street mainly. Do exams get paid, rest on nobody's. Pressure to slam the rain. We could knock out a few salesmen's talents and shave the quicksoups in the nights to grow quicksands, were we now and again around and about.",
"Quitting ettiquette, unless it's useless, is about those you leave behind. Can you save them? Then you find out, years later, of course you can, because they push you in again. Do they clamber upon your dreary slag to rubber out the titular flag?",
"The man with too much sideburns, is he a werewolf? Is the lady who cackles a witch? Are little people digging tunnels while we sleep? Look at yourself, what do you do?",
"But how can we have a binary tree if we don't have binary seeds? Recalling the soak of seeds that floated or sank, those that sank stayed in and those that floated covered the surface in groups that made little islands of vegetation. The dust, crosshairs, and even the gratings were also binary in some way. So what is up with the binary tree? Energy crawls down them, ticks pin along their stems, their roots grow thick with other roots, and it's the miming man's den.",
"Why the hell Can't they keep Thistles and burnbush Off the sheep?",
"Do right when Say to men Please accept Whatever's left",
"Under the deep are bones of fish. Then let's dive and take them up to make magic doors! Like everybody knows, the door to heaven or hell is two-sided, but to limbo is one torn away. No-one thought of a one-way door in Ice Country.",
"Doubt and dismissal, on prestige. Holding station, losing and lying. Were you right to ask `Is this real?`, Just because you are melting.",
"Unhealthy. Won the mean things over. I have a mindtest and IT is open. How great is the liar who hurts, Taking questions from a worm?",
"Who guards a place of rest, That can stay alert for weary folk, Who breaks laws to stop and ask,`Can I rest here?`- better keep going.",
"To get the black rock and not get lost, Underground reliables are red and blue. What is there to be saved in the crust, Of vertiginous extractions? Nothing new.",
"Heroes are free to wander, but the city needs a surveillance mechanic, some nobody who's cheap, ready to take the reins and pick through thousands of hours of tape...",
"If Tinny Jangle's Desert becometh ice, sand to snow and a palace for vice, you could make a wee hovel for your pressure plated whizzdom. If you haven't made your dreams all apparent why not list 'em? Opening up a case for talent in a museum of light, with dedications to yon Escher, and the halls of mice. While in the interstellar domains there hardened floating concretes, walled in glasses, plant filling gasses pill mill to the brim, where at level with the outside, insects face the permascreen, and the eyes of the machines of science reflect manifold within...",
"...Floating thus so many crystals beg the void that is its capsule, not to sunder to the black holes the intended solemn spaces, though the greed and gratitude of those dark hubs hold our attention, that a dragon might burst forth from any walls we dare to mention, is it not the greatest welcome from a gravitas so punk, to return almost nothing of the light that twisted sunk in the bowels of the great beast we know not that always drunk, and hurls a light we cannot see that does a dream we cannot be to enhance the splendid monotones of mass specular gunk. Full foray and festive shading, flying instruments are wading through the digital dramatics of a quasar's soul slamdunk...",
"...In repentance of the situations that a humanoid encounters is a kind of moving target that the ministers won't market, for its depth of introspections, rented will, and intersections with bulbosities and globular monstrosities' convections. Time has took a tailor off the cuff and put a sailor in the torrent's keep that insignates a whorling mental paladin. 'Ere flounders in its founders all aghast and bearing whim, the curesome curries and the worries of the he when it was him.",
"day 211, 22:7  The catmen creep and rush the tiling together of Tinny Jangle...",
"day 223, 12:38  Did the kingdom's sheriff notice when the grandfather clock stopped? He was there to witness it's installation, when five workers were paid a hefty wage to retrieve it from the abandoned sun-cage over the grey fields and bring. But forty weeks later it was counting so little that the courtiers had lost sleep and finally the queen said shove it to it and it was made a better piece of furniture there and then.",
"day 223, 16:14  Don't fear the spiders, though they are in four corners above you and live in three lines about them, and have all the crack you don't, you don't fear them the way they do as you don't see them do you?",
"day 223, 22:26  Silver sand is in high demand up there",
"day 224, 9:47  Ya need a team down here. Get what you need. Helps everyone lift.",
"day 224, 23:28  As I recall this world is infested with dragons down below somewhere. Out shot an angry clod of yellow, and caused me to reduce my ration of enlivening bread.",
"day 226, 6:1  Skill in the dark, there could be spiders but I hear none.",
"day 227, 0:0  A simple job is a good idea sometimes.",
"day 227, 17:36  Did I do the right thing? Did I do it OK? Do I have a time and a place to see my face when I do it that way?",
"day 231, 17:7  I think there must be many hows before a why.",
"day 282, 15:28  The wooden pick cannot remove the misplaced sandstone half block over the new prison cell, I understand my last working stone tools are elsewhere and this strikes me as an ironic befuddlement. The wall of stone which would separate the inside from the outside already complete, it is the decoration which arrests my attention. It will be like this so.",
"day 289, 0:33  Tonight I was reminded that it is unwholesome to break connection with the other worlds, so I wonder if I can stay my curiosity to bed a total mistake fled.",
"day 289, 22:57  Thinking of taking my horrible poetry down with me on a search for treasure, I met the living yellow once more, scaring all life to my fingertips. I clambered out, missing that special diagonal jump in my haste. Is it a self-aware mese? Does it contain other things within it? It seems now to own the cave until perhaps I find my mese crystal which woulzd give me... what I need.",
"day 308, 5:27  New arrivals have been busy. Getting shallow stones to repair southern aspect.",
"day 313, 14:38  They have been sent away and their intrusive storehouse regathered.",
"day 316, 23:15  today is an unlucky day for travelling or even hunting down missing blocks because the moon is greyer than my money minded mask and I have no intention to eat.",
"day 324, 2:1  Two meetings.",
"day 324, 3:4  Coal is short.",
"day 326, 0:18  Old calendar has another 120 gone by but this book says otherwise.",
"day 330, 19:8  These are the hands that made the bread.",
"day 333, 15:33  If I was Top, I'd make another Top. You could be another Top of the World.",
"day 337, 17:31  They brew rice in tombs so why die?",
"day 338, 18:5  It is a staple of our villages that we can not change, but change is much desired, badly so in the underneath world, that we will peck our fields slim to survive with their indulgences. It is not a now that we should seat ourselves in forever.",
"day 367, 21:50  An older tale is of a cutter's take and a putter's make.",
"day 370, 8:12  Five eons have passed.",
"day 370, 21:58  Attempting to slither back into this residual garnishing of hoists and handlebar hums of virtue marred by the dark phd fellow at the very entryway.",
"day 371, 1:50  I've no idea but to keep it lit. I leave it less rich, and draw out that figure. Yet passage is blocked both ways. Only an alternate to meet the first path could I find to attreact such prodigious attacher or relatcher of gated top-bottom yet pivotal relations.",
"day 373, 13:34  In this world where go dying victories, for which histories do your days matter?",
"day 374, 11:12  It has to be of great importance.",
"day 386, 19:55  I'm pretty much done with this path. Just throwing down the last bit so I can look at it.",
"day 389, 0:41  Suddenly I'm arrested and have to spend a night in the prison. 'Could you explain how little Gurdsenble is going to exercise in her wheelchair about the villages with so many crooked holes either side of the white brick way to trip into?' I am to ponder this and have a solution in the morning.",
"day 389, 6:28  'I will move her to the greenhills where she can mosy cosy.' I declared shiftily.",
"day 392, 13:21  Those holes are gonna get bigger if I don't do something.",
"day 401, 2:26  What of the mind of a despotic king could send a horde of cat-men and Bowling bison over our very peaceful kingdom? Is it our meagre stores of fruit, or the potential enslavement of our industries? Am I losing touch with my revolting contacts over the danger windswept calcified outlands? Yes. I surely am...",
"day 401, cont. ...As it were, we have no means of relaying safely our discoveries other than the portal, which I recall has had better years, and I will recount that in due time. Mind you, for all it's worth, Little is known even by myself of these contacts for which I struggle deeply to even bring to mind...",
"day 401, cont. ...For there is much to learn about this place and we must all be busy or occupied with invention to outlie as minutae regulated spirits under a titular hand that is wringing our souls eerily day by day. Remember there are the three great things and the two lesser things that no hand can throw our way without unsettling all that one can hope to deposit as resource or right and these are set ... funny I don't remember. I shall use colors to represent them anyway and perhaps I shall meet them as events unfold...",
"day 401, cont. ...I have no intention of breaking kingdom rule, so I shall consider any such influence as a minor threat to local sanity, but a major discovery in the realm of invention. On the other hand, one need not concern oneself with these ugly unseen headaches which I would rather grab and bend to my own will, so it is as matter ordains and not as smarts can contain, the peeling of senses from memory...",
"day 401, cont. ...When did I ever touch that number three all at once? Could I even count myself among them? Out with it, see! A travel to the death it might not suit the kingdom, but in that case I shall leave my hopes at the edge, as they might. Weed and warcraft may not enter the kingdom from the great beyond for all it costs their kingdoms, through waterstorm, firewall, airplosion, and earthball to come knocking for a silent king and his egoless servants? Impossible.",
"day 403, 13:52  Lucky the cool cat gave a pointer.",
"day 412, 18:1  All items stored in the new drawers have dissappeared. It's well nothing but a few tin blocks and sundries are missing.",
"day 413, 6:40  I pointed at the stars all night. Now what do I have to do to get these corals to grow under the paths?",
"day 413, 18:27  Learned recipies",
"day 414, 18:0  A most spine-tingling growth- an anthill- has blossomed over what was once a lovely safe looking area.",
"day 414, 19:15  Evacuating, I open the front door against their grotesque multi-textured wall.",
"day 429, 6:1  Do not disturb the marshes.",
"day 433, 15:19  Coal should be considered scarce, but to motivate mining, torches will be in unlimited supply.",
"day 456, 6:36  Where's the bark?",
"day 456, 9:44  I know it's in a small room, with a chest and unremarkable door, and not north of the tower.",
"day 458, 8:30  Water wets the dirt, and them boards were used up.",
"day 465, 3:30  Improving item mobility leaves open empty chests.",
"day 475, 21:0  A chill in my spine as I wonder where these singular errant bones arose after seeing to the fields.",
"day 481, 17:17  Now that mithril has arrived steel shall be divided.",
"day 482, 4:22  How quickly can you create beauty?",
"day 487, 8:10  I'm so dense I_forgot I was carrying the bags.",
"day 506, 5:35  I screamed when the dark phd wandered up out of my quested and questworthy chambers, leading to a new doorway for our situation, which had frightened me, was such as to require a partition of sorts.",
"day 523, 1:12  She wants you to control your destiny, do you have what it takes? The Bront sisters, the marvellous Ripwailers, and Easy Torie are next for the gold take.",
"day 556, 16:58  Oh my little spider friends, where have you been?",
"day 628, 17:52  Discovered Watoga.",
"day 628, 21:17  There are about a dozen buildings. A cat-man keeps it. We held cups together. This memory is fleeting and fading like the light.",
"day 725, 8:52  When they follow, we split the caves.",
"day 749, 12:49  Bring the horse to the tower of bones, and the blue berry tree might grow.",
"day 854, 20:18  Great, another day and I've no rule for mobs, the dials can't be sold without trade with hunters, and outside is getting cold.",
"day 868, 16:3  I see a baker in myself when the dun-tungue bearing my brass stick trundles a new card- to achieve, that is, a title must be worn briefly, and seen clearly.",
"day 871, 13:45  Broke a screwdriver on the modern house.",
"day 887, 20:8  A fortnite in and about a full bag of cotton seeds down. Sure is nice outdoors this season."
}
-- Set a noticeable inventory formspec for players
minetest.register_on_joinplayer(function(player)
	local cb = function(player)
		minetest.chat_send_player(player:get_player_name(), voidtime_messages[math.random(1,98)])
		player:set_attribute("test_attribute", "test_me")
		player:set_attribute("remove_this", nil)
	end
	minetest.after(2.0, cb, player)
end)

