#!/bin/bash

# Info about my computer science students from students database

echo -e "\n~~ My Computer Science Students ~~\n"

PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"

echo -e "\nFirst name, last name, and GPA of students with a 4.0 GPA:"

echo "$($PSQL "select first_name, last_name, gpa from students where gpa = 4.0;")"

echo -e "\nAll course names whose first letter is before 'D' in the alphabet:"

echo "$($PSQL "select course from courses where course < 'D';")"

echo -e "\nFirst name, last name, and GPA of students whose last name begins with an 'R' or after and have a GPA greater than 3.8 or less than 2.0:"

echo "$($PSQL "select first_name, last_name, gpa from students where last_name >= 'R' and (gpa > 3.8 or gpa < 2.0)")"

echo -e "\nLast name of students whose last name contains a case insensitive 'sa' or have an 'r' as the second to last letter:"

echo "$($PSQL "select last_name from students where last_name ilike '%sa%' or last_name like '%r_' ")"

echo -e "\nFirst name, last name, and GPA of students who have not selected a major and either their first name begins with 'D' or they have a GPA greater than 3.0:"

echo "$($PSQL "select first_name, last_name, gpa from students where major_id is null and (first_name like 'D%' or gpa > 3.0)")"

echo -e "\nCourse name of the first five courses, in reverse alphabetical order, that have an 'e' as the second letter or end with an 's':"

echo "$($PSQL "select course from courses where course ilike '_e%' or course ilike '%s' order by course DESC limit 5 ")"

echo -e "\nAverage GPA of all students rounded to two decimal places:"

echo "$($PSQL " select round(avg(gpa),2) from students;")"

echo -e "\nMajor ID, total number of students in a column named 'number_of_students', and average GPA rounded to two decimal places in a column name 'average_gpa', for each major ID in the students table having a student count greater than 1:"




