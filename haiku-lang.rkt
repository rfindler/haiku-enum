#lang racket
(require data/enumerate/lib
         racket/stxparam
         racket/splicing
         (for-syntax syntax/parse))

(define haiku-beats '(5 7 5))

(provide rule starters
         + - expt #%datum #%app * / round ceiling floor
         (rename-out [top-interaction #%top-interaction]
                     [module-begin #%module-begin]
                     [top #%top]))


;                                                                                       
;                                                                                       
;                                                                                       
;                                                                                       
;                                      ;;; ;;;               ;  ;;;                     
;                                          ;;;             ;;;                          
;    ;;;     ;;;   ;;; ;; ;;;  ;;; ;;  ;;; ;;;   ;;;;      ;;;; ;;; ;;; ;; ;;;    ;;;;  
;   ;;;;;   ;;;;;  ;;;;;;;;;;; ;;;;;;; ;;; ;;;  ;; ;;;     ;;;; ;;; ;;;;;;;;;;;  ;; ;;; 
;  ;;;  ;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;;     ;;;  ;;; ;;; ;;; ;;; ;;; ;;; 
;  ;;;     ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;;;;;;     ;;;  ;;; ;;; ;;; ;;; ;;;;;;; 
;  ;;;  ;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;; ;;;         ;;;  ;;; ;;; ;;; ;;; ;;;     
;   ;;;;;   ;;;;;  ;;; ;;; ;;; ;;;;;;; ;;; ;;;  ;;;;;;     ;;;; ;;; ;;; ;;; ;;;  ;;;;;; 
;    ;;;     ;;;   ;;; ;;; ;;; ;;; ;;  ;;; ;;;   ;;;;       ;;; ;;; ;;; ;;; ;;;   ;;;;  
;                              ;;;                                                      
;                              ;;;                                                      
;                                                                                       
;                                                                                       


(define-syntax (top stx)
  (syntax-parse stx
    [(x . y) #'(void)]))

(define-syntax (module-begin stx)
  (syntax-parse stx
    [(_ all-the-codez ...)
     (with-syntax ([structured-haiku/e-promise (datum->syntax stx 'structured-haiku/e-promise)]
                   [haiku/e-promise (datum->syntax stx 'haiku/e-promise)]
                   [structured-haiku/e (datum->syntax stx 'structured-haiku/e)]
                   [haiku/e (datum->syntax stx 'haiku/e)])
       #'(#%plain-module-begin
          (define words-map (make-hash))
          (define beats-map (make-hash))
          (splicing-syntax-parameterize ([words-map-id-param #'words-map]
                                         [beats-map-id-param #'beats-map])
            all-the-codez ...
            (finalize-words-map-and-beats-map beats-map words-map)
            (define structured-haiku/e (force structured-haiku/e-promise))
            (define haiku/e (force haiku/e-promise))
            (provide structured-haiku/e haiku/e))))]))

(define-syntax (top-interaction stx)
  (syntax-parse stx
    [(_ . n:expr)
     (with-syntax ([haiku/e (datum->syntax stx 'haiku/e stx)])
       #'(check-n haiku/e n))]
    [_ (raise-syntax-error 'haiku-lang.rkt
                           "please enter a natural number"
                           #'stx)]))

(define-syntax-parameter words-map-id-param #f)
(define-syntax-parameter beats-map-id-param #f)

(define-syntax (rule stx)
  (define-values (non-terminal-name emit alternatives)
    (syntax-parse stx
    #:datum-literals (->)
      [(_ non-terminal-name -> alternatives ...)
       (values #'non-terminal-name #f #'(alternatives ...))]
      [(_ non-terminal-name emit -> alternatives ...)
       (values #'non-terminal-name #'emit #'(alternatives ...))]))
  (with-syntax ([app #'#%app]
                [words-map-id (syntax-parameter-value #'words-map-id-param)]
                [beats-map-id (syntax-parameter-value #'beats-map-id-param)])
    #`(begin
        (define (add-words beats . words)
          (add-words/nt beats-map-id words-map-id '#,(or emit non-terminal-name) beats words))
        (define the-promise
          (delay (non-terminal '#,(or emit non-terminal-name)
                               (parse-alternatives . #,alternatives))))
        #,@(if (and emit (not (syntax-local-value emit (λ () #f))))
               (list #`(define-syntax (#,emit stx)
                         (syntax-parse stx
                           [x #:when (identifier? #'x) #'add-words]
                           [(x . y) #'(app add-words . y)])))
               (list))
        (define-syntax #,non-terminal-name
          (case-lambda
            [() #'the-promise]
            [(stx)
             (syntax-case stx ()
               [x (identifier? #'x) #'add-words]
               [(x . y) #'(app add-words . y)])])))))


;                                                        
;                                                        
;                                                        
;                                                        
;                             ;  ;;;                     
;                           ;;;                          
;  ;;; ;;;; ;;; ;;; ;;      ;;;; ;;; ;;; ;; ;;;    ;;;;  
;  ;;;;;;;; ;;; ;;;;;;;     ;;;; ;;; ;;;;;;;;;;;  ;; ;;; 
;  ;;;  ;;; ;;; ;;; ;;;     ;;;  ;;; ;;; ;;; ;;; ;;; ;;; 
;  ;;;  ;;; ;;; ;;; ;;;     ;;;  ;;; ;;; ;;; ;;; ;;;;;;; 
;  ;;;  ;;; ;;; ;;; ;;;     ;;;  ;;; ;;; ;;; ;;; ;;;     
;  ;;;  ;;;;;;; ;;; ;;;     ;;;; ;;; ;;; ;;; ;;;  ;;;;;; 
;  ;;;   ;; ;;; ;;; ;;;      ;;; ;;; ;;; ;;; ;;;   ;;;;  
;                                                        
;                                                        
;                                                        
;                                                        


(define (check-n haiku/e n)
  (unless (and (natural? n) (< n (enum-count haiku/e)))
    (error 'haiku-lang.rkt "please enter a natural number less than ~a"
           (enum-count haiku/e)))
  (display (from-nat haiku/e n)))

(struct alternative (not-allowed-if-last?
                     only-allowed-if-last?
                     comma?
                     non-terminal-name) #:transparent)

(define-struct non-terminal (emit alternatives) #:transparent)

(define/contract (name+beats->words-map-key name beats)
  (-> symbol? natural? any/c)
  (cons name beats))

(define (add-words/nt beats-map words-map name beats words)
  (define key (name+beats->words-map-key name beats))
  (hash-set! words-map key
             (set-union (hash-ref words-map key set)
                        (for*/set ([word-str (in-list words)]
                                   [word (in-list (regexp-split #rx" +" word-str))]
                                   #:unless (regexp-match #rx"^[ \n]*$" word))
                          (hash-set! beats-map name (set-add (hash-ref beats-map name set) beats))
                          word))))

(define (finalize-words-map-and-beats-map beats-map words-map)
  (for ([key (in-list (hash-keys beats-map))])
    (hash-set! beats-map key (sort (set->list (hash-ref beats-map key)) <)))
  (for ([key (in-list (hash-keys words-map))])
    (hash-set! words-map key
               (vec->enum (apply vector (set->list (hash-ref words-map key)))))))

(define-syntax (parse-alternatives stx)
  (syntax-parse stx
    [(_ #:not-last #:comma something more ...)
     #'(cons (alternative #t #f #t (get-promise something))
             (parse-alternatives more ...))]
    [(_ #:only-last something more ...)
     #'(cons (alternative #f #t #f (get-promise something))
             (parse-alternatives more ...))]
    [(_ #:only-last whatever ...)
     (raise-syntax-error 'alternative
                         "#:only-last misplaced"
                         (list-ref (syntax->list stx) 1))]
    [(_ #:not-last whatever ...)
     (raise-syntax-error 'alternative
                         "#:not-last misplaced"
                         (list-ref (syntax->list stx) 1))]
    [(_ #:comma something more ...)
     #'(cons (alternative #f #f #t (get-promise something))
             (parse-alternatives more ...))]
    [(_ something more ...)
     #'(cons (alternative #f #f #f (get-promise something))
             (parse-alternatives more ...))]
    [(_) #''()]))

(define-syntax (get-promise stx)
  (syntax-parse stx
    [(_ id)
     (define the-promise-identifier
       ((syntax-local-value
         #'id
         (λ ()
           (raise-syntax-error 'haiku-lang.rkt "unknown part of speech" #'id)))))
     #`(begin
         (λ () id) ;; for check syntax
         #,the-promise-identifier)]))

(define-syntax (starters stx)
  (syntax-parse stx
    [(starters (a ...) ...)
     (with-syntax ([structured-haiku/e-promise (datum->syntax stx 'structured-haiku/e-promise)]
                   [haiku/e-promise (datum->syntax stx 'haiku/e-promise)])
       #'(begin
           (define structured-haiku/e-promise (delay (or/e (starter a ...) ...)))
           (define haiku/e-promise
             (delay
               (pam/e structured-haiku-to-string #:contract string?
                      (force structured-haiku/e-promise))))))]))

(define-syntax (starter stx)
  (with-syntax ([beats-map-id (syntax-parameter-value #'beats-map-id-param)]
                [words-map-id (syntax-parameter-value #'words-map-id-param)])
    (define-values (word-category comma? non-terminal)
      (syntax-parse stx
        [(_ word-category #:comma non-terminal)
         (values #'word-category #t #'non-terminal)]
        [(_ word-category non-terminal)
         (values #'word-category #f #'non-terminal)]))
    #`(begin
        (void (λ () #,word-category))
        (starter/proc '#,word-category (get-promise #,non-terminal) '#,comma?
                      beats-map-id words-map-id))))

(define-syntax-rule
  (define/memo (f x ...) e1 e2 ...)
  (define f
    (let ([ht (make-hash)])
      (λ (x ...)
        (hash-ref! ht (list x ...) (λ () e1 e2 ...))))))

(define/memo (starter/proc to-emit non-terminal-promise comma? beats-map words-map)
  (cons/de
   [label+beats+word (label+beats+word-enum beats-map words-map to-emit)]
   [s (label+beats+word)
      (match-let ([(cons (cons label beats) word) label+beats+word])
        (define nt/e (nt->enum beats-map words-map
                               non-terminal-promise
                               (cons (- (car haiku-beats) beats)
                                     (cdr haiku-beats))
                               #f
                               #f))
        (cond
          [comma? (cons/e (fin/e ",") nt/e)]
          [else nt/e]))]
   #:dep-expression-finite? #t))

(define (label+beats+word-enum beats-map words-map to-emit)
  (cons/de
   [label+beats (cons/e (fin/e to-emit) (apply fin/e (hash-ref beats-map to-emit)))]
   [word (label+beats)
         (hash-ref words-map (name+beats->words-map-key to-emit (cdr label+beats)))]
   #:dep-expression-finite? #t))

(define/memo (nt->enum beats-map words-map
                       non-terminal-promise
                       beats-left
                       not-allowed-if-last?
                       only-allowed-if-last?)
  (define non-terminal (force non-terminal-promise))
  (define to-emit (non-terminal-emit non-terminal))
  (define alternatives (non-terminal-alternatives non-terminal))
  
  (cons/de
   [label+beats+word (label+beats+word-enum beats-map words-map to-emit)]
   [s (label+beats+word)
      (match-let ([(cons (cons label beats) word) label+beats+word])
        (define new-beats-left (cons (- (car beats-left) beats) (cdr beats-left)))
        (define last? (and (zero? (car new-beats-left)) (null? (cdr new-beats-left))))
        (cond
          [not-allowed-if-last?
           (if last?
               empty/e
               (alts->enum alternatives new-beats-left beats-map words-map))]
          [only-allowed-if-last?
           (if last?
               (alts->enum alternatives new-beats-left beats-map words-map)
               empty/e)]
          [else
           (alts->enum alternatives new-beats-left beats-map words-map)]))]
   #:dep-expression-finite? #t))

(define/memo (alts->enum alternatives beats-left beats-map words-map)
  (cond
    [(null? beats-left) (fin/e '())]
    [(< (car beats-left) 0) empty/e]
    [(= (car beats-left) 0)
     (cons/e (fin/e "\n") (alts->enum alternatives (cdr beats-left) beats-map words-map))]
    [else
     (apply or/e
            (for/list ([alternative (in-list alternatives)])
              (define next-enum
                (nt->enum
                 beats-map words-map
                 (alternative-non-terminal-name alternative)
                 beats-left
                 (alternative-not-allowed-if-last? alternative)
                 (alternative-only-allowed-if-last? alternative)))
              (cond
                [(alternative-comma? alternative) (cons/e (single/e ",") next-enum)]
                [else next-enum])))]))

(define (structured-haiku-to-string e)
  (regexp-replace*
   #rx"_"
   (apply string-append
          (let loop ([words (filter string? (flatten e))])
            (match words
              [(list word "\n" "," more ...)
               (list* word ",\n " (loop more))]
              [(list word "\n")
               (list word "\n")]
              [(list word "\n" more ...)
               (list* word "\n " (loop more))]
              [(list word "," more ...)
               (list* word ", " (loop more))]
              [(list "\n") (list "\n")]
              [(list word more ...)
               (list* word " " (loop more))]
              [(list) (list)])))
   " "))

(define (vec->enum v)
  (define to-index (make-hash))
  (for ([e (in-vector v)]
        [i (in-naturals)])
    (define old-i (hash-ref to-index e #f))
    (when old-i
      (error 'vec->enum "duplicate elements ~a and ~a are both ~s"
             old-i i e))
    (hash-set! to-index e i))

  (define (is-in-the-vector? x) (and (hash-ref to-index x #f) #t))
  
  (map/e (λ (i) (vector-ref v i))
         (λ (desired-e) (hash-ref to-index desired-e))
         #:contract is-in-the-vector?
         (below/e (vector-length v))))