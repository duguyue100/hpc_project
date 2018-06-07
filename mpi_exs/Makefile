#------------------
F90 = mpif90

# Fortran compilation options
#-----------------------------
CFLAGS = -O3

# Linker options
#---------------
LDFLAGS = -O3

whoiam:
	$(F90) $(CFLAGS) -c whoiam.f90
	$(F90) $(LDFLAGS) whoiam.o -o whoiam

p2p:
	$(F90) $(CFLAGS) -c point_to_point.f90
	$(F90) $(LDFLAGS) point_to_point.o -o point_to_point

sendrecv:
	$(F90) $(CFLAGS) -c sendrecv.f90
	$(F90) $(LDFLAGS) sendrecv.o -o sendrecv

reduce:
	$(F90) $(CFLAGS) -c reduce.f90
	$(F90) $(LDFLAGS) reduce.o -o reduce

allreduce:
	$(F90) $(CFLAGS) -c allreduce.f90
	$(F90) $(LDFLAGS) allreduce.o -o allreduce

bcast:
	$(F90) $(CFLAGS) -c bcast.f90
	$(F90) $(LDFLAGS) bcast.o -o bcast

scatter:
	$(F90) $(CFLAGS) -c scatter.f90
	$(F90) $(LDFLAGS) scatter.o -o scatter

gather:
	$(F90) $(CFLAGS) -c gather.f90
	$(F90) $(LDFLAGS) gather.o -o gather

allgather:
	$(F90) $(CFLAGS) -c allgather.f90
	$(F90) $(LDFLAGS) allgather.o -o allgather

alltoall:
	$(F90) $(CFLAGS) -c alltoall.f90
	$(F90) $(LDFLAGS) alltoall.o -o alltoall
	
clean:
	rm -f *.o
	rm -f whoiam
	rm -f point_to_point
	rm -f sendrecv
	rm -f reduce
	rm -f allreduce
	rm -f bcast
	rm -f scatter
	rm -f gather
	rm -f allgather
	rm -f alltoall
