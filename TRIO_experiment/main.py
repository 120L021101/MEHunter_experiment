father_path = 'HG00731/MEHunter_HiFi.vcf'
mother_path = 'HG00732/MEHunter_HiFi.vcf'
child_path = 'HG00733/MEHunter_HiFi.vcf'

def load(f_path, m_path, c_path):
    family_variants = []
    with open(file=f_path, mode='r', encoding='utf-8') as f_loader:
        for line in f_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            family_variants.append(
                {
                    'chr' : choromosome,
                    'pos' : pos,
                    'father' : genotype,
                    'mother' : '0/0',
                    'child' : '0/0'
                }
            )
    with open(file=m_path, mode='r', encoding='utf-8') as m_loader:
        for line in m_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            found = False
            for variant in family_variants:
                if variant['chr'] != choromosome:
                    continue
                if abs(pos - variant['pos']) >= 200:
                    continue
                variant['mother'] = genotype
                found = True
                break
            if not found:
                family_variants.append(
                    {
                        'chr' : choromosome,
                        'pos' : pos,
                        'father' : '0/0',
                        'mother' : genotype,
                        'child' : '0/0'
                    }
                )

    with open(file=c_path, mode='r', encoding='utf-8') as c_loader:
        for line in c_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            found = False
            for variant in family_variants:
                if variant['chr'] != choromosome:
                    continue
                if abs(pos - variant['pos']) >= 200:
                    continue
                variant['child'] = genotype
                found = True
                break
            if not found:
                family_variants.append(
                    {
                        'chr' : choromosome,
                        'pos' : pos,
                        'father' : '0/0',
                        'mother' : '0/0',
                        'child' : genotype
                    }
                )
    return family_variants

def merit(family_variants):
    wrong = 0; right = 0
    predict_sum = 0; predict_sum2 = len(family_variants)
    for family_variant in family_variants:
        if family_variant['child'] != '0/0':
            predict_sum += 1

    for item in family_variants:
        child_g = item['child']
        father_g = item['father']
        mother_g = item['mother']
        if (child_g != '0/0' and (father_g == '0/0' and mother_g == '0/0')):
            wrong += 1

        child_gs = child_g.split('/')
        if (child_gs[0] in father_g and child_gs[1] in mother_g) or \
            (child_gs[0] in mother_g and child_gs[1] in father_g):
            right += 1
        # else:
            # print(item)

    return wrong / predict_sum, predict_sum, 1 - right / predict_sum2

def load_acc_type(f_path, m_path, c_path):
    family_variants_INS = []; family_variants_DEL = []
    with open(file=f_path, mode='r', encoding='utf-8') as f_loader:
        for line in f_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            if 'INS' in line:
                family_variants_INS.append(
                    {
                        'chr' : choromosome,
                        'pos' : pos,
                        'father' : genotype,
                        'mother' : '0/0',
                        'child' : '0/0'
                    }
                )
            else:
                family_variants_DEL.append(
                    {
                        'chr' : choromosome,
                        'pos' : pos,
                        'father' : genotype,
                        'mother' : '0/0',
                        'child' : '0/0'
                    }
                )
    with open(file=m_path, mode='r', encoding='utf-8') as m_loader:
        for line in m_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            if 'INS' in line:
                found = False
                for variant in family_variants_INS:
                    if variant['chr'] != choromosome:
                        continue
                    if abs(pos - variant['pos']) >= 200:
                        continue
                    variant['mother'] = genotype
                    found = True
                    break
                if not found:
                    family_variants_INS.append(
                        {
                            'chr' : choromosome,
                            'pos' : pos,
                            'father' : '0/0',
                            'mother' : genotype,
                            'child' : '0/0'
                        }
                    )
            elif 'DEL' in line:
                found = False
                for variant in family_variants_DEL:
                    if variant['chr'] != choromosome:
                        continue
                    if abs(pos - variant['pos']) >= 200:
                        continue
                    variant['mother'] = genotype
                    found = True
                    break
                if not found:
                    family_variants_DEL.append(
                        {
                            'chr' : choromosome,
                            'pos' : pos,
                            'father' : '0/0',
                            'mother' : genotype,
                            'child' : '0/0'
                        }
                    )

    with open(file=c_path, mode='r', encoding='utf-8') as c_loader:
        for line in c_loader:
            if line.startswith('#'):
                continue
            if not ('INS' in line or 'DEL' in line):
                continue
            info_ls = line.strip().split('\t')
            choromosome = info_ls[0]
            pos = int(info_ls[1])
            genotype = '1/1' if '1/1' in line else '0/1'
            if 'INS' in line:
                found = False
                for variant in family_variants_INS:
                    if variant['chr'] != choromosome:
                        continue
                    if abs(pos - variant['pos']) >= 200:
                        continue
                    variant['child'] = genotype
                    found = True
                    break
                if not found:
                    family_variants_INS.append(
                        {
                            'chr' : choromosome,
                            'pos' : pos,
                            'father' : '0/0',
                            'mother' : '0/0',
                            'child' : genotype
                        }
                    )
            elif 'DEL' in line:
                found = False
                for variant in family_variants_DEL:
                    if variant['chr'] != choromosome:
                        continue
                    if abs(pos - variant['pos']) >= 200:
                        continue
                    variant['child'] = genotype
                    found = True
                    break
                if not found:
                    family_variants_DEL.append(
                        {
                            'chr' : choromosome,
                            'pos' : pos,
                            'father' : '0/0',
                            'mother' : '0/0',
                            'child' : genotype
                        }
                    )

    return family_variants_INS, family_variants_DEL

family_variants_INS, family_variants_DEL = load_acc_type(father_path, mother_path, child_path)
MDR_rate_INS, ins_num, _ = merit(family_variants_INS); MDR_rate_DEL, del_num, _ = merit(family_variants_DEL)
print("INCONSISTENT INSERTION AND CONSISTENT INSETION, NUMBER")
print(ins_num * MDR_rate_INS, ins_num * (1 - MDR_rate_INS))
print("INCONSISTENT DELETION AND CONSISTENT DELETION, NUMBER")
print(del_num * MDR_rate_DEL, del_num * (1 - MDR_rate_DEL))
print("TOTAL MDR, INS MDR, DEL MDR")
print((MDR_rate_DEL * del_num + MDR_rate_INS * ins_num) / (del_num + ins_num), MDR_rate_INS, MDR_rate_DEL)
