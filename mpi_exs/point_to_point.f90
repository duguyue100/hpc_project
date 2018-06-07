program point_to_point
    use mpi
    implicit none

    integer, dimension(MPI_STATUS_SIZE) :: status
    integer, parameter :: tag=100
    integer :: rank, value, code

    call MPI_INIT(code)

    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    if (rank == 2) then
        value = 1000
        call MPI_SEND(value, 1, MPI_INTEGER, 5, tag, MPI_COMM_WORLD, code)
    elseif (rank == 5) then
        call MPI_RECV(value, 1, MPI_INTEGER, 2, tag, MPI_COMM_WORLD, status, code)
        print *, MPI_STATUS_SIZE
        print *, 'I, process 5, I received ', value, ' from the process 2'
    end if

    call MPI_FINALIZE(code)

end program point_to_point
