# Homework 1
# 1) count the number of genes on chromosome II ("ch(II"). 
# grep finds all "chrII" in the given file. cut -f 3 take out column 3  on the lines where "chrII" occurs
# and sort direct column 3 to a given file.
#  wc -l couts the number of lines where "gene" occurs on.

grep "chrII" data2/saccharomyces_cerevisiae_R64-2-1_20150113.gff | cut -f 3 | sort > homeworks/group_chrII.txt
grep "gene" homeworks/group_chrII.txt | wc -l

#The answer i got was 681

# 2) Count GC content.
# First sort out only the bases from the file. 
grep -v ">ref" data2/S288C_reference_sequence_R64-2-1_20150113.fsa | sort > homeworks/hw1_ex2_bases
# grep -o finds only the matching parts in the file and return each matching string,
# either A,T,G or C, on a separate line that are either A,T,C or G. 
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
