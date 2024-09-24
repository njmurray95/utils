program playground
        implicit none
        integer::array(-5:5)
        array(:) = 0
        array(-4) = 1
        array(4) = 1
        print *, array
        ! prints
        ! 0 1 0 0 0 0 0 0 0 1 0
end program playground
