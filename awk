awk
(a field processor, processes each field in line, unlike grep which return the whole line)

awk '{ print }' test.text
#returns every line

awk ' { print $1 } ' test.txt 
#prints first column
#by default delimiter is white space

awk ' { print $2 } ' test.txt 
#if no column 2 for few lines, return nothing

awk ' { print $1,$2 } ' test.txt 
#print both the columns, output will be separated by space

awk ' { print $1.$2 } ' test.txt 
#print both the columns, output will be concatenated

awk '/Test/ { print }' test.txt
#can use regular expression , print all line which have Test

awk '/[a-z]/ { print }' test.txt
#gets all lines which contains at least one lowercase letter

awk '/^[0-9]/ { print }' test.txt
#gets all lines which starts with a digit

can do if conditionals
awk '{ if($1 ~ /123/) print  }' test.txt

awk '{ if($2 ~ /[0-9]/)  print }' test.txt

Example: To find the process with highest memory and cpu utilization 
top -b > filename
# redirecting the output to a file

awk '{ if ($1 == 1) print $12}' filename
# to find the process with highest memory and cpu utilization


grep -i test test.txt | awk '/[0-9]/ { print }' 

awk '{print $2}' test.txt

awk -F: '{print $2}' test.txt
#overiding default delimiter white space by :

#regular expression in awk needs to be within \\
#{} braces mean that it should be executed for each line in the output
# NF - special variable which contains numbr of fields in the current line
Last field can be printed using $NF , for field second to last can use $(NF-2)
# NR - special variable which is the row number being currently processed. 
# prints line number followed by closing parentheses
awk '{print NR ") " $1}' logs.txt

http://gregable.com/2010/09/why-you-should-know-just-little-awk.html
