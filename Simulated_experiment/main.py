import pyfastx  
  


def closest(arr, target, key1 = lambda x : x[2], key2 = lambda x : x[1]):
    lowest_distance = None; idx = None
    for i, item in enumerate(arr):
        cur_distance = abs(key1(item) - key2(target))
        if lowest_distance is None or cur_distance < lowest_distance:
            lowest_distance = cur_distance
            idx = i
    return idx, lowest_distance

def f(score):
    return 100 * score

def output_in_format(results):
    overall_score, genotype_score = results
    print("\t\tPRECISION\tRECALL\t\tF1\n")
    print("OVEARALL INS\t{:.2f}%\t\t{:.2f}%\t\t{:.2f}%\n".format(
        f(overall_score['precision_ins']), f(overall_score['recall_ins']), f(overall_score['f1_ins'])
    ))
    print("GENOTYPE INS\t{:.2f}%\t\t{:.2f}%\t\t{:.2f}%\n".format(
        f(genotype_score['precision_ins']), f(genotype_score['recall_ins']), f(genotype_score['f1_ins'])
    ))
    print("OVEARALL DEL\t{:.2f}%\t\t{:.2f}%\t\t{:.2f}%\n".format(
        f(overall_score['precision_del']), f(overall_score['recall_del']), f(overall_score['f1_del'])
    ))
    print("GENOTYPE DEL\t{:.2f}%\t\t{:.2f}%\t\t{:.2f}%\n".format(
        f(genotype_score['precision_del']), f(genotype_score['recall_del']), f(genotype_score['f1_del'])
    ))

def countN(seq):
    c = 0
    for ch in str(seq):
        if ch == 'N':
            c += 1
    return c

def merit(ans_path, vcf_path):
    answer_reader = open(file=ans_path, mode='r', encoding='utf-8')
    predict_reader = open(file=vcf_path, mode='r', encoding='utf-8')

    answer_ins_sum = 0; answer_del_sum = 0
    ins_ans = {}; del_ans = {}
    # 打开基因组文件  
    fasta = pyfastx.Fasta('../Ref_genome_Simulated/ref.fa')  
   
    for line in answer_reader:
        info_ls = line.strip().split('\t')
        (variant_type, chromosome, start, end, genotype) = tuple(info_ls)
        start = int(start); end = int(end)
        info_ls[2] = int(info_ls[2]); info_ls[3] = int(info_ls[3])
        if 'ME' not in variant_type: continue
        if chromosome not in del_ans: del_ans[chromosome] = []
        if chromosome not in ins_ans: ins_ans[chromosome] = []
        if 'I' in line:
            # c = countN(fasta[info_ls[1]][info_ls[2] - 100 : info_ls[2]])
            # if c / 100 >= 0.8: continue
            answer_ins_sum += 1
            ins_ans[chromosome].append(info_ls)
        if 'D' in line:
            c = countN(fasta[info_ls[1]][info_ls[2] - 100 : info_ls[2]])
            if c / 100 >= 0.8: continue
            # time.sleep(1)
            answer_del_sum += 1
            del_ans[chromosome].append(info_ls)
    
    ins_pred = {}; del_pred = {}
    predict_ins_sum = 1e-5; predict_del_sum = 1e-5
    for line in predict_reader:
        if line.startswith('#'): continue
        if not 'High_Quality' in line: continue
        info_ls = line.strip().split('\t')
        info_ls[1] = int(info_ls[1])

        chromosome = info_ls[0]
        if chromosome not in ins_pred: ins_pred[chromosome] = []
        if chromosome not in del_pred: del_pred[chromosome] = []
        if 'INS' in line:
            predict_ins_sum += 1
            ins_pred[chromosome].append(info_ls)
        if 'DEL' in line:
            predict_del_sum += 1
            del_pred[chromosome].append(info_ls)
        
    STANDARD = 300
    overall_ins_right = 1e-5; overall_del_right = 1e-5
    genotype_ins_right = 1e-5; genotype_del_right = 1e-5
    for chr in ins_pred:
        for item in ins_pred[chr]:
            if chr not in ins_ans: continue
            idx, distance = closest(ins_ans[chr], item)
            if idx is None: continue
            if distance < STANDARD: overall_ins_right += 1
            pred_genotype = item[-1].split(':')[0]
            if 'calling' in vcf_path:
                pred_genotype = '1/1' if pred_genotype == '1/1' else '0/1'
            if distance < STANDARD and pred_genotype == ins_ans[chr][idx][-1]:
                genotype_ins_right += 1

    for chr in del_pred:
        for item in del_pred[chr]:
            if chr not in del_ans: continue
            idx, distance = closest(del_ans[chr], item)
            if not idx: continue
            if distance < STANDARD: overall_del_right += 1
            pred_genotype = item[-1].split(':')[0]
            if 'calling' in vcf_path:
                pred_genotype = '1/1' if pred_genotype == '1/1' else '0/1'
            # print(distance, del_ans[chr][idx], item)
            if distance < STANDARD and pred_genotype == del_ans[chr][idx][-1]:
                genotype_del_right += 1

    overall_score = {
        'precision_ins' : overall_ins_right / predict_ins_sum,
        'precision_del' : overall_del_right / predict_del_sum,
        'recall_ins' : overall_ins_right / answer_ins_sum,
        'recall_del' : overall_del_right / answer_del_sum,
    }
    overall_score['f1_ins'] = 2 * (overall_score['precision_ins'] * overall_score['recall_ins']) / (overall_score['precision_ins'] + overall_score['recall_ins'])
    overall_score['f1_del'] = 2 * (overall_score['precision_del'] * overall_score['recall_del']) / (overall_score['precision_del'] + overall_score['recall_del'])

    genotype_score = {
        'precision_ins' : genotype_ins_right / predict_ins_sum,
        'precision_del' : genotype_del_right / predict_del_sum,
        'recall_ins' : genotype_ins_right / answer_ins_sum,
        'recall_del' : genotype_del_right / answer_del_sum,
    }
    genotype_score['f1_ins'] = 2 * (genotype_score['precision_ins'] * genotype_score['recall_ins']) / (genotype_score['precision_ins'] + genotype_score['recall_ins'])
    genotype_score['f1_del'] = 2 * (genotype_score['precision_del'] * genotype_score['recall_del']) / (genotype_score['precision_del'] + genotype_score['recall_del'])

    answer_reader.close()
    predict_reader.close()

    return overall_score, genotype_score

print("__________MEHunter____CCS_5x_____________")
ans_path = './simulated_answer.bed'
vcf_path = 'HiFi/MEHunter_Sim_FCCS_UL_5x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

print("__________MEHunter____CCS_10x_____________")
ans_path = './simulated_answer.bed'
vcf_path = 'HiFi/MEHunter_Sim_FCCS_UL_10x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

print("__________MEHunter____CCS_20x_____________")
ans_path = './simulated_answer.bed'
vcf_path = 'HiFi/MEHunter_Sim_FCCS_UL_20x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)


print("__________MEHunter____CCS_30x_____________")
ans_path = './simulated_answer.bed'
vcf_path = 'HiFi/MEHunter_Sim_FCCS_UL_30x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

# print("__________MEHunter____HiFi_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/HIFI/MEHunter_Sim_FHiFi_5x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____HiFi_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/HIFI/MEHunter_Sim_FHiFi_10x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____ONT_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/ONT/MEHunter_Sim_FONT_5x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

print("__________MEHunter____ONT_5x_____________")
ans_path = './simulated_answer.bed'
vcf_path = './results/ONT/MEHunter_Sim_FONT_5x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

print("__________MEHunter____ONT_10x_____________")
ans_path = './simulated_answer.bed'
vcf_path = './results/ONT/MEHunter_Sim_FONT_10x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

print("__________MEHunter____ONT_20x_____________")
ans_path = './simulated_answer.bed'
vcf_path = './results/ONT/MEHunter_Sim_FONT_20x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

print("__________MEHunter____ONT_30x_____________")
ans_path = './simulated_answer.bed'
vcf_path = './results/ONT/MEHunter_Sim_FONT_30x.vcf'

results = merit(ans_path=ans_path, vcf_path=vcf_path)
output_in_format(results)

# print("__________MEHunter____CLR_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/CLR/MEHunter_Sim_FCLR_5x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____CLR_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/CLR/MEHunter_Sim_FCLR_10x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____CLR_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/CLR/MEHunter_Sim_FCLR_20x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________MEHunter____CLR_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/CLR/MEHunter_Sim_FCLR_30x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____CCS_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/SimulateHiFi/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____CCS_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/SimulateHiFi/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____CCS_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/SimulateHiFi/finalfinalresult20x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____CCS_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/SimulateHiFi/finalfinalresult30x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____HiFi_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/HIFI/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____HiFi_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/HIFI/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____ONT_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/ONT/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____ONT_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/ONT/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____ONT_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/ONT/finalfinalresult20x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____ONT_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/ONT/finalfinalresult30x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____CLR_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/CLR/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____CLR_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/CLR/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____CLR_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/CLR/finalfinalresult20x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____CLR_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/CLR/finalfinalresult30x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____NANOPORE_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/NANOPORE/MEHunter_Sim_NANOPORE_5x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____NANOPORE_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/NANOPORE/MEHunter_Sim_NANOPORE_10x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____NANOPORE_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/NANOPORE/MEHunter_Sim_NANOPORE_20x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____NANOPORE_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/NANOPORE/MEHunter_Sim_NANOPORE_30x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________MEHunter____PACBIO_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/PACBIO/MEHunter_Sim_PACBIO_5x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________MEHunter____PACBIO_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/PACBIO/MEHunter_Sim_PACBIO_10x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________MEHunter____PACBIO_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/PACBIO/MEHunter_Sim_PACBIO_20x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________MEHunter____PACBIO_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = './results/PACBIO/MEHunter_Sim_PACBIO_30x.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____NANOPORE_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/NANOPORE/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____NANOPORE_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/NANOPORE/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____NANOPORE_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/NANOPORE/finalfinalresult20x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____NANOPORE_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/NANOPORE/finalfinalresult30x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)


# print("__________rMETL____PACBIO_5x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/PACBIO/finalfinalresult5x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____PACBIO_10x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/PACBIO/finalfinalresult10x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____PACBIO_20x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/PACBIO/finalfinalresult20x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

# print("__________rMETL____PACBIO_30x_____________")
# ans_path = './simulated_answer.bed'
# vcf_path = '/mnt/mybook/Simulated/results/PACBIO/finalfinalresult30x/calling.vcf'

# results = merit(ans_path=ans_path, vcf_path=vcf_path)
# output_in_format(results)

