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