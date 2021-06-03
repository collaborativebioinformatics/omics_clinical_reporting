version development

workflow OpenCRAVATRunWorkflow {
    input {
        File variants
        String genome
    }
    call OpenCRAVATRun { input: variants=variants, genome=genome }
}

task OpenCRAVATRun {
    input {
        File variants
        String genome
        String baseName = basename(variants)
    }
    command {
        export TMPDIR=/tmp/job
        oc module install-base 
        oc module install -y clinvar
        oc module install -y cosmic
        oc module install -y vcfreporter
        oc run ~{variants} -d . -l ~{genome} -t vcf --system-option -n ~{baseName}
    }
    output {
        File db = "~{baseName}"+".sqlite"
        File log = "~{baseName}"+".log"
        File err = "~{baseName}"+".err"
        File vcf = "~{baseName}"+".vcf"
    }
    runtime {
        docker: "karchinlab/opencravat-cwl-install"
	#dx_instance_type: "mem1_ssd2_x4"
    }
}
