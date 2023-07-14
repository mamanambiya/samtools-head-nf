#!/usr/bin/env nextflow

include { samtools_head } from "./modules/functions"

//params.input = null

//input = params.input

// input = "https://ga4gh-ismb-tutorial-2022.s3.us-east-2.amazonaws.com/data/1000genomes/cram/lowcov/HG00118.lowcoverage.downsampled.cram"

def helpMessage(message) {
    log.info"""
    ${message}
    Get the header of a SAM/BAM/CRAM file using samtools head and print to stdout
    Usage:
    nextflow run yash-puligundla/samtools-head-nf --input \${INPUT}
    Mandatory arguments:
      --input    [string] local path or URL to input SAM/BAM/CRAM

    Optional arguments:
      --help     [flag] display this help message and exit

    """.stripIndent()
}

if (params.help) exit 0, helpMessage("")

if (input == null) {
    exit 1, helpMessage("ERROR: no --input specified")
}

in = Channel.fromPath(input)


workflow {
    samtools_head(in)
}
