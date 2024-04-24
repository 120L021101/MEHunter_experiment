#!/bin/bash  
# rMETL's param, depending on the actual installation.
export KNOWN_ME_PATH=

###########################
# rMETL's 5x HiFi Command #
###########################

export tempdir=HiFi/rMETL5x
export result=HiFi/result5x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/HiFi/SIM_FCCS_UL_5x_s1_sort.bam

rMETL detection $align $ref $tempdir $result -s 1 -t 4

export result2=./finalresult5x/
rMETL realignment -t 4 ./result5x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult5x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 10x HiFi Command #
############################

export tempdir=HiFi/rMETL10x
export result=HiFi/result10x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/HiFi/SIM_FCCS_UL_10x_s2_sort.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 20x HiFi Command #
############################

export tempdir=HiFi/rMETL20x
export result=HiFi/result20x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/HiFi/SIM_FCCS_UL_20x_s3_sort.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult20x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult20x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x HiFi Command #
############################

export tempdir=HiFi/rMETL30x
export result=HiFi/result30x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/HiFi/SIM_FCCS_UL_30x_s4_sort.bam

rMETL detection $align $ref $tempdir $result -s 5 -t 4

export result2=./finalresult30x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult30x/
rMETL calling ${result2}/cluster.sam $ref vcf $result3



###########################
# rMETL's 5x ONT Command #
###########################

export tempdir=ONT/rMETL5x
export result=ONT/result5x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/ONT/SIM_FONT_5x_s1_sort.bam

rMETL detection $align $ref $tempdir $result -s 1 -t 4

export result2=./finalresult5x/
rMETL realignment -t 4 ./result5x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult5x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 10x ONT Command #
############################

export tempdir=ONT/rMETL10x
export result=ONT/result10x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/ONT/SIM_FONT_10x_s2_sort.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 20x ONT Command #
############################

export tempdir=ONT/rMETL20x
export result=ONT/result20x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/ONT/SIM_FONT_20x_s3_sort.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult20x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult20x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x ONT Command #
############################

export tempdir=ONT/rMETL30x
export result=ONT/result30x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/ONT/SIM_FONT_30x_s4_sort.bam

rMETL detection $align $ref $tempdir $result -s 5 -t 4

export result2=./finalresult30x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult30x/
rMETL calling ${result2}/cluster.sam $ref vcf $result3




###########################
# rMETL's 5x CLR Command #
###########################

export tempdir=CLR/rMETL5x
export result=CLR/result5x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/CLR/SIM_FCLR_5x_s1_sort.bam

rMETL detection $align $ref $tempdir $result -s 1 -t 4

export result2=./finalresult5x/
rMETL realignment -t 4 ./result5x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult5x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 10x CLR Command #
############################

export tempdir=CLR/rMETL10x
export result=CLR/result10x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/CLR/SIM_FCLR_10x_s2_sort.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 20x CLR Command #
############################

export tempdir=CLR/rMETL20x
export result=CLR/result20x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/CLR/SIM_FCLR_20x_s3_sort.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult20x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult20x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x CLR Command #
############################

export tempdir=CLR/rMETL30x
export result=CLR/result30x
export ref=../Ref_genome_Simulated/ref.fa
export align=../Simulated_data/CLR/SIM_FCLR_30x_s4_sort.bam

rMETL detection $align $ref $tempdir $result -s 5 -t 4

export result2=./finalresult30x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult30x/
rMETL calling ${result2}/cluster.sam $ref vcf $result3





# MEHunter's param, depending on the actual installation.
export KNOWN_ME_PATH=
export DL_module=


###################
# 5x HiFi Command #
###################

conda activate cuteSVenv
cuteSV ../Simulated_data/HiFi/SIM_FCCS_UL_5x_s1_sort.bam ../Ref_genome_Simulated/ref.fa HiFi/5x/cuteSV_HiFi.vcf --genotype \
         HiFi/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/5x/cuteSV_HiFi.vcf ../Simulated_data/HiFi/SIM_FCCS_UL_5x_s1_sort.bam \
        HiFi/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/5x/MEHunterWork HiFi/5x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x HiFi Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/HiFi/SIM_FCCS_UL_10x_s2_sort.bam ../Ref_genome_Simulated/ref.fa HiFi/10x/cuteSV_HiFi.vcf --genotype \
         HiFi/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/10x/cuteSV_HiFi.vcf ../Simulated_data/HiFi/SIM_FCCS_UL_10x_s2_sort.bam \
        HiFi/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/10x/MEHunterWork HiFi/10x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 20x HiFi Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/HiFi/SIM_FCCS_UL_20x_s3_sort.bam ../Ref_genome_Simulated/ref.fa HiFi/20x/cuteSV_HiFi.vcf --genotype \
         HiFi/20x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/20x/cuteSV_HiFi.vcf ../Simulated_data/HiFi/SIM_FCCS_UL_20x_s3_sort.bam \
        HiFi/20x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/20x/MEHunterWork HiFi/20x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 30x HiFi Command #
####################


conda activate cuteSVenv
cuteSV ../Simulated_data/HiFi/SIM_FCCS_UL_30x_s4_sort.bam ../Ref_genome_Simulated/ref.fa HiFi/30x/cuteSV_HiFi.vcf --genotype \
         HiFi/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/30x/cuteSV_HiFi.vcf ../Simulated_data/HiFi/SIM_FCCS_UL_30x_s4_sort.bam \
        HiFi/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/30x/MEHunterWork HiFi/30x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10




###################
# 5x ONT Command #
###################

conda activate cuteSVenv
cuteSV ../Simulated_data/ONT/SIM_FONT_5x_s1_sort.bam ../Ref_genome_Simulated/ref.fa ONT/5x/cuteSV_ONT.vcf --genotype \
         ONT/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/5x/cuteSV_ONT.vcf ../Simulated_data/ONT/SIM_FONT_5x_s1_sort.bam \
        ONT/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/5x/MEHunterWork ONT/5x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x ONT Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/ONT/SIM_FONT_10x_s2_sort.bam ../Ref_genome_Simulated/ref.fa ONT/10x/cuteSV_ONT.vcf --genotype \
         ONT/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/10x/cuteSV_ONT.vcf ../Simulated_data/ONT/SIM_FONT_10x_s2_sort.bam \
        ONT/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/10x/MEHunterWork ONT/10x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 20x ONT Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/ONT/SIM_FONT_20x_s3_sort.bam ../Ref_genome_Simulated/ref.fa ONT/20x/cuteSV_ONT.vcf --genotype \
         ONT/20x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/20x/cuteSV_ONT.vcf ../Simulated_data/ONT/SIM_FONT_20x_s3_sort.bam \
        ONT/20x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/20x/MEHunterWork ONT/20x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 30x ONT Command #
####################


conda activate cuteSVenv
cuteSV ../Simulated_data/ONT/SIM_FONT_30x_s4_sort.bam ../Ref_genome_Simulated/ref.fa ONT/30x/cuteSV_ONT.vcf --genotype \
         ONT/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/30x/cuteSV_ONT.vcf ../Simulated_data/ONT/SIM_FONT_30x_s4_sort.bam \
        ONT/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/30x/MEHunterWork ONT/30x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10


###################
# 5x CLR Command #
###################

conda activate cuteSVenv
cuteSV ../Simulated_data/CLR/SIM_FCLR_5x_s1_sort.bam ../Ref_genome_Simulated/ref.fa CLR/5x/cuteSV_CLR.vcf --genotype \
         CLR/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/5x/cuteSV_CLR.vcf ../Simulated_data/CLR/SIM_FCLR_5x_s1_sort.bam \
        CLR/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/5x/MEHunterWork CLR/5x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x CLR Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/CLR/SIM_FCLR_10x_s2_sort.bam ../Ref_genome_Simulated/ref.fa CLR/10x/cuteSV_CLR.vcf --genotype \
         CLR/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/10x/cuteSV_CLR.vcf ../Simulated_data/CLR/SIM_FCLR_10x_s2_sort.bam \
        CLR/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/10x/MEHunterWork CLR/10x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 20x CLR Command #
####################

conda activate cuteSVenv
cuteSV ../Simulated_data/CLR/SIM_FCLR_20x_s3_sort.bam ../Ref_genome_Simulated/ref.fa CLR/20x/cuteSV_CLR.vcf --genotype \
         CLR/20x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/20x/cuteSV_CLR.vcf ../Simulated_data/CLR/SIM_FCLR_20x_s3_sort.bam \
        CLR/20x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/20x/MEHunterWork CLR/20x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 30x CLR Command #
####################


conda activate cuteSVenv
cuteSV ../Simulated_data/CLR/SIM_FCLR_30x_s4_sort.bam ../Ref_genome_Simulated/ref.fa CLR/30x/cuteSV_CLR.vcf --genotype \
         CLR/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/30x/cuteSV_CLR.vcf ../Simulated_data/CLR/SIM_FCLR_30x_s4_sort.bam \
        CLR/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/30x/MEHunterWork CLR/30x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10
