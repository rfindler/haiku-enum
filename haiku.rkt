#lang haiku-enum

(starters
 (plural-noun plural-verb)
 (singular-noun singular-verb)
 (adjective adjective2)
 (adjective plural-noun)
 (adjective singular-noun)
 (gerund adverb)
 (gerund plural-noun)
 (gerund singular-noun)
 (adverb adjective1)
 (adverb #:comma plural-noun)
 (adverb #:comma singular-noun)
 (adverb gerund))

(rule singular-noun ->
      singular-verb
      gerund)

(rule plural-noun ->
      plural-verb
      gerund)

(rule adjective1 adjective ->
      adjective2
      plural-noun
      singular-noun)

(rule adjective2 adjective ->
      plural-noun
      singular-noun)

(rule plural-verb ->
      adverb
      #:not-last #:comma plural-noun
      #:not-last #:comma singular-noun
      #:comma adjective1
      #:comma gerund)

(rule singular-verb ->
      adverb
      #:not-last #:comma plural-noun
      #:not-last #:comma singular-noun
      #:comma adjective1
      #:comma gerund)
   
(rule adverb ->
      #:comma adverb
      #:not-last #:comma plural-noun
      #:not-last #:comma singular-noun
      #:comma adjective1
      #:comma gerund
      #:only-last plural-verb
      #:only-last singular-verb)

(rule gerund ->
      #:comma adverb
      plural-noun
      singular-noun
      adjective1
      #:comma gerund
      #:only-last plural-verb
      #:only-last singular-verb)

(rule preposition ->
      adjective1
      singular-noun
      plural-noun)

@plural-noun[1]{
 ants apes bats bears bees birds boats boughs breasts brides broods brutes
 bugs bulls canes casks cats chasms chimes choirs claws clocks clouds clowns
 cooks cows crags crows cubs does dogs dolls doors doubts doves drops drums
 ducks dunes dwarfs ears eels eggs elks elms elves ewes eyes fears fiends
 fires firs fish fists flames fleas flutes fools friends fruits geese gems
 ghosts ghouls girls gnats gnomes goats graves hags hairs hands harps hawks
 heads hearts hives hogs jugs knives lakes lambs lamps leaves lights
 lips lives masks men mice mists mobs monks moons moose moths mules nymphs
 oafs oaks owls pains palms pearls pears pigs pikes pines ploughs
 plows plums ponds prey priests prunes queens rats rogues sharks sheep ships
 smiles snails snakes snows souls sounds spears stags stars stones streams
 suns swine teeth thieves trees waifs wasps wives yews
}

@plural-noun[2]{
 acorns actors addicts angels answers apples arrows aspens babies barflies
 barmen baskets basswoods beeches beehives beggars Belas birch_trees
 birches blizzards bluebirds boatmen bobtails bodies bottles boulders
 bridegrooms bridesmaids buckets Buddhas bulldogs burdens burglars canoes
 captives carvings caskets catfish cavemen cedars cellos cesspools chaplains
 cherries chestnuts children chipmunks churchyards cinders cocoons corals
 cowbells cowboys cowgirls cradles demons devils dishrags dockyards dogwoods
 dolphins donkeys dragons droplets drunkards ducklings eagles earthworms
 echoes echos eggshells eunuchs fables falcons farmers feathers females
 fingers firewood firstborns fishbones fishhooks flowers foghorns foundlings
 fountains frostbites gazelles geldings ginkgos giraffes glaciers goatherds
 gravestones graveyards groundhogs guitars gypsies harpies harvests
 hatchets hawthornes haystacks hermits herons horseflies horsemen horses hostages
 hunchbacks images inmates insects insults islands jackals jackknifes
 jaguars jailers kingdoms kittens landlords lemons lepers lindens lions
 liquids lizards lovers madmen maidens maples martyrs meadows merchants
 mermaids misers monkeys moonbeams moonlights mountains mustangs nectars
 nightmares oceans olives onions orchards orchids orphans owners oysters
 pandas papers parrots partridges passions paupers peaches peasants pebbles petals
 phantoms pheasants pigeons piglets pirates planets plowboys plowmen
 plowshares poets ponies poplars princes puddles pumas pumpkins puppies
 pygmies quicksands rabbits raccoons racehorses rainfalls rainstorms
 ravens razors red_pines redheads redwoods riders ripples rivers rubies
 sailboats sailfish sailors salmons satyrs scarecrows seagulls seamen
 seasons serpents shadows shagbarks shepherds shorebirds snowbirds snowdrifts
 snowmen snowstorms songbirds sorrows spiders spruces squirrels stallions
 swordfish swordsmen tailors toadstools towers vipers virgins vixens
 walnuts waters willows women
}

@plural-noun[3]{
 abattoirs afterlives agonies alchemists amputees apple_trees apprentices
 bartenders bell-ringers bicycles black_cherries bordellos borderlands
 box_elders bricklayers bulldozers bumblebees burials cabdrivers carnivores
 carousels castaways catacombs catalpas catapults cathedrals chambermaids
 chimeras chimpanzees conjurers cranberries deceptions depressions
 derelicts destines dinosaurs Douglas_firs dragonflies dry_summers
 elephants enemies energies English_oaks eruptions excretions families
 ferryboats fishermen gatekeepers gigolos grains_of_sand harpsichords
 hyenas icicles idiots illusions immortals infernos janitors junipers
 koalas ladybugs lemon_peels leprechauns lily_pads masquerades melodies
 memories miseries mockingbirds mountaintops orchestras overcoats parasites
 passengers patriarchs phantasms pianists pianos piranhas polar_bears
 poltergeists potatoes rainmakers raspberries reflections refugees
 rice_paddies riverbeds samurais saxophones scavengers sorcerers spittlebugs
 starflowers strawberries white_cedars wintertimes
}

@plural-noun[4]{
 abandonments adolescents adventurers albatrosses alligators anacondas
 apologists apparitions azaleas barbarians barracudas brutalities carpetbaggers
 caterpillars celebrations cemeteries chameleons conspirators deliverymen
 desolations diamondcutters exaltations exclamations expectations
 fisherwomen fluidities hostilities hullaballoos imprisonments incantations
 incarnations infinities necromancers palpitations panoramas pomegranates
 ragamuffins resurrections revelations rhinoceri ruminations thundershowers
 watermelons
}

@singular-noun[1]{
 ant ape ash bat beach bear bee beech birch bird blood boat bough branch breeze
 bride brute bull cane cask cat chasm child chime choir claw clay clock cloud
 clown cook cow crag crow cub dirt doe dog doll door doubt dove drum duck dune
 dwarf ear earth eel egg elf elk elm ewe eye face fear fiend filth fir fire fish
 fist flame flea flesh flute fool fox friend frost fruit gem ghost ghoul girl
 gnat gnome goat goose grass grave hag hair hand harp hawk head heart hive
 hog horse ice ink jug juice knife lake lamb lamp lash lass leaf leech life
 light lip man mask mint mist mob monk moon moose moth mouse mule nymph oaf
 oak orange owl pain palm peach pear pearl perch pig pike plough plow plum
 pond prey priest prince prune quail queen rat rogue shark sheep ship smile
 smoke snail snake snow soul sound spear spruce stag star stone stream sun
 thief tree waif wasp wife yew
}

@singular-noun[2]{
 abyss acorn actor addict angel answer apple arrow aspen baby barfly barman
 basket basswood beehive beggar Bela birch_tree bleakness blizzard bluebird
 boatman bobtail body bottle boulder bridegroom bridesmaid bucket Buddha
 bulldog burden burglar canoe captive carving casket catfish caveman cedar
 cello cesspool chaplain cherry chestnut childhood chipmunk churchyard
 cinder circus cocoon coral cowbell cowboy cowgirl cradle demon dervish
 devil dishrag dockyard dogwood dolphin donkey dragon droplet drunkard
 duckling eagle earthworm echo eggshell eunuch fable falcon farmer feather
 female finger firewood firstborn fishbone fishhook flower foghorn foundling
 fountain frostbite gazelle gelding ginkgo giraffe glacier goatherd gravestone
 graveyard groundhog guitar gypsy harpy harvest hatchet hawthorne haystack
 hermit heron honey horsefly horseman hostage hunchback image inmate insect
 insult island jackal jackknife jaguar jailer kingdom kitten landlord
 laughter lemon leper linden lion liquid lizard lover madman maiden maple
 martyr meadow merchant mermaid miser monkey moonbeam moonlight mountain
 mustang nectar nightmare ocean olive onion orchard orchid orphan owner
 oyster panda paper parrot partridge passion pauper peasant pebble petal
 phantom pheasant pigeon piglet pirate planet plowboy plowman plowshare
 poet pony poplar priestess princess puddle puma pumpkin puppy pygmy quicksand
 rabbit raccoon racehorse rainfall rainstorm raven razor red_pine redhead
 redwood rider ripple river ruby sailboat sailfish sailor salmon satyr
 scarecrow seagull seaman seamstress serpent shadow shagbark shepherd
 shorebird snowbird snowdrift snowman snowstorm songbird sorrow spider
 springtime squirrel stallion sweet_gum swordfish swordsman toadstool
 tower viper virgin vixen waitress walnut water willow woman
}

@singular-noun[3]{
 abattoir Adonis afterlife agony albatross alchemist alcohol amputee
 apple_tree apprentice bartender bell-ringer bicycle black_cherry bordello
 borderland boundlessness box_elder bricklayer bulldozer bumblebee
 burial cabdriver carnivore carousel castaway catacomb catalpa catapult
 cathedral chambermaid chimera chimpanzee chrysalis colossus conjurers
 corruption cranberry deception demoness depression derelict despondence
 destiny dinosaur Douglas_fir dragonfly enemy energy English_oak eruption
 excretion family ferryboat fisherman gatekeeper gigolo grain_of_sand
 harpsichord horseradish hyena icicle idiot illusion immortal inferno
 janitor juniper koala ladybug lemon_peel leprechaun masquerade melody
 memory mockingbird mountaintop orchestra overcoat parasite passenger
 patriarch pianist piano piranha polar_bear poltergeist potato rainmaker
 raspberry reflection refugee riverbed rosemary samurai saxophone scavenger
 solitude sorcerer spittlebug starflower strawberry the_autumn white_cedars
 wintertime
}

@singular-noun[4]{
 abandonment adolescent adventurer alligator anaconda apologist azalea
 barbarian barracuda brutality carpetbagger caterpillar celebration
 cemetery chameleon coliseum conspirator deliveryman desolation diamondcutter
 evolution exaltation exclamation expectation fisherwoman fluidity
 hostility hullaballoo imprisonment incantation incarnation infinity
 necromancer palpitation panorama pomegranate ragamuffin resurrection
 rhinoceros rumination thundershower watermelon
}

@adjective[1]{
 barbed black bland bleak blind blithe blue blunt bold brave bright broad
 bronze brown burnt calm charred chaste cheap clean clear cold cool coy cruel
 dark dazed dead deaf deep dense dim dire dirty dour drab dried drunk dry dumb
 fat fierce firm first flat foul frail free fresh glum gnarled gold gray great
 green grim gruff hard hoarse hooked hot huge kind lame last late lazy lean
 lewd lithe loose lost loud low lush mad mean meek mild moist nude numb odd
 old orange pale pink plain plump plush poor prim proud pure quick rapt raw
 red rich ripe rough rude sad sharp short shrewd shrill shy sick sleek slick
 slow sly small smooth smug snide snow soaked soft some sore sour stale stare
 still sting strut swift tall tame vain vast vile warm weak wet white wide
}

@adjective[2]{
 abject ablaze abrupt absurd aching achy acid addled aghast agile ailing
 airy alert aloof amused ancient ardent arid ashen austere awestruck awkward
 baggy barren bawdy bemused benign bestial bewitched blameless blazing
 bleary bloated bloodshot blushing brambly bravely breathless breezy
 brilliant broken brutal brutish bubbly bumbling bungling buried careless
 careworn cautious ceruse charcoal charming cheeky childless chubby clammy
 cockeyed comely contrite copper corrupt crafty craven crazy creaky creamy
 crooked cunning dazzling deadly deathless depraved dismal dismayed distressed
 disturbed dizzy docile doleful dormant downward dreary eager early earnest
 earthbound earthy eery empty endless enraged entranced epic erect evil
 extinct faceless fading fearful fearless fearsome feeble feisty fertile
 fervent fiendish filthy final fitful flabby flaccid flawless fleeting
 fleshy flustered foamy foggy foolish forlorn formless frantic frightened
 frisky frosty frothing frothy frozen furry gaping gaudy gentle ghostly
 giddy gleeful gloomy glowing golden gory grassy grateful greedy grimy
 grotesque grouchy grubby gruesome gutless haggard hairy hapless happy
 hardened harried haughty hazy helpless hopeful hopeless hostile humble
 humid icy idle ignored impish inept inert inky intense iron jagged jangly
 jealous joyful joyless knobbly languid lanky leafy legless lifeless listless
 lively livid loathsome lofty loveless lovely lowly loyal lucid lurid lustful
 lustrous magic mangled mangy manic massive mature meager mealy meaty mellow
 merry messy mighty mirthful mirthless misty modest moldy monstrous moody
 morbid mottled mournful muddy murky muscled musky naive naked nameless
 narrow nasty naughty nervous newborn noble noisy obscene open ornate painful
 painless passive patient peaceful pensive piercing pious placid plaintive
 pleasant plodding polished pompous prickly profane pulpy pungent purple
 putrid queasy quiet rabid ragged rainy rancid rapid raucous reckless regal
 relaxed rigid ruddy rueful rugged rusty sallow salty saucy savage scornful
 scraggly scrawny scruffy serene sexless shabby shackled shady shapeless
 sheepish shining sightless silent silky silver simple sleepless sleepy
 slender smoky snowy sober solemn sordid spellbound squalid squeaky stagnant
 starlit startled sun-drenched sunny timid toothless toothy ugly unborn
 unchained unfed unheard unkempt unseen wrinkled yellow
}

@adjective[3]{
 abandoned abrasive abundant adoring alarming alluring amorous amusing
 anarchic angelic angriest arthritic asinine barbaric blistering boisterous
 bottomless breathtaking burgeoning capricious castrated cavernous
 celestial celibate chaotic cherrylike chimeric chocolate civilized
 clangorous clearheaded cold-hearted colorblind colossal conceited
 contagious copious coquettish corrosive crestfallen cumbersome cynical
 decadent deceitful deceptive decrepit defeated defiant dejected delighted
 delightful demented demonic derisive desolate desperate despondent
 destitute determined devilish devious discolored disheveled dishonest
 disjointed disturbing dubious dumbfounded dumbfounding eccentric echoing
 embarrassed enfeebled enormous enraptured eternal excited exhausted
 exhausting expectant exultant fainthearted fatherless fatherly ferocious
 fiery flowering forbidden forgotten frightening frivolous frostbitten
 frustrated halfhearted hardfisted hardhearted harrowing heroic hideous
 hypnotic immoral impassive impatient impotent imprisoned impulsive
 indiscreet indolent infamous infantile infectious ingenious inhumane
 insipid insistent insolent inspiring intimate intricate jittery jovial
 kindhearted kittenish laconic languishing laughable lethargic lopsided
 luminous malicious malignant maternal melodic menacing merciless metallic
 mischievous miserly misshapen motherly nightmarish odious offensive
 open-mouthed opulent overgrown passionate passionless perilous petulant
 pitiful pitiless polluted ponderous potbellied powerless protective
 quarrelsome querulous quiescent rancorous rapacious rapturous ravenous
 regretful relentless repulsive resplendent rheumatic riderless riotous
 rubbery seductive shimmering sinewy somnolent sorrowful sweltering
 tedious unabashed unaided unblinking unbroken unclouded unfettered
 unhappy unshackled venomous villainous virginal
}

@adjective[4]{
 admirable adorable adventuresome adventurous alabaster apprehensive
 bewildering brokenhearted cantankerous carnivorous cataclysmic catastrophic
 catatonic charismatic charitable chimerical claustrophobic compassionate
 deferential delirious desirable despicable detestable disillusioned
 dispassionate effervescent emaciated emasculated energetic enviable
 ephemeral essentially ethereal exceptional fantastical fatalistic
 forgettable formidable free-spirited gargantuan gelatinous gratifying
 harmonious hermetical homicidal horrifying humiliating hysterical
 idiotic illusory immovable impalpable impeccable impermanent impersonal
 impertinent impervious impetuous implacable implausible impossible
 impoverished impregnable improbable inadvertent inanimate incandescent
 incapable incognizant incomparable incongruent inconsequent incredulous
 indifferent industrious ingenuous inglorious inhibited innocuous innumerable
 inseparable insidious intangible invincible inviolable invisible irascible
 iridescent irreverent irritable irritating laborious lugubrious luminescent
 luxurious magnificent malodorous maniacal mellifluous melodious memorable
 mesmerizing methodical meticulous microscopic miraculous miserable
 monolithic monumental nauseating nonsensical oblivious overeager overzealous
 parasitic penetrable pleasurable pyramidal regrettable resurrected
 ridiculous unbelieving undefeated unfamiliar unforgiving universal
 venerable vulnerable
}

@plural-verb[1]{
 ache acts ail bark bend blare blaze bleat bleed bloat bloom blow blur blush
 boast boil bolt break build burn call catch chirp choke chomp chop clank
 clash claw climb crash crawl cry doze drawl dream drift drink drip drown
 eat ebb end fade fall fight flail flee flirt float flop flow fly freeze fret
 frown fry fume gape gawk gleam glide gnaw graze grieve grin grind groan grope
 grunt hatch haunt hide hiss howl hum ill jab jump kill kiss laugh leap leer
 lick limp look loom lurk melt meow moan mope mourn move muse oink ooze pass
 pause paw peck peek peep pinch play plead plod plop pluck plunge pop pose
 pray preach prowl pull punch purr quack quake rage rain rant ride ring roam
 roar roll romp rove run rush rust sag sail scold scowl scratch scream screech
 seal search see seek seep set shake shine shriek sing sink sleep slide slip
 slump slurp smash smear smile smirk snarl sneer sneeze snooze snore soar
 sob speak spin spit splash spray spring squeak squeal squelch squirm stamp
 stroke swirl swoon wail wait weep yearn
}

@plural-verb[2]{
 adorn ascend await babble beckon bemoan beseech blossom brighten bury
 capture castrate cavort chastise chortle chuckle clamber clamor conspire
 dabble darken dazzle deafen decay descend despair destroy distend distort
 drizzle dwindle embark embrace erupt escape evolve exalt exclaim excrete
 expire explode explore extrude exult fester fizzle follow forget frolic
 fumble gallop gambol giggle give_birth glisten glitter glower grimace
 harden hasten hobble hover ignite implore jangle jingle jitter juggle
 labor languish linger listen marvel mimic mumble murmur mutter panic partake
 patter ponder potter pulsate quarrel quibble quiver ramble rattle rebloom
 recede recur redden reflect regret rejoice relax repel reply reproach
 resist ripen ruffle rumble sadden saunter savor scamper scramble scurry
 seduce shatter shiver shrivel sicken sidle slither slobber slumber smatter
 snicker snigger snuggle soften splatter stagger stampede stumble swagger
 tumble waddle waken wander wither wobble wonder
}

@plural-verb[3]{
 abandon acquiesce copulate defecate deflower deliver detonate diminish
 disappear disappoint discover disperse emerge encircle fornicate hesitate
 hibernate hypnotize imagine meander mystify overeat palpitate procreate
 putrefy reappear recollect recover replenish repulse resonate rhapsodize
 ricochet ruminate somersault submerge supplicate surface uncover unshackle
 vanish
}

@plural-verb[4]{
 accelerate cannibalize disintegrate exhilarate hallucinate illuminate
 inseminate intensify intoxicate luxuriate reanimate reawaken reconsider
 recuperate regenerate regurgitate rejuvenate retaliate reverberate
}

@singular-verb[1]{
 aches acts ails barks bends blares blazes bleats bleeds bloats blooms blows
 blurs boasts boils bolts breaks breathes builds burns calls chirps chokes
 chomps chops clanks claws climbs coughs crawls cries dozes drawls dreams
 drifts drinks drips drowns eats ebbs ends fades falls fights flails flees
 flies flirts floats flops flows freezes frets fries frowns fumes gapes
 gawks gleams glides gnaws grazes grieves grinds grins groans gropes grunts
 haunts hides howls hums ills jabs jumps kills laughs leaps leers licks limps
 looks looms lurks melts meows moans mopes mourns moves muses oinks oozes
 pauses paws pecks peeks peeps plays pleads plods plops plucks plunges pops
 poses prays prowls pulls purrs quacks quakes rages rains rants rides rings
 roams roars rolls romps roves runs rusts sags sails scolds scowls screams
 seals seeks seeps sees sets shakes shines shrieks sings sinks sleeps slides
 slips slumps slurps smears smiles smirks snarls sneers sneezes snoozes
 snores soars sobs speaks spins spits sprays springs squeaks squeals squirms
 stamps strokes swirls swoons wails waits weeps yearns
}

@singular-verb[2]{
 adorns ascends awaits babbles beckons bemoans brightens buries captures
 castrates cavorts chases chastises chortles chuckles clamors conspires
 crashes dabbles darkens dazzles deafens decays descends despairs destroys
 distends distorts drizzles dwindles eases embarks erupts escapes evolves
 exalts exclaims excretes expires explodes explores exults festers fizzles
 forgets frolics fumbles gallops gambols giggles gives_birth glistens
 glitters glowers grimaces hardens hastens hobbles hovers ignites implores
 jangles jingles jitters juggles kisses labors lingers listens marvels
 mimics mumbles murmurs mutters nudges panics partakes patters ponders
 potters pulsates quarrels quibbles quivers races rambles rattles reblooms
 recedes recurs reddens reflects regrets rejoices repels replies resists
 ripens rises ruffles rumbles saddens saunters savors scampers scrambles
 scurries seduces shatters shivers shrivels sickens sidles slithers slobbers
 slumbers smatters snickers sniffles sniggers snuggles softens splatters
 staggers stampedes stumbles swaggers tumbles waddles wakens wanders
 whimpers withers wobbles wonders
}

@singular-verb[3]{
 abandons accuses beseeches copulates defecates deflowers delivers detonates
 disappears disappoints discovers disperses emerges encircles fornicates
 hesitates hibernates imagines meander meanders mystifies overeats palpitates
 procreates putrefies reappears recollects recovers repulses resonates
 ricochets ruminates somersaults submerges surfaces uncovers unshackles
 vanishes
}

@singular-verb[4]{
 accelerates acquiesces admonishes agonizes brutalizes cannibalizes
 decomposes diminishes exhilarates extinguishes fantasizes hallucinates
 illuminates inseminates intensifies intoxicates luxuriates realizes
 recognizes reconsiders regurgitates rejuvenates reverberates
}

@adverb[2]{
 archly blankly bleakly blindly blithely bluntly brightly brusquely cheaply
 coldly coolly coyly cruelly darkly deafly dimly dryly dumbly faintly feebly
 fiercely flatly gaily gently gladly glumly grayly grimly harshly hoarsely
 hotly hugely humbly idly keenly kindly lamely lewdly lightly limply loudly
 madly meekly mildly moistly neatly numbly proudly quickly redly richly
 roughly rudely sadly sharply slowly slyly snidely softly sourly strongly
 tartly warmly weakly wetly
}

@adverb[3]{
 abjectly abstractly acidly agedly agelessly agilely alertly aloofly
 angrily ardently awkwardly bafflingly barrenly bashfully benignly blearily
 blissfully blushingly bookishly bouncily boundlessly brazenly breathlessly
 breezily brokenly broodingly brutishly bulkily bumblingly bunglingly
 buoyantly carefully carelessly carpingly cautiously ceaselessly changelessly
 charmingly cheerfully cheerlessly childishly chillingly chirpily chokingly
 churlishly clammily cloudily cloudlessly clownishly cloyingly clumsily
 cockily contritely craftily crankily crazily creakily crustily cunningly
 daintily daringly dazedly dazzlingly demurely dizzily doggedly drearily
 drunkenly eagerly earnestly earthily easily edgily eerily endlessly
 evilly fearfully fearlessly fervently fiendishly fitfully flabbily
 foggily foolishly forcefully forlornly formlessly foxily frantically
 frigidly frostily frothily fruitlessly fumblingly garishly giddily
 girlishly gleefully gloomily gracefully gracelessly graciously gratefully
 greedily groggily grotesquely grouchily grubbily grudgingly gruesomely
 grumpily happily hastily hatefully haughtily hauntingly hawkishly hazily
 heartily heartlessly helplessly hopefully hopelessly hungrily icily
 impishly inanely ineptly intensely intently inwardly jaggedly jarringly
 jauntily jealously joyfully joylessly juicily knowingly languidly laughably
 lazily leerily leeringly listlessly longingly lucidly luridly lustfully
 lustily lustrously meagerly mellowly merrily messily mightily mirthfully
 mirthlessly mockingly modestly monstrously moodily morbidly mournfully
 mutedly mystically nakedly nastily nervelessly nervously noiselessly
 noisily numbingly oafishly obscenely opaquely owlishly painfully painlessly
 patiently peacefully pensively piercingly piously pleasantly pleasingly
 prettily prudently pulpily pungently quietly raggedly rapidly raucously
 recklessly rigidly ruefully rustily saucily scornfully shakily sheepishly
 silently sleepily sleeplessly sluggishly thirstily tiredly vividly
 wastefully wistfully
}

@adverb[4]{
 admirably adorably adoringly agreeably alarmingly alluringly amazedly
 amorously amusedly amusingly appallingly approvingly arduously ashamedly
 attractively audaciously becomingly beseechingly bewilderedly blisteringly
 bloodthirstily blusteringly boisterously bounteously breathtakingly
 capriciously caressingly cavernously chaotically cherubically chivalrously
 clamorously coldheartedly combatively comfortably comfortingly confusedly
 contagiously contentedly coquettishly corrosively curiously cynically
 dangerously deadeningly deafeningly decadently deceitfully deceptively
 defiantly dejectedly delightedly delightfully dementedly depravedly
 depressingly derisively desolately despairingly despicably despondently
 devilishly deviously dishonestly disjointedly dispairingly disturbingly
 dolorously eccentrically effortlessly enticingly enviably eternally
 evasively excitingly expectantly exultantly facetiously faintheartedly
 ferociously forbiddingly forebodingly forgivingly frighteningly frivolously
 frustratingly halfheartedly haphazardly hazardously heartrendingly
 heroically hesitantly hideously honorably horrifically hotheadedly
 humorously hypnotically hysterically immortally immovably impalpably
 impassively impatiently impeccably imperfectly implacably implausibly
 imploringly importantly imposingly impossibly impotently impressively
 improbably impudently impulsively inaudibly incessantly incurably
 indecently indignantly indiscreetly indolently indulgently inexpertly
 infamously infectiously infinitely infinity inhumanly innocently innumerably
 inscrutably insincerely insipidly insistently insolently inspiringly
 intangibly intimately intractably intricately intriguingly invincibly
 invisibly invitingly irritably jovially jubilantly kindheartedly languorously
 lethargically lopsidedly luminously maddeningly maliciously malignantly
 maternally melodically memorably menacingly mercifully mercilessly
 mischievously miserably motionlessly musically mystifying nostalgically
 obediently obsessively offensively ominously optimistic opulently
 passionately perilously petulantly pigheadedly pitifully pitilessly
 ponderously powerlessly promiscuous protectively querulously quiescently
 rancorously rapaciously rapturously ravenously regretfully regrettably
 relentlessly repentently resplendently rheumatically seductively
 shimmeringly sorrowfully swelteringly tediously unblinkingly unbrokenly
 unhappily villainously
}

@gerund[2]{
 bloating blowing blushing boasting bragging braying cackling chortling
 crying cursing dancing dreaming drifting flailing floating flying frowning
 fumbling fuming gangling giggling gloating grieving groaning grumbling
 gusting hissing hoping howling jabbing jeering jutting laughing leaning
 leering lying melting mewling moaning moping moving mumbling oozing pleading
 plopping praying preying prying pulling purring quailing quibbling raging
 raining rambling ranting rasping rattling riding ringing rippling rising
 roaming roaring romping rumbling rushing rusting sagging screaming screeching
 searching shaking shrieking singing sleeping sluggish smiling snapping
 sneering sneezing snoozing snoring snowing soaring sobbing squeaking
 squealing squelching squirming stinking strutting stumbling swirling
 thrusting tugging wailing wishing yearning
}

@gerund[3]{
 anguishing avenging battering beckoning beginning believing bemoaning
 blossoming blustering burrowing cajoling cavorting clamoring collapsing
 consuming darkening deafening decaying defying dispairing embracing
 emerging enduring erupting escaping exalting excreting exploring exulting
 fluttering following forgetting forgiving frolicking gibbering glimmering
 glistening glittering grimacing hardening harvesting hastening hobbling
 hovering imploring imposing jabbering laboring languishing lingering
 marveling mellowing moldering murmuring muttering nuzzling parroting
 pottering prattling pulsating quivering receding recurring reddening
 rejoicing replying retreating returning ripening scampering scavenging
 shivering shriveling shuddering slithering slobbering slumbering snickering
 sniggering snuggling sputtering staggering stampeding swaggering unknowing
 wakening wandering willowing wondering
}
