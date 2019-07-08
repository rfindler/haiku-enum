#lang haiku

(starters
 (noun #:comma adjective1))

(rule adjective1 adjective ->
      adjective2
      noun)

(rule adjective2 adjective ->
      noun)

(rule noun ->
      verb)

(rule verb ->
      #:comma adjective1)

@adjective[1]{black fierce gray plump wet}
@adjective[2]{achy agile dormant mangy sober wrinkled}
@adjective[3]{arthritic boisterous determined lethargic riderless}
@adjective[4]{adorable ethereal illusory immovable mesmerizing vulnerable}
@noun[1]{ant owl stag wasp}
@noun[2]{duckling panda songbird swordfish}
@noun[3]{albatross koala ladybug}
@noun[4]{alligator anaconda rhinoceros}
@verb[1]{aches barks claws climbs roves snarls weeps}
@verb[2]{awaits beckons gallops gambols slithers slobbers whimpers}
@verb[3]{hesitates hibernates somersaults vanishes}
@verb[4]{agonizes brutalizes hallucinates reconsiders regurgitates}
