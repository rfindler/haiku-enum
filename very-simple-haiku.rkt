#lang haiku-enum

(starters
 (adjective noun))

(rule noun ->
      verb)

(rule verb ->
      #:comma adjective)

(rule adjective ->
      noun)

@adjective[1]{black fierce gray plump wet}
@adjective[2]{achy agile dormant mangy sober wrinkled}
@noun[1]{ant owl stag wasp}
@noun[2]{duckling panda songbird swordfish}
@verb[1]{aches barks claws climbs roves snarls weeps}
@verb[2]{awaits beckons gallops gambols slobbers}
