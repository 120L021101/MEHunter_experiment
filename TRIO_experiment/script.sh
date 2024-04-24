#!/bin/bash  
# MEHunter's param, depending on the actual installation.
export KNOWN_ME_PATH=
export DL_module=

###################
# HG00731 Command #
###################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/HiFi/pick_me.bam ../Ref_genome/hg38.fa HG00731/cuteSV_HiFi.vcf --genotype \
         HG00731/cuteWork/ -s 6 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter cuteSV_HiFi.vcf ../Real_data/HG00731/HiFi/pick_me.bam \
        HG00731/cuteWork ../Ref_genome/hg38.fa $KNOWN_ME_PATH HG00731/MEHunterWork HG00731/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10
         

###################
# HG00732 Command #
###################

conda activate cuteSVenv
cuteSV ../Real_data/HG00732/HiFi/pick_me.bam ../Ref_genome/hg38.fa HG00732/cuteSV_HiFi.vcf --genotype \
         HG00732/cuteWork/ -s 2 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter cuteSV_HiFi.vcf ../Real_data/HG00732/HiFi/pick_me.bam \
        HG00732/cuteWork ../Ref_genome/hg38.fa $KNOWN_ME_PATH HG00732/MEHunterWork HG00732/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10
         


###################
# HG00733 Command #
###################

conda activate cuteSVenv
cuteSV ../Real_data/HG00733/HiFi/pick_me.bam ../Ref_genome/hg38.fa HG00733/cuteSV_HiFi.vcf --genotype \
         HG00733/cuteWork/ -s 2 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter cuteSV_HiFi.vcf ../Real_data/HG00733/HiFi/pick_me.bam \
        HG00733/cuteWork ../Ref_genome/hg38.fa $KNOWN_ME_PATH HG00733/MEHunterWork HG00733/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10
         


###############
# SHOW RESULT #
###############

python main.py