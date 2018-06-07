program who_I_am
    use mpi
    implicit none
    integer :: nb_procs, rank, code

    call MPI_INIT(code)

    call MPI_COMM_SIZE(MPI_COMM_WORLD, nb_procs, code)
    call MPI_COMM_RANK(MPI_COMM_WORLD, rank, code)

    print *, 'I am the process ', rank, 'among', nb_procs

    call MPI_FINALIZE(code)
end program who_I_am
