module bitboards
    use defs
    use init
    implicit none
contains
    subroutine printBitBoard(bb)
        implicit none
        logical, dimension(64), intent(in) :: bb
        integer :: rank, file, sq, sq64 = 1

        do rank = RANK_1, RANK_8
            do file = FILE_A, FILE_H
                sq = fr2sq(file, rank)
                sq64 = Sq120ToSq64(sq)
                if (bb(sq64)) then
                    write(*,"(1X,1A)",advance="no") "X"
                else
                    write(*,"(1X,1A)",advance="no") "-"
                endif
            enddo
            write(*,*)
        enddo
    end subroutine printBitBoard
end module bitboards