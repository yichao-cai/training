# Environment Setup

## Gitpod

This material intends to be a quick hands-on tutorial on Nextflow, so we prepared a Gitpod environment with everything you need to follow it. Gitpod offers a virtual machine with everything already set up for you, accessible from your web browser or built into your code editor (eg. VSCode). To start, click on the button bellow.

[![Open in GitPod](https://img.shields.io/badge/Gitpod-%20Open%20in%20Gitpod-908a85?logo=gitpod)](https://gitpod.io/#https://github.com/nextflow-io/training)

In the gitpod window, you'll see a terminal. Type the following command to switch to the folder of this training material:

```bash
cd /workspace/gitpod/hands-on
```

## Pipeline data

All the files needed for the hands-on activity are stored in the directory shown below:

```bash
tree /workspace/gitpod/hands-on
```

```bash
/workspace/gitpod/hands-on
hands-on
├── README.md
├── bin
│   └── gghist.R
├── data
│   ├── blacklist.bed
│   ├── genome.fa
│   ├── known_variants.vcf.gz
│   └── reads
│       ├── ENCSR000COQ1_1.fastq.gz
│       ├── ENCSR000COQ1_2.fastq.gz
│       ├── ENCSR000COQ2_1.fastq.gz
│       ├── ENCSR000COQ2_2.fastq.gz
│       ├── ENCSR000COR1_1.fastq.gz
│       ├── ENCSR000COR1_2.fastq.gz
│       ├── ENCSR000COR2_1.fastq.gz
│       ├── ENCSR000COR2_2.fastq.gz
│       ├── ENCSR000CPO1_1.fastq.gz
│       ├── ENCSR000CPO1_2.fastq.gz
│       ├── ENCSR000CPO2_1.fastq.gz
│       └── ENCSR000CPO2_2.fastq.gz
├── final_main.nf
└── nextflow.config
```

4 directories, 19 files

## Pulling the Docker image

Nextflow can pull Docker images at runtime, which is very useful as we usually work with multiple container images. The best practice when it comes to containers and Nextflow is to have a light container image for each process. This makes pulling/running/stopping containers faster and it's easier to debug, when compared to a bulky container image. Nextflow will make sure these container images are pulled, when not found locally, ran as containers, with volumes mounted plus many other things that you don't have to worry.

Even though Nextflow takes care of that for you, let’s just download manually one of the container images that we will use to see how Docker works:

```bash
docker pull quay.io/biocontainers/samtools:1.3.1--h0cf4675_11
```

It's a very lightweight container image, so the download of the layers should be fast and you will see the output below:

```console
aca8d56a3290: Download complete
445527a00ea8: Download complete
aa5436c16a6a: Download complete
quay.io/biocontainers/samtools:1.3.1--h0cf4675_11
```

You can run this container and launch bash to interact with it by typing the following command:

```console
docker run -ti --rm --entrypoint bash quay.io/biocontainers/samtools:1.3.1--h0cf4675_11
```

Once inside, you can check the version of samtools, for example. You should see something like:

```console
root@0c3770b24a24:/# samtools --version
samtools 1.3.1
Using htslib 1.3.1
Copyright (C) 2016 Genome Research Ltd.
root@0c3770b24a24:/#
```

Type `exit` to exit the container and come back to your shell.

## Script permission

Make sure the following R script has execute permissions:

```bash
chmod +x /workspace/gitpod/hands-on/bin/gghist.R
```
