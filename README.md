# dogGenomics

Conda environments created:

```
conda create -y --name snakemake -c bioconda snakemake
```

```
conda create -y --name jdk -c bioconda java-jdk
conda create -y --name mqc conda-forge -c bioconda mutliqc
conda create -y --name fqc -c conda-forge -c bioconda fastqc
conda create -y --name gatk4.1 -c conda-forge -c bioconda gatk4
conda install -c bioconda picard #inside the gatk4.1 env
conda install -c bioconda bwa
conda create -y --name bwa -c conda-forge -c bioconda bwa
```

Request compute node resources on Farm

```
srun -p med -t 07:00:00 --mem=2000 --pty bash
srun -p high -t 12:00:00 --mem=20000 --pty bash
```
Use high for mapping

testing auth
