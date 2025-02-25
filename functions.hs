
quicksort [ ] = [ ]
quicksort [ x ] = [ x ]
quicksort ( p : xs ) =
 quicksort [ x | x <- xs , x < p ] ++ p : quicksort [ x | x <- xs , x >= p ]

quicksort2 [] = []
quicksort2 [ x ] = [ x ]
quicksort2 ( p : xs ) = quicksort2 smaller ++ p : quicksort2 bigger
 where
 smaller = filter (\x -> x < p ) xs
 bigger = filter (\x -> x >= p ) xs

 
thrice f x = f ( f ( f x ))
thrice2 f = \x -> f ( f ( f x ))
thrice3 f = f . f . f

ntimes 0 _ = id
ntimes n f
 |n < 0 = error " negative number not allowed"
 | otherwise = \x -> ntimes (n -1) f ( f x )
-- oder : ntimes (n -1) f . f


pyth n = [( a ,b , c ) | a <- [1.. n ] , b <- [ a +1.. n ] ,
 let sqSum = a^2 + b^2 , sqSum <= n *n ,
 let c = floor ( sqrt ( fromIntegral sqSum )) , c * c == sqSum ]

pyth n = [( a ,b , c ) | a <- [1.. n ] , b <- [ a +1.. n ] , c <- [ b +1.. n ] ,a^2+ b^2 == c^2]

squareto n = map(\x->x*x)[0..n]

squareto n = [ m * m | m <-[0.. floor ( sqrt ( fromIntegral n ))]]

squareto n = [ m | m <-[0.. n ] , r <-[0.. n ] , m == r * r ]


tabelle n =[ [ x * y
 | x <-[1.. n ] ]
 | y <-[1.. n ] ]


verdoppelt [] =[]
verdoppelt ns=map verd ns
 where
verd n= 2*n

verdoppelt1 [] = []
verdoppelt1 ( x : xs ) = x * 2 : verdoppelt1 xs

verdoppelt2 xl = [ x *2 | x <- xl ]

verdoppelt3 = map (*2)


absSumTo n
 | n == 0 = 0
 | n < 0 = absSumTo ( - n )
 | n > 0 = n + absSumTo (1 - n )

sub x 0 = x
sub x y = (sub x (y - 1)) -1


countLower2 = sum . map charToNum
 where
charToNum c
 | isLower c = 1
 | otherwise = 0

countLower1 [] = 0
countLower1 ( c : cs ) = ( if isLower c then 1 else 0) + countLower1 cs

countLower[]=0
countLower (c:cs)
  |isLower c=1+countLower cs
  |otherwise=countLower cs

showRevs4 = map ( reverse . show )

showRevs3 = map (\x -> reverse ( show x ))


showRevs2 xs = map showRev xs
 where
showRev x = reverse ( show x )

showRevs [] = []
showRevs ( x : xs ) = reverse ( show x ) : showRevs xs

gcdList [] = 0
gcdList [ x ] = x
gcdList ( x : xs ) = gcd x ( gcdList xs )

numDiv1 _ 0 = error "Division by 0"
numDiv1 0 _ = 0
numDiv1 x y
  | r /= 0 = 0
  | otherwise = 1 + ( numDiv1 d y )
  where
    (d , r ) = divMod x y

numDiv _ 0 = error "Division by 0"
numDiv 0 _ = 0
numDiv x y | x `mod` y /= 0 = 0
          | otherwise = 1 + ( numDiv ( x `div` y ) y )

mult 0 _=0
mult _ 0=0
mult x y | x<0=error "x pos."
         | y<0=error "y pos."
         |y==1=x
         |otherwise =x+(mult x (y-1))
          

fibM n
  |n<0=error "n not neg."
  |otherwise=fst(fibmem n(0,1))
  where
    fibmem::Int->(Integer,Integer)->(Integer,Integer)
    fibmem k (x,y)=
      if k==0 then(x,y)
      else fibmem(k-1)(y,x+y)
      
fib 0=0
fib 1=1
fib n
  |n<0=error "n not neg."
  |otherwise=fib(n-1)+fib(n-2)
  

sumEvenSquare::Int->Int
sumEvenSquare 0=0
sumEvenSquare n |n<0=error "n not neg."
                |(n^2) `mod` 2==0=n^2+(sumEvenSquare(n-1))
                |otherwise = sumEvenSquare(n-1)

countTo 0 = [0]
countTo n = n : countTo( n - signum n )

countTo 0 = [0]
countTo n | n > 0 = n : countTo (n -1)
          | n < 0 = n : countTo ( n +1)

countTo 0 = [0]
countTo n = n : if n > 0 then countTo (n-1)
else countTo (n+1)

maxWert :: Int -> Int -> Int;
maxWert x y = if x > y then x else y;

sortierePaar :: (Int, Int) -> (Int, Int);
sortierePaar (x, y) = waehle (y == groesser) (y, x) (x, y)
  where groesser = maxWert x y

waehle :: Bool -> a -> a -> a;
waehle True a b = b;
waehle False a b = a;

istNull :: Integer -> Bool;
istNull 0 = True;
istNull anderes = False;

quicksort :: Ord a => [a] -> [a];
quicksort [] = [];
quicksort (x:xs) = 
  let { (lesser, greater) = partition (<= x) xs; } 
  in { quicksort lesser ++ [x] ++ quicksort greater; };

addInts :: [Int] -> Int;
addInts = foldl (+) 0;

average :: [ Int ] -> Double;
average xs = fromIntegral (addInts xs) / fromIntegral (length xs);

optimalX :: Double -> Double -> Double -> Double;
optimalX a b c = 
  if a == 0 then error "a must not be 0 per definition!" 
  else -b / (2 * a);

polynomVal :: Double -> Double -> Double -> Double -> Double;
polynomVal a b c x = a * x^2 + b*x + c;

optimalF :: Double -> Double -> Double -> Double;
optimalF a b c = polynomVal a b c (optimalX a b c);
