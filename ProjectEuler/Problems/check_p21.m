clc;clear all;close all



amicable = 0;

tic

for i = 2:9999

    divisor = 1;

    for ii = 2:sqrt(i)

       if mod(i,ii) == 0 

           divisor = divisor + ii +(i/ii);

       end

    end

    if i==divisor || i==1

        divisor = 0;

    end

    divisors = 1;

    for j = 2:sqrt(divisor)

        if mod(divisor,j) == 0

            divisors = divisors + j +(divisor/j);

        end

    end

    if i == divisors

        amicable = amicable + divisor;

    end

end

