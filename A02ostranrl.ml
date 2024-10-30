(*Author:   Rebecca Ostrander*)
(*Date:     10/29/24*)
(*Filename: A02ostranr.ml*)
(*Description: Assignment #2 for CS431, team 10, questions 1-6*)


(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*Problem 1     Solution*)
(*Non-Tail Recursive Solution*)
let rec replicate x n =
  match n with
  | n when n < 0 -> failwith "n must be a non-negative integer"
  | 0 -> []
  | _ -> x :: replicate x (n - 1)

(*Testing*)
let result1 = replicate "a" 5;;  (*returns: ["a"; "a"; "a"; "a"; "a"]*)
let result2 = replicate 42 3;;   (*returns: [42; 42; 42]*)
let result3 = replicate 'x' 0;;  (*returns: []*)
let result4 = replicate (-1) 5;; (*returns: [-1; -1; -1; -1; -1]*)
let result5 = 
  try
    let _ = replicate "5" (-5) in "No Error"
  with
  | Failure msg -> msg;;                  (*returns: "n must be a non-negative integer"*)


(*Tail Recursive Solution*)
let replicate x n =
  match n with
  | n when n < 0 -> failwith "n must be a non-negative integer"
  | _ ->
      let rec helper acc count =
        match count with
        | 0 -> acc
        | _ -> helper (acc @ [x]) (count - 1)
      in
      helper [] n

(*Testing*)
let result1 = replicate "a" 5;;  (*returns: ["a"; "a"; "a"; "a"; "a"]*)
let result2 = replicate 42 3;;   (*returns: [42; 42; 42]*)
let result3 = replicate 'x' 0;;  (*returns: []*)
let result4 = replicate (-1) 5;; (*returns: [-1; -1; -1; -1; -1]*)
let result5 = 
  try
    let _ = replicate "5" (-5) in "No Error"
  with
  | Failure msg -> msg;;              (*returns: "n must be a non-negative integer"*)


(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*Problem 2     Solution*)
(*Non-Tail Recursive Solution*)
let rec makeList n =
  match n with
  | _ when n < 0 -> failwith "n must be a non-negative integer"
  | 0 -> []
  | _ -> makeList (n - 1) @ [n]

(*Testing*)
let result1 = makeList 1;;   (*returns: [1]*)
let result2 = makeList 5;;   (*returns: [1; 2; 3; 4; 5]*)
let result3 = makeList 0;;   (*returns: []*)
let result4 = 
  try
    let _ = makeList (-5) in "No Error"
  with
  | Failure msg -> msg;;     (*returns: "n must be a non-negative integer"*)


(*Tail Recursive Solution*)
let makeList n =
  let rec helper curr count =
    match count with
    | count when count < 0 -> failwith "n must be a non-negative integer"
    | 0 -> curr
    | _ -> helper (count :: curr) (count - 1)
  in
  helper [] n


(*Testing*)
let result1 = makeList 1;;   (*returns: [1]*)
let result2 = makeList 5;;   (*returns: [1; 2; 3; 4; 5]*)
let result3 = makeList 0;;   (*returns: []*)
let result4 = 
  try
    let _ = makeList (-5) in "No Error"
  with
  | Failure msg -> msg;;     (*returns: "n must be a non-negative integer"*)


(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*Problem 3     Solution*)
(*Non-Tail Recursive Solution*)
let rec reverse lst =
  match lst with
  | [] -> []
  | h::t -> (reverse t) @ [h]

(*Testing*)
let result1 = reverse [];;                 (*returns: []*)
let result2 = reverse [1; 2; 3];;          (*returns: [3; 2; 1]*)
let result3 = reverse [0];;                (*returns: [0]*)
let result4 = reverse ['a'; 'b'; 'c'];;    (*returns: ['c'; 'b'; 'a']*)
let result5 = reverse ["hello"; "world"];; (*returns: ["world"; "hello"]*)


(*Tail Recursive Solution*)
let reverse list =
  let rec helper list curr =
    match list with
    | [] -> curr
    | h::t -> helper t (h::curr)
  in
  helper list []

(*Testing*)
let result1 = reverse [];;                 (*returns: []*)
let result2 = reverse [1; 2; 3];;          (*returns: [3; 2; 1]*)
let result3 = reverse [0];;                (*returns: [0]*)
let result4 = reverse ['a'; 'b'; 'c'];;    (*returns: ['c'; 'b'; 'a']*)
let result5 = reverse ["hello"; "world"];; (*returns: ["world"; "hello"]*)


(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
type 'a btree =
 Empty
 | Leaf of 'a
 | Node of ( 'a * 'a btree * 'a btree);;

let tst = Node( 5, Leaf 2, Node( 12, Node(8, Leaf 7, Leaf 10), Leaf 49 ));;
(*Problem 4     Solution*)
let rec count_leaves tree =
  match tree with
  | Empty -> 0
  | Leaf _ -> 1
  | Node (_, l, r) -> count_leaves l + count_leaves r;;

(*Testing*)
let result1 = count_leaves tst  (*returns: 4*)

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
type 'a btree =
 Empty
 | Leaf of 'a
 | Node of ( 'a * 'a btree * 'a btree);;

let tst = Node( 5, Leaf 2, Node( 12, Node(8, Leaf 7, Leaf 10), Leaf 49 ));;
(*Problem 5     Solution*)
let rec inorder tree =
  match tree with
  | Empty -> []
  | Leaf value -> [value]
  | Node (value, l, r) ->
      inorder l @ [value] @ inorder r

(*Testing*)
let result1 = inorder tst       (*returns: [2; 5; 7; 8; 10; 12; 49]*)

(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
(*~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~*)
type 'a btree =
 Empty
 | Leaf of 'a
 | Node of ( 'a * 'a btree * 'a btree);;

let tst = Node( 5, Leaf 2, Node( 12, Node(8, Leaf 7, Leaf 10), Leaf 49 ));;
(*Problem 6     Solution*)
let rec preorder tree =
  match tree with
  | Empty -> []
  | Leaf value -> [value]
  | Node (value, l, r) ->
      [value] @ preorder l @ preorder r

(*Testing*)
let result1 = preorder tst      (*returns: [5; 2; 12; 8; 7; 10; 49]*)
