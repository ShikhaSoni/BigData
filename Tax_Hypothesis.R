# Tax Hypothesis

# Data Creation Script
 setwd("D:/Kaggle/Project Data/Census Data/Final Data/6 CSVs + main data (whole data) CSV")
 Education=read.csv("education.csv",header=TRUE)
 Employment=read.csv("employment.csv",header=TRUE)
 Monetary=read.csv("monetary.csv",header=TRUE)
 Person=read.csv("person.csv",header=TRUE)
 Person_Employed=read.csv("person_employed_ajinkya.csv",header=TRUE)
 Person_Monetary=read.csv("person_monetary.csv",header=TRUE)
 Wholedata_Post_Delete=read.csv("wholedata_post_delete.csv",header=TRUE)
 tax_filer_status=read.csv("tax_filer_status.csv",header=TRUE)
 
 # Tax Hypothesis
 
 try_hypothesis=sqldf("
                      select P.p_id,
                            (E.wage_phour*40*E.weeks_year)/100000 annual_income_in_terms_of_100K,
                            P.age,P.sex,E.industry_code,P.education,E.occupation_code,M.tax_status, T.Tax_Filer_group_ID
                            from 
  						Person P,Employment E , Person_Employed PE , Monetary M , 
                            Person_Monetary PM, tax_filer_status T
                            where 
							P.p_id=PE.p_id and E.employee_id=PE.employee_id 
							and P.p_id=PM.m_id and 
                            M.m_id=PM.m_id and M.tax_status=T.tax_status and
                            E.wage_phour!=0")
 
 tax_hypothesis=sqldf("select 
                        annual_income_in_terms_of_100K annual_income,
                        sex,
                        tax_status,
                        CASE WHEN trim(tax_status)='Single' and annual_income_in_terms_of_100K<2.5 THEN 31000+0.15*(annual_income_in_terms_of_100K*100000) 
                             WHEN trim(tax_status)='Single' and annual_income_in_terms_of_100K>=2.5 THEN 79000+0.4*((annual_income_in_terms_of_100K-2.5)*100000)
                             WHEN trim(tax_status)='Joint both under 65' and annual_income_in_terms_of_100K<2.5 THEN 31000+0.36*(annual_income_in_terms_of_100K*100000) 
  						               WHEN trim(tax_status)='Joint both under 65' and annual_income_in_terms_of_100K>=2.5 THEN 75000+0.396*((annual_income_in_terms_of_100K-2.5)*100000) 
							               WHEN trim(tax_status)='Head of household' and annual_income_in_terms_of_100K<2.5 THEN 33000+0.36*(annual_income_in_terms_of_100K*100000) 
							               WHEN trim(tax_status)='Head of household' and annual_income_in_terms_of_100K>=2.5 THEN 77000+0.396*((annual_income_in_terms_of_100K-2.5)*100000) 
							               WHEN trim(tax_status)='Joint both 65+' and annual_income_in_terms_of_100K<2.5 THEN 16000+0.36*(annual_income_in_terms_of_100K*100000) 
							               WHEN trim(tax_status)='Joint both 65+' and annual_income_in_terms_of_100K>=2.5 THEN 40000+0.396*((annual_income_in_terms_of_100K-2.5)*100000) 
							               WHEN trim(tax_status)='Joint one under 65 & one 65+' and annual_income_in_terms_of_100K<2.5 THEN 31000+0.36*(annual_income_in_terms_of_100K*100000) 
							               WHEN trim(tax_status)='Joint one under 65 & one 65+' and annual_income_in_terms_of_100K>=2.5 THEN 79000+0.396*((annual_income_in_terms_of_100K-2.5)*100000) 
                             ELSE 0
                        END tax 
                        from try_hypothesis")
 

ggplot(tax_hypothesis, aes(x = tax_status, y = tax/1000),fill=sex,col=color) + 
geom_bar(stat = "identity")
 
