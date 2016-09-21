module init
    use defs
    implicit none
    integer, dimension(BOARD_SQ_NUM) :: Sq120ToSq64
    integer, dimension(64) :: Sq64ToSq120
    contains
        subroutine initSq120To64()
            integer :: file = FILE_A
            integer :: rank = RANK_1
            integer :: sq = A1
            integer :: sq64 = 1

            Sq120ToSq64(:) = 65
            Sq64ToSq120(:) = 120
                
            do rank = RANK_1, RANK_8
                do file = FILE_A, FILE_H
                    sq = (22+(file))+((rank)*10)
                    Sq64ToSq120(sq64) = sq
                    Sq120ToSq64(sq) = sq64
                    sq64 = sq64 + 1
                enddo
            enddo
        end subroutine initSq120to64

        subroutine initAll()
            call initSq120To64()
        end subroutine initAll
end module init
