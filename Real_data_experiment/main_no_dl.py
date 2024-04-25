def turn(f):
    return int(f * 10000) / 100

def is_the_same(variant1, variant2):
    #rule 1
    max_val = max(variant1[1] - 1000, variant2[1])
    min_val = min(variant1[2] + 1000, variant2[2])
    if (max_val > min_val):
        return False

    # rule 2
    return min(variant1[3], variant2[3]) / max(variant1[3], variant2[3]) >= 0.6


def judge(answer, predict):
    # print(answer)
    right = 0
    genotype_right = 0
    predict_sum = len(predict)
    answer_sum = len(answer)

    for predict_item in predict:
        for answer_item in answer:
            if predict_item[0] != answer_item[0]: # chromosome must be the same
                continue
            if is_the_same(predict_item, answer_item):
                right += 1
                if predict_item[-1] == answer_item[-1]:
                    # print(answer_item, predict_item)
                    genotype_right += 1
                break
        # if not find:
        #     print(predict_item)

    precision = right / predict_sum
    recall = right / answer_sum
    f1 = 2 * precision * recall / (precision + recall)
    
    genotype_precision = genotype_right / predict_sum
    genotype_recall = genotype_right / answer_sum
    genotype_f1 = 2 * genotype_precision * genotype_recall / (genotype_precision + genotype_recall)

    print(right)

    return turn(precision), turn(recall), turn(f1), turn(genotype_precision), turn(genotype_recall), turn(genotype_f1)


input_files = [
        'HiFi/5x/MEHunter.vcf',
        'HiFi/10x/MEHunter.vcf',
        'HiFi/15x/MEHunter.vcf',
        'HiFi/30x/MEHunter.vcf', 
        'HiFi/finalfinalresult5x/calling.vcf',
        'HiFi/finalfinalresult10x/calling.vcf',
        'HiFi/finalfinalresult15x/calling.vcf',
        'HiFi/finalfinalresult30x/calling.vcf',  
        'ONT/5x/MEHunter.vcf',
        'ONT/10x/MEHunter.vcf',
        'ONT/15x/MEHunter.vcf',
        'ONT/30x/MEHunter.vcf', 
        'ONT/finalfinalresult5x/calling.vcf',
        'ONT/finalfinalresult10x/calling.vcf',
        'ONT/finalfinalresult15x/calling.vcf',
        'ONT/finalfinalresult30x/calling.vcf', 
        'CLR/5x/MEHunter.vcf',
        'CLR/10x/MEHunter.vcf',
        'CLR/15x/MEHunter.vcf',
        'CLR/30x/MEHunter.vcf', 
        'CLR/finalfinalresult5x/calling.vcf',
        'CLR/finalfinalresult10x/calling.vcf',
        'CLR/finalfinalresult15x/calling.vcf',
        'CLR/finalfinalresult30x/calling.vcf', 
    ]

for file_path in input_files:
    ins_answer_files = [
        '../Real_data_answer/ins_washed_genotype.txt',
        '../Real_data_answer/ins_washed_precise_genotype.txt',
        '../Real_data_answer/ins_washed_poly_genotype.txt',
        '../Real_data_answer/ins_washed_major_genotype.txt',
        '../Real_data_answer/ins_washed_shared_genotype.txt',
        '../Real_data_answer/ins_washed_single_genotype.txt',
    ]
    del_answer_files = [
        '../Real_data_answer/del_washed_genotype.txt',
        '../Real_data_answer/del_washed_precise_genotype.txt',
        '../Real_data_answer/del_washed_poly_genotype.txt',
        '../Real_data_answer/del_washed_major_genotype.txt',
        '../Real_data_answer/del_washed_shared_genotype.txt',
        '../Real_data_answer/del_washed_single_genotype.txt',
    ]
    for idx, (ins_answer_file, del_answer_file) in enumerate(zip(ins_answer_files, del_answer_files)):
        ins_answer_reader = open(file=ins_answer_file, mode='r', encoding='utf-8')
        del_answer_reader = open(file=del_answer_file, mode='r', encoding='utf-8')

        ins_answer = []
        del_answer = []
        for line in ins_answer_reader:
            info_ls = line.strip().split('\t')
            ins_answer.append((info_ls[0], int(info_ls[1]), int(info_ls[2]), int(info_ls[3]), info_ls[4]))
            # print(ins_answer[-1])
        for line in del_answer_reader:
            info_ls = line.strip().split('\t')
            del_answer.append((info_ls[0], int(info_ls[1]), int(info_ls[2]), int(info_ls[3]), info_ls[4]))

        predict_loader = open(file=file_path, mode='r', encoding='utf-8')
        ins_predict = []
        del_predict = []
        for line in predict_loader:
            if line.startswith('#'): continue
            if 'High_Quality' not in line: continue
            info_ls = line.strip().split('\t')
            genotype = info_ls[-1].split(':')[0]
            if genotype != '1/1':
                genotype = '0/1'
            if 'MEHunter' in file_path or 'cuteSV' in file_path:
                sv_length = len(info_ls[4]) if 'INS' in line else len(info_ls[3])
            else:
                sv_length = int(line.split('SVLEN=')[1].split(';')[0])
            info_ls = [info_ls[0], int(info_ls[1]), int(info_ls[1]) + (1 if 'INS' in line else sv_length), sv_length, genotype]
            if 'INS' in line:
                ins_predict.append(info_ls)
            if 'DEL' in line:
                del_predict.append(info_ls)
        print(file_path, ins_answer_file.replace('_washed', ''), del_answer_file.replace('_washed', ''))
        print(len(ins_predict), len(del_predict))
        print(judge(ins_answer, ins_predict))
        print(judge(del_answer, del_predict))
        print()

