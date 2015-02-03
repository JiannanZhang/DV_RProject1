c = 0
for (i in 1:10){
   x <- sample(c(0,0,1,1,1,1),3)
   if (all(x == c(0,1,1))) || all(x == c(1,0,1)) || all(x == c(1,1,0))) {
     c <- c + 1
   }
} 

c