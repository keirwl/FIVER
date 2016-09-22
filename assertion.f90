module assertion
    implicit none
    logical, parameter :: noassert = .false.
contains
    pure subroutine assert(cond)
        implicit none
        logical, intent(in) :: cond
        real, volatile :: r
        if (noassert) return
        r = 1.0
        if (.not. cond) r = r/0.0
    end subroutine assert
end module assertion
