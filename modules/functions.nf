#!/usr/bin/env nextflow

process samtools_head {

    input:
      file mycram

    output:
        path "output_samtools_head.txt"

    script:
    """
    samtools head ${mycram} > output_samtools_head.txt
    """
}