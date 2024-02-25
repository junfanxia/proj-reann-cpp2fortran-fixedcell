program mypes 
    use pes_mod
    implicit none
    character*40 a
    integer(kind=4) :: i,j,npoint
    real(kind=8) :: energy_ini, energy_cal
    real(kind=8),allocatable::coor(:), force_ini(:), force_cal(:)

    !part-1 reann model initialization
    call init_reann()

    allocate(coor(numatoms*3),force_ini(numatoms*3),force_cal(numatoms*3))
    npoint=1
    open(181,file="./configuration")
    do i = 1,npoint
      read(181,*)
      do j = 1,3
        read(181,*) cell(j,1:3)
      end do
      read(181,*) a,pbc
      do j=1,numatoms
        read(181,*) species(j),mass(j),coor(1+(j-1)*3:3+(j-1)*3),force_ini(1+(j-1)*3:3+(j-1)*3)
      end do
      read(181,*) a,energy_ini
      energy_cal=0.0
      force_cal=0.0

      do j = 1,40
      !part-2 reann model inference
      call pes_ptr%reann_out(coor, energy_cal, force_cal)
      end do

      write(*,*) energy_cal
      write(*,'(3f14.8)') force_cal
    end do
    close(181)

    !part-3 deallocate all variables realeated to reann
    call delete_reann()
    deallocate(coor,force_ini,force_cal)
end program
