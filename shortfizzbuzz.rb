(1..100).each{|n|;s='Fizz' if n%3==0;s=s.to_s+'Buzz' if n%5==0;puts !s ? n : s}