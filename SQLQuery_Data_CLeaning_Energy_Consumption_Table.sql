select *
from Data_Cleaning_Projects.dbo.Energy_Consumption$

--separate data in multiple columns, by commas

select
SUBSTRING(Entity, 1,Charindex(',',Entity) -1) as Country_or_Continent,
SUBSTRING(Entity, Charindex(',',Entity) +1, 3) as Code,
SUBSTRING(Entity, Charindex(',',substring(Entity,charindex(',',Entity)+1,len(Entity)))+charindex(',',Entity) +1, 4) as Year,
substring(Entity, CHARINDEX(',',Entity,CHARINDEX(',',Entity,CHARINDEX(',',Entity,1)+1)+1)+1,
  LEN(Entity)-CHARINDEX(',',Entity,CHARINDEX(',',Entity,CHARINDEX(',',Entity,1)+1)+1)) as Primary_Energy_Consumption,
--can also be done this way, but it would not work on some other data
SUBSTRING(Entity, Charindex(',',substring(Entity,charindex(',',Entity)+1,len(Entity)))+charindex(',',Entity)+charindex(',',Entity) -6, len(Entity)) as Primary_Energy_Consumption_Other_Way
from Data_Cleaning_Projects.dbo.Energy_Consumption$
