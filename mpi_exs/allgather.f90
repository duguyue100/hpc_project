program allgather
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

    call MPI_ALLGATHER(values, block_length, MPI_REAL, data, block_length, &
        MPI_REAL, MPI_COMM_WORLD, code)

    print *, 'I, process ', rank, ', received ', data(1:nb_values)

    call MPI_FINALIZE(code)

end program allgather
