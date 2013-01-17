;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname contains) (read-case-sensitive #t) (teachpacks ()) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ())))
;Andrew Tran Ex 113, 114,115

;Ex 113

; List-of-names -> Boolean
; to determine whether "Flatt" occurs on a-list-of-names

(check-expect
 (contains-flatt? (cons "Mur" (cons "Fish" (cons "find" empty)))) false)
(check-expect
 (contains-flatt? (cons "A" (cons "Flatt" (cons "C" empty)))) true)

(define (contains-flatt? a-list-of-names)
  (cond
    [(empty? a-list-of-names) false]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) "Flatt")
         (contains-flatt? (rest a-list-of-names)))]))

(contains-flatt? (cons "Fagan"
      (cons "Findler"
            (cons "Fisler"
                  (cons "Flanagan"
                        (cons "Flatt"
                              (cons "Felleisen"
                                    (cons "Friedman" empty))))))))
; I Expect the answer to be true because "Flatt" is in the list.


;Ex 114
; It produces the same answers because they are doing the same thing except for the 
; fact that the new way does not have to eventually report back its result to the "or" when it 
; reports the final result. Thus, I think that the second way would be better because I think it 
; would take up less memory for large lists of names.


;Ex 115
; Name List-of-names -> Boolean
; to determine whether the given Name occurs in a-list-of-names
(check-expect
 (contains? "Andrew" (cons "Joey" (cons "Robert" (cons "Pearce" empty)))) false)
(check-expect
 (contains? "Andrew" (cons "Joey" (cons "Andrew" (cons "Pearce" empty)))) true)

(define (contains? name a-list-of-names)
  (cond
    [(empty? a-list-of-names) false]
    [(cons? a-list-of-names)
     (or (string=? (first a-list-of-names) name)
         (contains? name (rest a-list-of-names)))]))

