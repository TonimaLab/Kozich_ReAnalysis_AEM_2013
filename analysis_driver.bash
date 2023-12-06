#!/usr/bin/env bash

# Obtained the raw `fastq.gz` files from https://www.mothur.org/MiSeqDevelopmentData.html
# * Downloaded https://mothur.s3.us-east-2.amazonaws.com/data/MiSeqDevelopmentData/StabilityWMetaG.tar
# * Ran the following from the project's root directoryy

wget --no-check-certificate https://mothur.s3.us-east-2.amazonaws.com/data/MiSeqDevelopmentData/StabilityWMetaG.tar
tar xvf StabilityWMetaG.tar -C data/raw/
rm StabilityWMetaG.tar

# Obtained the silva reference alignment from the mothur website:

wget https://mothur.s3.us-east-2.amazonaws.com/wiki/silva.seed_v123.tgz
tar xvzf silva.seed_v123.tgz silva.seed_v123.align silva.seed_v123.tax
code/mothur/mothur "#get.lineage(fasta=silva.seed_v123.align, taxonomy=silva.seed_v123.tax, taxon=Bacteria);degap.seqs(fasta=silva.seed_v123.pick.align, processors=8)"
mv silva.seed_v123.pick.align data/references/silva.seed.align
rm silva.seed_v123.tgz silva.seed_v123.*
rm mothur.*.logfile

#Obtained the RDP reference taxonomy from the mothur website:

wget -N https://mothur.s3.us-east-2.amazonaws.com/wiki/trainset14_032015.pds.tgz
tar xvzf trainset14_032015.pds.tgz
mv trainset14_032015.pds/trainset* data/references/
rm -rf trainset14_032015.pds
rm trainset14_032015.pds.tgz

