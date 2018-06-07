program bcast
    use mpi
    implicit none

    integer :: rank, value, code

    call MPI_INIT(code)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)
    
    if (rank == 2) value = rank+1000

    call MPI_BCAST(value, 1, MPI_INTEGER, 2, MPI_COMM_WORLD, code)

    print *, 'I, process ', rank, ' receieved ', value, ' of process 2'

    call MPI_FINALIZE(code)
end program bcast
