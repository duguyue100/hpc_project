program gather
    use mpi
    implicit none

    integer, parameter :: nb_values=8
    integer :: nb_procs, rank, block_length, i, code
    real, dimension(nb_values) :: data
    real, allocatable, dimension(:) :: values

    call MPI_INIT(code)
    call MPI_COMM_SIZE(MPI_COMM_WORLD, nb_procs, code)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    block_length = nb_values/nb_procs

    allocate(values(block_length))

    values(:) = (/(1000.+rank*block_length+i, i=1, block_length)/)
    print *, 'I, process ', rank, 'sent my values array :', &
        values(1:block_length)
    
    call MPI_GATHER(values, block_length, MPI_REAL, data, block_length, &
        MPI_REAL, 2, MPI_COMM_WORLD, code)

    if (rank == 2) print *, 'I, process 2 received ', data(1:nb_values)

    call MPI_FINALIZE(code)

end program gather
