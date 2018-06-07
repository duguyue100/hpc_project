program sendrecv
    use mpi
    implicit none

    integer :: rank, value, num_proc, code
    integer, parameter :: tag=110

    call MPI_INIT(code)

    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    num_proc = mod(rank+1, 2)

    call MPI_SEND(rank+1000, 1, MPI_INTEGER, num_proc, tag, MPI_COMM_WORLD, code)
    call MPI_RECV(value, 1, MPI_INTEGER, num_proc, tag, MPI_COMM_WORLD, MPI_STATUS_IGNORE, code)

    print *, 'I, process', rank, ', I received', value, 'from process ', num_proc

    call MPI_FINALIZE(code)
end program sendrecv
