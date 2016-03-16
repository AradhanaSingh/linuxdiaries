sed(stream editor)
it's a unix utility that parses and transforms text
it's not BASH specific, but can use sed within bash

cat foo.txt | sed 's/regexp/replacement/g'
or 
sed 's/regexp/replacement/g' foo.txt
#doesn't modify the orginal file, shows the changes in command line
#s means substitute and g means global

sed 's/t/T/' text
#replaces just the first occurence of regular expression in each line

sed 's/t/T/g' text
#replaces just all the occurence of regular expression in each line

sed 's/t/T/g' text > new.txt
#content of new.txt has all t replaced with T, text hasn't been updated 

sed   -i 's/t/T/g' text
#edit it inline, modify the original file, no undo, we can replace but it again using sed 
#not just showing the output, but modifying the file

sed 's/^t/ooo/g' foo.txt
#if line begins with t, no -i , so not updating the current file

sed 's/[^t]/ooo/g' foo.txt
#replace all the matches which are not t, no -i , so not updating the current file
#notice ^ is inside []
#if outside it means starts with it

sed 's/t$/ooo/g' foo.txt
#finds which ends with with t, no -i , does not update the current file

sed -i 's/[0-9]/*/g' foo.txt
#look at all numeric characters replace with *

sed -i 's/[a-z]/*/g' foo.txt

sed -i 's/[A-Z]/*/g' foo.txt

sed -i 's/[a-z][A-Z]/*/g' foo.txt
#look for a look for lowercase followed by an upper case letter

sed -i 's/[a-zA-Z]/*/g' foo.txt
#look for a look for lowercase or an  upper case letter

sed -i 's/[A-z0-9]/*/g' foo.txt
#look for a look for alphabet or digit
#A-Z.. 65,90,a-z 97 to 122, characters from 91 to 96 will also be included
asci 48 to 57, is 0 to 9

sed -i 's/[A-Z]i/*/g' foo.txt
#capital letters followed by an i

sed -i 's/[A-Z]//g' foo.txt
#remove all capital characters

sed 's/10/(10)/g' foo.txt
#add parentheses around 10, but it doesn't add parentheses around other digits

sed 's/[0-9]/(&)/g' foo.txt
#& represents all matched results
#puts parentheses around every digit in the file, but if there are two digits number(10) it will appear like (1)(0)

sed 's/[0-9]/(&)/g' foo.txt
#puts parentheses around every digit in the file

sed 's/[0-9][0-9]/(&)/g' foo.txt
#puts parentheses around every digit in the file, but if there are two digits number(10) it will appear like (1)(0), use following
sed 's/[0-9][0-9]*/(&)/g' foo.txt

sed 's/[0-9][0-9]*/(&)(&)/g' foo.txt
#can use & mutiple times
#& will take the matched string and replace with what we want

sed 's///g' foo.txt
#all / are delimiters

if we want to replace a file containing /(forward slash)
use escape character \ with forward slash

sed 's/\/w/usingescapecharacter/g' foo.txt
#replaces all /w characters with word usingescapecharacter

we can character in sed command
generally we use s///, can use s::: or saaa
whatever character it is , should be used all three times

example 
s:[0-9]:*:g foo.txt
s_[0-9]_*_g foo.txt

sed 's/[^0-9]/*/g' foo.txt
#replace all matches(not digits) with *

sed 's/[a-zA-Z0-9/]/*/g'
#put * in place of alphanumeric characters

sed 's/Twice/None/g' foo.txt | sed 's/Three/Two/g'
or
sed 's/Twice/Thrice/g;s/Three/Two/g' foo.txt
#can combine two sed commands using ;

cat foo.txt | sed 's/regexp/replacement/g'

sed 's/\w*//' text
#remove the firs word but not the spaces
(cross check above)
\w* -- word containing alphanumeric characters, if last word contains symbols(.?:) then won't remove the word
\w - means a word
* - zero or more

sed 's/\w*.//' text
#remove the first word and the spaces
(cross check above)

sed 's/\w*.$//' text
#remove the last word
(cross check above)

sed -n 's///' txt
#-n.. silent

sed -n 's///pg' txt
#-p shows only the lines which match
#can be used instead of grep

sed 's///Ig' text
# I for ignoring the case

can make a file, script

s/T/t/g
s/e/E/g
s/\w*.//

sed -f script foo.txt
#just modifies the output, not the file

sed 's/\bnew\b/old/g' text2
#to find bounds of a word, find the whole word

sed '/new/d' text2
or
sed '/new/D' text2
#every line with word "new" is removed

sed '/new$/D' text2
#if new is at the end of the line, remove the line
