program fiver
    use defs
    use init
    use assertion
    implicit none
    integer :: i
    integer :: num = 2
    integer :: nuts = 4

    call initAll()

    do i = 1, BOARD_SQ_NUM
        if (modulo(i-1,10) == 0) then
            write(*,*)
        endif
        write(*,"(1X,I3)",advance="no") Sq120ToSq64(i)
    enddo
    write(*,*)
    do i = 1, 64
        if (modulo(i-1,8) == 0) then
            write(*,*)
        endif
        write(*,"(1X,I3)",advance="no") Sq64ToSq120(i)
    enddo
    write(*,*)
    call assert(num == nuts)
end program fiver
