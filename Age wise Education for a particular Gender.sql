--------Age wise Education for a particular Gender--------

Begin

--Extract sex, education and age from Person--

select sex, education, age into temp_education_analysis from Person;

--Divide age into four groups--

update temp_education_analysis set age = 18 where age <=18;

update temp_education_analysis set age = 27 where age <=27 and age > 18;

update temp_education_analysis set age = 58 where age <=58 and age > 27;

update temp_education_analysis set age = 65 where age > 58;

--Divide education into seven groups--

update temp_education_analysis set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_education_analysis set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_education_analysis set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_education_analysis set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_education_analysis set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_education_analysis set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_education_analysis set education = 'Vocational-Associates Degree)' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--To generate CSV file--

--select * from temp_education_analysis

End