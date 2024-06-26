#!/bin/bash  
# rMETL's param, depending on the actual installation.
export KNOWN_ME_PATH=

###################################################################
####### Note that 30x means full data, maybe not exact 30x. #######
###################################################################


###########################
# rMETL's 5x HiFi Command #
###########################

export tempdir=HiFi/rMETL5x
export result=HiFi/result5x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/HiFi/pick_me_5x.bam

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
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/HiFi/pick_me_10x.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 15x HiFi Command #
############################

export tempdir=HiFi/rMETL15x
export result=HiFi/result15x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/HiFi/pick_me_15x.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult15x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult15x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x HiFi Command #
############################

export tempdir=HiFi/rMETL30x
export result=HiFi/result30x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/HiFi/pick_me_30x.bam

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
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/ONT/pick_me_5x.bam

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
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/ONT/pick_me_10x.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 15x ONT Command #
############################

export tempdir=ONT/rMETL15x
export result=ONT/result15x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/ONT/pick_me_15x.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult15x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult15x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x ONT Command #
############################

export tempdir=ONT/rMETL30x
export result=ONT/result30x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/ONT/pick_me_30x.bam

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
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/CLR/pick_me_5x.bam

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
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/CLR/pick_me_10x.bam

rMETL detection $align $ref $tempdir $result -s 2 -t 4

export result2=./finalresult10x/
rMETL realignment -t 4 ${result}x/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult10x/
rMETL calling $result2/cluster.sam $ref vcf $result3



############################
# rMETL's 15x CLR Command #
############################

export tempdir=CLR/rMETL15x
export result=CLR/result15x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/CLR/pick_me_15x.bam

rMETL detection $align $ref $tempdir $result -s 3 -t 4

export result2=./finalresult15x/
rMETL realignment -t 4 ${result}/potential_ME.fa $KNOWN_ME_PATH $result2

export result3=./finalfinalresult15x/
rMETL calling $result2/cluster.sam $ref vcf $result3




############################
# rMETL's 30x CLR Command #
############################

export tempdir=CLR/rMETL30x
export result=CLR/result30x
export ref=../Ref_genome/ref.fa
export align=../Real_data/HG00731/CLR/pick_me_30x.bam

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
cuteSV ../Real_data/HG00731/HiFi/pick_me_5x.bam ../Ref_genome/ref.fa HiFi/5x/cuteSV_HiFi.vcf --genotype \
         HiFi/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/5x/cuteSV_HiFi.vcf ../Real_data/HG00731/HiFi/pick_me_5x.bam \
        HiFi/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/5x/MEHunterWork HiFi/5x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x HiFi Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/HiFi/pick_me_10x.bam ../Ref_genome/ref.fa HiFi/10x/cuteSV_HiFi.vcf --genotype \
         HiFi/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/10x/cuteSV_HiFi.vcf ../Real_data/HG00731/HiFi/pick_me_10x.bam \
        HiFi/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/10x/MEHunterWork HiFi/10x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 15x HiFi Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/HiFi/pick_me_15x.bam ../Ref_genome/ref.fa HiFi/15x/cuteSV_HiFi.vcf --genotype \
         HiFi/15x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/15x/cuteSV_HiFi.vcf ../Real_data/HG00731/HiFi/pick_me_15x.bam \
        HiFi/15x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/15x/MEHunterWork HiFi/15x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 30x HiFi Command #
####################


conda activate cuteSVenv
cuteSV ../Real_data/HG00731/HiFi/pick_me_30x.bam ../Ref_genome/ref.fa HiFi/30x/cuteSV_HiFi.vcf --genotype \
         HiFi/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter HiFi/30x/cuteSV_HiFi.vcf ../Real_data/HG00731/HiFi/pick_me_30x.bam \
        HiFi/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH HiFi/30x/MEHunterWork HiFi/30x/MEHunter_HiFi.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10




###################
# 5x ONT Command #
###################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/ONT/pick_me_5x.bam ../Ref_genome/ref.fa ONT/5x/cuteSV_ONT.vcf --genotype \
         ONT/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/5x/cuteSV_ONT.vcf ../Real_data/HG00731/ONT/pick_me_5x.bam \
        ONT/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/5x/MEHunterWork ONT/5x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x ONT Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/ONT/pick_me_10x.bam ../Ref_genome/ref.fa ONT/10x/cuteSV_ONT.vcf --genotype \
         ONT/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/10x/cuteSV_ONT.vcf ../Real_data/HG00731/ONT/pick_me_10x.bam \
        ONT/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/10x/MEHunterWork ONT/10x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 15x ONT Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/ONT/pick_me_15x.bam ../Ref_genome/ref.fa ONT/15x/cuteSV_ONT.vcf --genotype \
         ONT/15x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/15x/cuteSV_ONT.vcf ../Real_data/HG00731/ONT/pick_me_15x.bam \
        ONT/15x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/15x/MEHunterWork ONT/15x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 30x ONT Command #
####################


conda activate cuteSVenv
cuteSV ../Real_data/HG00731/ONT/pick_me_30x.bam ../Ref_genome/ref.fa ONT/30x/cuteSV_ONT.vcf --genotype \
         ONT/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter ONT/30x/cuteSV_ONT.vcf ../Real_data/HG00731/ONT/pick_me_30x.bam \
        ONT/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH ONT/30x/MEHunterWork ONT/30x/MEHunter_ONT.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10


###################
# 5x CLR Command #
###################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/CLR/pick_me_5x.bam ../Ref_genome/ref.fa CLR/5x/cuteSV_CLR.vcf --genotype \
         CLR/5x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/5x/cuteSV_CLR.vcf ../Real_data/HG00731/CLR/pick_me_5x.bam \
        CLR/5x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/5x/MEHunterWork CLR/5x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

####################
# 10x CLR Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/CLR/pick_me_10x.bam ../Ref_genome/ref.fa CLR/10x/cuteSV_CLR.vcf --genotype \
         CLR/10x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/10x/cuteSV_CLR.vcf ../Real_data/HG00731/CLR/pick_me_10x.bam \
        CLR/10x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/10x/MEHunterWork CLR/10x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

         

####################
# 15x CLR Command #
####################

conda activate cuteSVenv
cuteSV ../Real_data/HG00731/CLR/pick_me_15x.bam ../Ref_genome/ref.fa CLR/15x/cuteSV_CLR.vcf --genotype \
         CLR/15x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/15x/cuteSV_CLR.vcf ../Real_data/HG00731/CLR/pick_me_15x.bam \
        CLR/15x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/15x/MEHunterWork CLR/15x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10

###################
# 30x CLR Command #
###################


conda activate cuteSVenv
cuteSV ../Real_data/HG00731/CLR/pick_me_30x.bam ../Ref_genome/ref.fa CLR/30x/cuteSV_CLR.vcf --genotype \
         CLR/30x/cuteWork/ -s 1 -t 16 -L 10000 --report_readid --retain_work_dir --diff_ratio_merging_INS 1.1 --diff_ratio_merging_DEL 1.1 --diff_ratio_filtering_TRA 1.1

conda activate MEHunter
MEHunter CLR/30x/cuteSV_CLR.vcf ../Real_data/HG00731/CLR/pick_me_30x.bam \
        CLR/30x/cuteWork/ ../Ref_genome/hg38.fa $KNOWN_ME_PATH CLR/30x/MEHunterWork CLR/30x/MEHunter_CLR.vcf --DL_module $DL_module \
        --retain_work_dir -t 16 --batch_size 32 --MAX_seqs 10



###################
# Show the Result #
###################

python main.py
python main_no_dl.py