--------Preferred Gender in a given Industry--------

Begin

--Group industries into five divisions--

--Group 1--

select age, education, industry_code, sex into temp_industry_sex from census_main where industry_code in (select industry_code from census_main group by industry_code having count(*) > 6200 and industry_code!=' Not in universe or children');

--Group age into four divisions--

update temp_industry_sex set age = 18 where age <=18;

update temp_industry_sex set age = 27 where age <=27 and age > 18;

update temp_industry_sex set age = 58 where age <=58 and age > 27;

update temp_industry_sex set age = 65 where age > 58;

--Group education into seven divisions--

update temp_industry_sex set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_industry_sex set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_industry_sex set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_industry_sex set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_industry_sex set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_industry_sex set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_industry_sex set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group education into three divisions--

update temp_industry_sex set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_industry_sex set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree)';

update temp_industry_sex set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Export the data into ‘temp_industry_sex.csv’ file--

--select distinct(industry_code) from temp_industry_sex

--Group 2--

select age, education, industry_code, sex into temp_industry_sex2 from census_main where industry_code in (select industry_code from census_main group by industry_code having count(*) < 6200 and count(*) > 4500);

--Group age into four divisions--

update temp_industry_sex2 set age = 18 where age <=18;

update temp_industry_sex2 set age = 27 where age <=27 and age > 18;

update temp_industry_sex2 set age = 58 where age <=58 and age > 27;

update temp_industry_sex2 set age = 65 where age > 58;

--Group education into seven divisions--

update temp_industry_sex2 set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_industry_sex2 set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_industry_sex2 set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_industry_sex2 set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_industry_sex2 set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_industry_sex2 set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_industry_sex2 set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group education into three divisions--

update temp_industry_sex2 set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_industry_sex2 set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree)';

update temp_industry_sex2 set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Export the data into ‘temp_industry_sex.csv’ file--

--select distinct(industry_code) from temp_industry_sex2

--Group 3--

select age, education, industry_code, sex into temp_industry_sex3 from census_main where industry_code in (select industry_code from census_main group by industry_code having count(*) > 3000 and count(*) < 4500);

--Group age into four divisions--

update temp_industry_sex3 set age = 18 where age <=18;

update temp_industry_sex3 set age = 27 where age <=27 and age > 18;

update temp_industry_sex3 set age = 58 where age <=58 and age > 27;

update temp_industry_sex3 set age = 65 where age > 58;

--Group education into seven divisions--

update temp_industry_sex3 set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_industry_sex3 set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_industry_sex3 set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_industry_sex3 set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_industry_sex3 set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_industry_sex3 set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_industry_sex3 set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group education into three divisions--

update temp_industry_sex3 set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_industry_sex3 set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree)';

update temp_industry_sex3 set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Export the data into ‘temp_industry_sex.csv’ file--

--select distinct(industry_code) from temp_industry_sex3

--Group 4--

select age, education, industry_code, sex into temp_industry_sex4 from census_main where industry_code in (select industry_code from census_main group by industry_code having count(*) > 1000 and count(*) < 3000);

--Group age into four divisions--

update temp_industry_sex4 set age = 18 where age <=18;

update temp_industry_sex4 set age = 27 where age <=27 and age > 18;

update temp_industry_sex4 set age = 58 where age <=58 and age > 27;

update temp_industry_sex4 set age = 65 where age > 58;

--Group education into seven divisions--

update temp_industry_sex4 set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_industry_sex4 set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_industry_sex4 set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_industry_sex4 set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_industry_sex4 set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_industry_sex4 set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_industry_sex4 set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group education into three divisions--

update temp_industry_sex4 set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_industry_sex4 set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree)';

update temp_industry_sex4 set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Export the data into ‘temp_industry_sex.csv’ file--

--select distinct(industry_code) from temp_industry_sex4

--Group 5--

select age, education, industry_code, sex into temp_industry_sex5 from census_main where industry_code in (select industry_code from census_main group by industry_code having count(*) < 1000);

--Group age into four divisions--

update temp_industry_sex5 set age = 18 where age <=18;

update temp_industry_sex5 set age = 27 where age <=27 and age > 18;

update temp_industry_sex5 set age = 58 where age <=58 and age > 27;

update temp_industry_sex5 set age = 65 where age > 58;

--Group education into seven divisions--

update temp_industry_sex5 set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_industry_sex5 set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_industry_sex5 set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_industry_sex5 set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_industry_sex5 set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_industry_sex5 set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_industry_sex5 set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group education into three divisions--

update temp_industry_sex5 set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_industry_sex5 set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree)';

update temp_industry_sex5 set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Export the data into ‘temp_industry_sex.csv’ file--

--select distinct(industry_code) from temp_industry_sex5

End