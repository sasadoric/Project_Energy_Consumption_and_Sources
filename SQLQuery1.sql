select *
from Data_Cleaning_Projects..Energy_Consumption
order by Country

select *
from Data_Cleaning_Projects..Renewable_share_Energy

select Country, Count_code, EC.Year, [Primary_Energy_Consumption (TWh)], [Renewables (% equivalent primary energy)]
from Data_Cleaning_Projects..Energy_Consumption EC
join 
Data_Cleaning_Projects..Renewable_share_Energy RSE
on EC. Country=RSE.Entity
order by EC.Country

select Country, Count_code, Year, MAX([Primary_Energy_Consumption (TWh)]) Max_Yearly_Consump
from Data_Cleaning_Projects..Energy_Consumption EC
group by Country, Count_code, Year
order by Max_Yearly_Consump desc
