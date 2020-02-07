# Homework 1
# 1) count the number of genes on chromosome II ("ch(II"). 
# grep finds all "chrII" followed by a tab, in the given file. sort direct the output to a given file in sorted order.
#  wc -l couts the number of lines where "gene" occurs on.
grep "chrII$(printf '\t')" data2/saccharomyces_cerevisiae_R64-2-1_20150113.gff | sort > homeworks/group_chrII.txt 
grep "gene" homeworks/group_chrII.txt | wc -l
# returns: 485

# 2) Count GC content.
# First sort out only the bases from the file, using grep -v that returns the file without the lines that contain the matching sequence.
grep -v ">ref" data2/S288C_reference_sequence_R64-2-1_20150113.fsa | sort > homeworks/hw1_ex2_bases
# grep -o finds only the matching parts in the file and return each matching string, on separate lines.
# in this case, either A,T,G or C.
grep -o "A\|T\|C\|G" homeworks/hw1_ex2_bases | wc -l
# returns: 12157105
# counts C's and G's in the same way as above
grep -o "C\|G" homeworks/hw1_ex2_bases | wc -l
# returns :4637676
# Using bc the precentage of GC content is calculated to 0.38147865

#3a)
# compare GC content in this file with the value in task 2) above
# The method used is the same as in 2) except that no intermediate file is created, 
# instead grep -o is used on the output directly.
grep -v ">" Y55_JRIF00000000_SGD_cds.fsa |grep -o "C\|G" | wc -l
# returns: 3191935
grep -v ">" Y55_JRIF00000000_SGD_cds.fsa |grep -o "A\|T\|G\|C" | wc -l
# returns: 8073830
# Using bc the percentage of GC content is calculated to 0.39534335, very close to the value in 2).

#3b)
# Counting all lines with ">" in the  reference genome, this will be equal to all ORFs.
grep ">" data2/orf_coding_all_R64-2-1_20150113.fasta | wc -l
# returns: 6713
# Counting all lines with ">" in the Y55 genome, this will be equal to number of ORFs.
grep ">" Y55_JRIF00000000_SGD_cds.fsa | wc -l
# returns: 5330

#3c)
# Counting the number of common ORFs between Y55 and the reference.
# sed "s/ .*//" replaces " .*" with "". Meaning that Everything from " " and forward replaces by nothing. All genes named UNDEF will also be ignored. 
# This result in that only the gene identifier will be saved in the result file.
grep ">" data2/orf_coding_all_R64-2-1_20150113.fasta | sed "s/ .*//" | grep -v ">UNDEF" | sort > homeworks/hw1_3C_genes_reference
grep ">" Y55_JRIF00000000_SGD_cds.fsa | sed "s/_.*//" | grep -v ">UNDEF" | sort > homeworks/hw1_3C_genes_Y55
# comm -12 returns all lines that file_1 and file_2 have in common. And these lines are then counted, giving the number of commonORFs.
comm -12 homeworks/hw1_3C_genes_reference homeworks/hw1_3C_genes_Y55 | wc -l
# returns: 5168
