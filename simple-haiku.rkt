#lang haiku-enum

(starters
 (adjective #:comma second-adjective))

(rule first-adjective adjective ->
      #:not-last #:comma second-adjective
      #:not-last noun)

(rule second-adjective adjective ->
      #:not-last noun)

(rule noun ->
      verb)

(rule verb ->
       #:not-last combiner)

(rule combiner ->
      #:not-last first-adjective)

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
@combiner[1]{while and before after}
