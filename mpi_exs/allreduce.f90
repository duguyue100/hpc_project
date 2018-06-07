program allreduce
    use mpi
    implicit none

    integer :: nb_procs, rank, value, product, code

    call MPI_INIT(code)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nb_procs, code)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    if (rank == 0) then
        value = 10
    else
        value = rank
    endif

    call MPI_ALLREDUCE(value, product, 1, MPI_INTEGER, MPI_PROD, MPI_COMM_WORLD, code)
    
    print *, 'I, process ', rank, ', received the value of the global product ', product

    call MPI_FINALIZE(code)
end program allreduce
