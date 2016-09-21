program fiver
    use defs
    use init
    implicit none
    integer :: i

    call initAll()

    do i = 1, BOARD_SQ_NUM
        if (modulo(i-1,10) == 0) then
            write(*,*)
        endif
        write(*,"(I5)",advance="no") Sq120ToSq64(i)
    enddo
    write(*,*)
    do i = 1, 64
        if (modulo(i-1,8) == 0) then
            write(*,*)
        endif
        write(*,"(I5)",advance="no") Sq64ToSq120(i)
    enddo
    write(*,*)
end program fiver
