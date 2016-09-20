program fiver
    use defs
    use init
    implicit none
    integer :: i

    call initAll()

    do i = 1, BOARD_SQ_NUM
        if (modulo(i,10) == 0) then
            write(*,*)
        endif
        write(*,"(I5)") Sq120ToSq64(i)
    enddo

    do i = 1, 64
        if (modulo(i,8) == 0) then
            write(*,*)
        endif
        write(*,"(I5)") Sq64ToSq120(i)
    enddo
end program fiver
