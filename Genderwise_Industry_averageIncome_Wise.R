#======================2nd Hypothesis==============
  try_hypothesis=sqldf("select P.p_id,(E.wage_phour*40*E.weeks_year)/100000 annual_income_in_terms_of_100K,
                     P.age,P.sex,E.industry_code,P.education,E.occupation_code,M.tax_status,
                     T.Tax_Filer_group_ID from Person P,Employment E , Person_Employed PE ,
                     Monetary M, Person_Monetary PM, tax_filer_status T where 
                     P.p_id=PE.p_id and E.employee_id=PE.employee_id and P.p_id=PM.m_id and 
                     M.m_id=PM.m_id and M.tax_status=T.tax_status and E.wage_phour!=0")

avg_inc=sqldf("select avg(annual_income_in_terms_of_100K) avg_income,sex,industry_code 
              from try_hypothesis group by sex,industry_code order by industry_code")

ggplot(data=avg_inc, aes(x=industry_code,y=avg_income, group=sex, colour=sex)) +
  geom_line() +
  xlab("Industries")+
  ylab("Average Annual Income (Scale 1:100000)")+
  theme(axis.text.x = element_text(angle = 45, hjust = 1))+
  geom_point()
