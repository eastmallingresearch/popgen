#!/bin/bash
input=/home/sobczm/popgen/clock/DNA_genomes/promoters
scripts=/home/sobczm/bin/popgen/clock/motif_discovery
meme=/home/sobczm/bin/meme_4.11.2/bin
weeder=/home/sobczm/bin/weeder/weeder2

cd $input
#Repeat-masking of repetitive sequences already done in the downloaded genomes.

#Find known motiffs in N. crassa
#Cbox in frequency promoter. This is a very short motif so first scan frequency
#promoters in target genomes for a similar sequence(s).
#CGAT(N)CCGCT #N: 0-3 bp or more

#extract frequency promoters from all the genomes (extended dataset)

# Use GLAM2Scan


#ACE element in ccg2
#The core ACE sequence binding site (Bell-Pedersen 2001), from -107,
#similar a bit to a sequence in other ccgs (Corrego 2003)
#AACTTGGCCAAGTT
# Use FIMO
$meme/iupac2meme AACTTGGCCAAGTT >core_ace.txt
qsub $scripts/sub_fimo.sh core_ace.txt Neurospora_crassa.NC12.dna_rm.toplevel_promoters_1000.fasta core_ace
#Look for homologous sequences in the cc2 orthologs (extended dataset)
cd $input/extended
grep -A 1 "Bcin02g08360.1" Botrytis_cinerea.ASM83294v1.dna_rm.toplevel_promoters_2000.fasta >freq_botcin.fasta
grep -A 1 "g12281\|g2504\|g7132" Fus2_canu_contigs_hardmasked_upstream2000.fa >freq_fus2.fasta
grep -A 1 "CCT67064" Fusarium_fujikuroi.EF1.dna_rm.toplevel_promoters_2000.fasta >freq_ffuji.fasta
grep -A 1 "CEF76214\|CEF76322\|CEF87174" Fusarium_graminearum.RR.dna_rm.toplevel_promoters_2000.fasta >freq_fgrami.fasta
grep -A 1 "KPA35524\|KPA45422" Fusarium_langsethiae.ASM129263v1.dna_rm.toplevel_promoters_1000.fasta >freq_flang.fasta
grep -A 1 "EKJ75563" Fusarium_pseudograminearum.GCA_000303195.1.dna_rm.toplevel_promoters_2000.fasta >freq_fpseudo.fasta
grep -A 1 "NechaP20803\|NechaP87985" Fusarium_solani.v2.0.dna_rm.toplevel_promoters_2000.fasta >freq_fsol.fasta
grep -A 1 "FVEG_04686T0" Fusarium_verticillioides.ASM14955v1.dna_rm.toplevel_promoters_2000.fasta >freq_fvert.fasta
grep -A 1 "GGTG_05366T0" Gaeumannomyces_graminis.Gae_graminis_V2.dna_rm.toplevel_promoters_2000.fasta >freq_ggram.fasta
grep -A 1 "MGG_17345T0" Magnaporthe_oryzae.MG8.dna_rm.toplevel_promoters_2000.fasta >freq_moryz.fasta
grep -A 1 "MAPG_03751T0" Magnaporthe_poae.Mag_poae_ATCC_64411_V1.dna_rm.toplevel_promoters_2000.fasta>freq_mpoe.fasta
grep -A 1 "KPM44300" Neonectria_ditissima.R0905_v2.0.dna_rm.toplevel_promoters_2000.fasta >freq_ndit.fasta
grep -A 1 "ESA42013\|ESA42014\|ESA42015" Neurospora_crassa.NC12.dna_rm.toplevel_promoters_2000.fasta >freq_ncras.fasta
grep -A 1 "EGO55701" Neurospora_tetrasperma_fgsc_2508.v2.0.dna_rm.toplevel_promoters_2000.fasta >freq_ntetra.fasta
grep -A 1 "CAP64645" Podospora_anserina_s_mat_.ASM22654v1.dna_rm.toplevel_promoters_2000.fasta >freq_podans.fasta
grep -A 1 "ESZ96811" Sclerotinia_borealis_f_4157.SBOR_1.dna_rm.toplevel_promoters_2000.fasta >freq_sbor.fasta
grep -A 1 "CCC09672" Sordaria_macrospora.ASM18280v2.dna_rm.toplevel_promoters_2000.fasta >freq_sormac.fasta
grep -A 1 "EHK43939" Trichoderma_atroviride_imi_206040.TRIAT_v2_0.dna_rm.toplevel_promoters_2000.fasta >freq_tatro.fasta
grep -A 1 "KUE94871\|KUE95921\|KUE95922\|KUE96776" Trichoderma_gamsii.ASM148177v1.dna_rm.toplevel_promoters_2000.fasta >freq_tgam.fasta
grep -A 1 "KKP01354" Trichoderma_harzianum.ASM98886v1.dna_rm.toplevel_promoters_2000.fasta >freq_tharz.fasta
grep -A 1 "EGR49196" Trichoderma_reesei.GCA_000167675.2.dna_rm.toplevel_promoters_2000.fasta >freq_tres.fasta
grep -A 1 "EHK24183" Trichoderma_virens.ASM17099v1.dna_rm.toplevel_promoters_2000.fasta >freq_tvir.fasta
grep -A 1 "EEY17512" Verticillium_alfalfae_vams_102.ASM15082v1.dna_rm.toplevel_promoters_2000.fasta >freq_valf.fasta
grep -A 1 "EGY17172" Verticillium_dahliae.ASM15067v2.dna_rm.toplevel_promoters_2000.fasta >freq_vdah.fasta
grep -A 1 "CRK17585\|CRK26669" Verticillium_longisporum_gca_001268165.vl2.denovo.v1.dna_rm.toplevel_promoters_1000.fasta >freq_vlong.fasta

#The full ACE containing element (68 bp, between -118 and -50 of the cc2 TSS)
#(Bell-Pedersen 2001)
#GAATACCGGAGAACTTGGCCAAGTTTGATGGACGAAGTCTTCAAACACAGCGTTGGATTGAGGTCCAA
# Use FIMO
$meme/iupac2meme GAATACCGGAGAACTTGGCCAAGTTTGATGGACGAAGTCTTCAAACACAGCGTTGGATTGAGGTCCAA >full_ace.txt
qsub $scripts/sub_fimo.sh full_ace.txt Neurospora_crassa.NC12.dna_rm.toplevel_promoters_1000.fasta full_ace
#The top match in NC is located in the protein EAA34064, which is gene NCU08457, which is
#ccg2, which agrees with expectations. It is on plus strand, but situated
#between 767 and 834 bp from the beginning of a 1000 bp promoter, ie.
#between -233 and -166 bp from TSS. This agrees with GFF annotation on Ensembl
#but not with the experimental data (see above). Also, the hit is not perfect but the best by an order of magnitude
#Look for homologous sequences in the cc2 orthologs and this motif

#Look for homologous sequences in the cc2 orthologs (extended dataset)
#Extract the sequences:
cd $input/extended
grep -A 1 "EAQ86779" Chaetomium_globosum_cbs_148_51.ASM14336v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_chglob.fasta
grep -A 1 "EGS22413\|EGS23441" Chaetomium_thermophilum_var_thermophilum_dsm_1495.CTHT_3.0.dna_rm.toplevel_promoters_2000.fasta >ccg2_chthermo.fasta
grep -A 1 "g10946\|g2045" Fus2_canu_contigs_hardmasked_upstream2000.fa >ccg2_fus2.fasta
grep -A 1 "CCT70852" Fusarium_fujikuroi.EF1.dna_rm.toplevel_promoters_2000.fasta >ccg2_ffuji.fasta
grep -A 1 "CEF84703" Fusarium_graminearum.RR.dna_rm.toplevel_promoters_2000.fasta >ccg2_fgrami.fasta
grep -A 1 "KPA37256" Fusarium_langsethiae.ASM129263v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_flang.fasta
grep -A 1 "EKJ72469" Fusarium_pseudograminearum.GCA_000303195.1.dna_rm.toplevel_promoters_2000.fasta >ccg2_fpseudo.fasta
grep -A 1 "NechaP82801\|NechaP82946" Fusarium_solani.v2.0.dna_rm.toplevel_promoters_2000.fasta >ccg2_fsol.fasta
grep -A 1 "FVEG_06538T0" Fusarium_verticillioides.ASM14955v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_fvert.fasta
grep -A 1 "EAA34064" Neurospora_crassa.NC12.dna_rm.toplevel_promoters_2000.fasta >ccg2_ncras.fasta
grep -A 1 "EGO56236" Neurospora_tetrasperma_fgsc_2508.v2.0.dna_rm.toplevel_promoters_2000.fasta >ccg2_ntetra.fasta
grep -A 1 "CAP70492" Podospora_anserina_s_mat_.ASM22654v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_podans.fasta
grep -A 1 "CCC05806" Sordaria_macrospora.ASM18280v2.dna_rm.toplevel_promoters_2000.fasta >ccg2_sormac.fasta
grep -A 1 "AEO68359\|AEO71287" Thielavia_terrestris_nrrl_8126.ASM22611v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_tterr.fasta
grep -A 1 "KKP06303" Trichoderma_harzianum.ASM98886v1.dna_rm.toplevel_promoters_1000.fasta >ccg2_tharz.fasta
grep -A 1 "EHK19749" Trichoderma_virens.ASM17099v1.dna_rm.toplevel_promoters_2000.fasta >ccg2_tvir.fasta
##############################################################

# Genes from Correo et al. (2003)
# A) ACE motif containing
# B) Clockbox motif containing

###############################################################

#Find the protein IDs of Neurospora genes in both lists
#A
pep=/home/sobczm/popgen/clock/pep_genomes
while read name;
do
grep "$name" $pep/Neurospora_crassa.pep.fa
done <$pep/ace_genes_neurospora.txt >protein_ids_ace
cat protein_ids_ace | cut -d">" -f2 | cut -d" " -f1

#B
while read name;
do
grep "$name" $pep/Neurospora_crassa.pep.fa
done <$pep/clockbox_element_neurospora.txt >protein_ids_clockbox
cat protein_ids_clockbox | cut -d">" -f2 | cut -d" " -f1

#Establish the orthogroups containing those genes in each genomes


#Extract the promoters of genes in each set, A) and B) for each species.
