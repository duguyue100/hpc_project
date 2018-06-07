program reduce
    use mpi
    implicit none

    integer :: nb_procs, rank, value, sum, code

    call MPI_INIT(code)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nb_procs, code)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    if (rank == 0) then
        value = 1000
    else
        value = rank
    endif

    call MPI_REDUCE(value, sum, 1, MPI_INTEGER, MPI_SUM, 0, MPI_COMM_WORLD, code)

    if (rank == 0) then
        print *, 'I, process 0, have the global sum value ', sum
    end if

    call MPI_FINALIZE(code)

end program reduce
