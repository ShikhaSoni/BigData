--------Employment Status--------
begin

--Extract attributes from Person relation

select education, age, sex, citizenship, marital_status, unemployment_reason as employment_status into temp_unemployment_reason from person where unemployment_reason!=' Not in universe';

--Group the ages into four divisions

update temp_unemployment_reason set age = 18 where age <=18;

update temp_unemployment_reason set age = 27 where age <=27 and age > 18;

update temp_unemployment_reason set age = 58 where age <=58 and age > 27;

update temp_unemployment_reason set age = 65 where age > 58;

--Group the education into seven divisions

update temp_unemployment_reason set education = 'Pre School-Kindergarten' where education = ' Less than 1st grade';

update temp_unemployment_reason set education = 'Elementary School (1st-4th grade)' where education = ' 1st 2nd 3rd or 4th grade';

update temp_unemployment_reason set education = 'Middle School (5th-8th grade)' where education = ' 5th or 6th grade' or education = ' 7th and 8th grade';

update temp_unemployment_reason set education = 'High School (9th-12th grade)' where education = ' 9th grade' or education = ' High school graduate' or education = ' 10th grade' or education = ' 12th grade no diploma' or education = ' 11th grade' ;

update temp_unemployment_reason set education = 'College or University (Bachelor''s Degree)' where education = ' Bachelors degree(BA AB BS)' or education = ' Some college but no degree';

update temp_unemployment_reason set education = 'College or University (Master''s-Doctorate Degree)' where education = ' Masters degree(MA MS MEng MEd MSW MBA)' or education = ' Doctorate degree(PhD EdD)' or education = ' Prof school degree (MD DDS DVM LLB JD)';

update temp_unemployment_reason set education = 'Vocational-Associates Degree' where education = ' Associates degree-academic program' or education = ' Associates degree-occup /vocational';

--Group the education into three divisions

update temp_unemployment_reason set education = 'School Level' where education = 'Pre School-Kindergarten' or education = 'Elementary School (1st-4th grade)' or education = 'Middle School (5th-8th grade)' or education = 'High School (9th-12th grade)' ;

update temp_unemployment_reason set education = 'Bachelor''s Degree' where education = 'College or University (Bachelor''s Degree)' or education = 'Vocational-Associates Degree';

update temp_unemployment_reason set education = 'Master''s-Doctorate Degree' where education = 'College or University (Master''s-Doctorate Degree)';

--Group the marital status into two divisions

update temp_unemployment_reason set marital_status = 'Married' where marital_status = ' Married-A F spouse present' or marital_status = ' Married-civilian spouse present' or marital_status = ' Married-spouse absent';

update temp_unemployment_reason set marital_status = 'Unmarried' where marital_status = ' Divorced' or marital_status = ' Separated' or marital_status = ' Never married' or marital_status = ' Widowed';

--Group the citizenship into two divisions

update temp_unemployment_reason set citizenship = 'US Citizen' where citizenship=' Foreign born- U S citizen by naturalization' or citizenship=' Native- Born in the United States' or citizenship=' Native- Born abroad of American Parent(s)';

update temp_unemployment_reason set citizenship = 'Not a US Citizen' where citizenship=' Foreign born- Not a citizen of U S ' or citizenship=' Native- Born in Puerto Rico or U S Outlying';

--Group the employment reason into two divisions————

update temp_unemployment_reason set employment_status = 'Unemployed' where employment_status<>' Re-entrant' and employment_status<>' New entrant';

update temp_unemployment_reason set employment_status = 'Employed' where employment_status=' Re-entrant' or employment_status=' New entrant';

update temp_unemployment_reason set employment_status = 'Unemployed' where age <=18 or age>=65 ;

end
