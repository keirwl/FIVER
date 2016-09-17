module defs
    implicit none

    integer, parameter :: BOARD_SQ_NUM = 120
    integer, parameter :: MAXGAMEMOVES = 2048

    ! pieces on board
    enum, bind(c)
        enumerator EMPTY, wP, wN, wB, wR, wQ, wK, bP, bN, bB, bR, bQ, bK
    endenum

    ! files
    enum, bind(c)
        enumerator FILE_A, FILE_B, FILE_C, FILE_D, FILE_E, FILE_F, FILE_G, FILE_H, FILE_NONE
    endenum

    ! ranks
    enum, bind(c)
        enumerator RANK_1, RANK_2, RANK_3, RANK_4, RANK_5, RANK_6, RANK_7, RANK_8, RANK_NONE
    endenum

    ! sides
    enum, bind(c)
        enumerator WHITE, BLACK, BOTH
    endenum

    ! board squares
    enum, bind(c)
        enumerator :: A1=21, B1, C1, D1, E1, F1, G1, H1
        enumerator :: A2=31, B2, C2, D2, E2, F2, G2, H2
        enumerator :: A3=41, B3, C3, D3, E3, F3, G3, H3
        enumerator :: A4=51, B4, C4, D4, E4, F4, G4, H4
        enumerator :: A5=61, B5, C5, D5, E5, F5, G5, H5
        enumerator :: A6=71, B6, C6, D6, E6, F6, G6, H6
        enumerator :: A7=81, B7, C7, D7, E7, F7, G7, H7
        enumerator :: A8=91, B8, C8, D8, E8, F8, G8, H8
        enumerator NO_SQ
    endenum

    ! castling rights
    enum, bind(c)
        enumerator :: WKCA=1
        enumerator :: WQCA=2
        enumerator :: BKCA=4
        enumerator :: BQCA=8
    endenum

    ! "undo move" type for storing history
    type :: Undo
        integer :: move
        integer(1) :: castleperm
        integer :: enpas
        integer :: fiftymove
        integer*8 :: poskey
    end type Undo

    type :: Board
        integer, dimension(BOARD_SQ_NUM) :: pieces

        ! In C this is a U64. See if there's a way
        ! of doing this bitwise in Fortran
        logical, dimension(3,64) :: pawns

        ! Squares that the Kings are on
        integer, dimension(2) :: kingsq
        ! En Passant square if active
        integer :: enpas
        ! Fifty ply counter
        integer :: fiftymove

        integer :: ply
        integer :: hisply

        ! castling permissions
        integer(1) :: castleperm

        ! Unique position key
        integer(8) :: poskey;

        ! Number of pieces on board indexed by piece type
        integer, dimension(13) :: pcenum ! 13 piece types including none
        integer, dimension(3) :: bigpce ! all non-pawn pieces
        integer, dimension(3) :: majpce ! major pieces
        integer, dimension(3) :: minpce ! minor pieces

        ! history of all moves
        type(Undo), dimension(MAXGAMEMOVES) :: history
    end type Board
end module defs
