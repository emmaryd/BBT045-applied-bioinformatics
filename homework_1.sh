# Homework 1
# 1) count the number of genes on chromosome II ("ch(II"). 
# grep finds all "chrII" in the given file. cut -f 3 take out column 3  on the lines where "chrII" occurs
# and sort direct column 3 to a given file.
#  wc -l couts the number of lines where "gene" occurs on.

grep "chrII" data2/saccharomyces_cerevisiae_R64-2-1_20150113.gff | cut -f 3 | sort > homeworks/group_chrII.txt
grep "gene" homeworks/group_chrII.txt | wc -l

#The answer i got was 681
