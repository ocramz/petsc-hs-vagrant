# petsc-hs-vagrant
Testing petsc-hs with a Vagrant multi-VM

We use Vagrant to provision a multi-machine configuration :

* Master node: petsc-hs, PETSc/SLEPc, slurmctld + dependencies

* Compute nodes: PETSc/SLEPc, slurmd + dependencies

* Service discovery: consul + dependencies


Design questions:

* Container networking/coordination : docker-compose or Vagrant?
