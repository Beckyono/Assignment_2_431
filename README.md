# Assignment_2_431
~CS431 Assignment 2 for Team 10; Brandon, Kevin, and Rebecca
~DUE ON: Tuesday October 22nd, 2024 at 12:00 midnight
~The purpose of this project is for you to show that you can write tail-recursive functions in OCaml,
   manipulate data structures in OCaml, understand B-reduction in lambda calculus, and write 
   elementary Haskell phrases.

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
Write OCaml code for the following:

 1. Write two versions, one non-tail-recursive and the other tail-recursive, of the following function.
    The function takes as arguments an element x (of any type) and a non-negative integer n, and 
    returns a list of n entries all identical to x. If the function is called with a negative n,
    an exception is thrown. (For example, replicate x 5;; would produce [x;x;x;x;x].)

 2. Write two versions, one non-tail-recursive and the other tail-recursive, of the following function.
    The function takes as argument a non-negative integer n, and returns the list of increasing 
    positive integers up to n (empty list if n is 0). If the function is called with a negative n,
    an exception is thrown. (For example, makeList 4;; would produce [1;2;3;4].)

 3. Write two versions, one non-tail-recursive and the other tail-recursive, of the following function.
    The function takes as argument a list, and returns the reversed list.
    For example, reverse [6;8;2;5];; would produce [5;2;8;6].

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
The next 3 questions below are about binary trees, given by the following variant type
 type 'a btree =
   Empty
   | Leaf of 'a
   | Node of ( 'a * 'a btree * 'a btree) ;;
 with a sample tree like
   let tst = Node( 5, Leaf 2, Node( 12, Node(8, Leaf 7, Leaf 10), Leaf 49 ) ) ;;

 4. Write a function that returns the number of leaves (nodes without any more children) in
    a binary tree.
 
 5. Write a function that returns a list of the nodes of a binary tree, in in-order traversal.
    (that is, left subtree – node – right subtree).
 
 6. Write a function that returns a list of the nodes of a binary tree, in pre-order traversal.
    (that is, node – left subtree – right subtree).

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
The next 4 questions are about -reduction in lambda calculus: 
  For each of the given  expressions, show the steps to produce the normal form, 
  if such normal form exists. That is, -reduce the expression, in any evaluation order, 
  using -renaming if necessary. If a normal form does not exist, say so.
  Of course, you have to pay attention to what is an abstraction (function), and what is an 
  application (what is applied to what). Pay attention to the parentheses that group expressions.
 
 7. ( t. u. u t t) (x. x) t

 8. (z. z z z) (y. y y)
    
 9. (x. x x) (x. y)
     
 10. ( z. z t ) ( z. (t. t z) (x. z x) ) 

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
The next 6 questions are about the Haskell programming language:

11. Write the Haskell type of a function that returns a list of integers when given an integer
    argument.

12. Write a Haskell function that produces the list of the divisors of a given positive integer.

13. Using your function of 12. above, write a Haskell function isPrime, from Int to Bool, that returns
    True exactly when the argument is a prime number.
    (Recall that n is prime exactly when its list of divisors is [1, n].)

14. Define the (infinite) list of prime numbers, using your isPrime function of 13. above.
    Note that this is not to be the way I defined the list of primes in my slides.

15. Show the 2000th prime number, using your list of 14. above.
  
17. A positive integer is called perfect if it is equal to the sum of all of its divisors, excluding itself. 
    For example, 6 and 28 are perfect, because 6 = 1+2+3 and 28 = 1+2+4+7+14.
    Using a list comprehension, define a Haskell function perfs from Int to [Int]
    that produces the list of all perfect numbers up to the given argument.
