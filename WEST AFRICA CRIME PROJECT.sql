SELECT TOP (1000) [GTID]
      ,[DATE]
      ,[COUNTRY]
      ,[CITY]
      ,[PERPETRATOR]
      ,[FATALITIES]
      ,[INJURED]
      ,[TARGET TYPE]
      ,[ATTACK TYPE]
  FROM [west_africa_crime].[dbo].[crime$]



  --select distinct(COUNTRY), distinct(fatalities), c(injured)
  --from west_africa_crime..crime
  --group by COUNTRY


  alter table west_africa_crime..crime
  alter column FATALITIES INT;

   alter table west_africa_crime..crime
  alter column INJURED INT;

  UPDATE crime
  SET FATALITIES = REPLACE(FATALITIES, 'Unknown', 0)

   UPDATE crime
  SET INJURED = REPLACE(INJURED, 'Unknown', 0)


  --MOST FATALITY/DEATH BY PERPETRATORS
   select TOP (15)(PERPETRATOR), SUM(FATALITIES) AS 'MOST FATALITIES_BY_PERPERTRATOR'
  from west_africa_crime..crime
  GROUP BY PERPETRATOR
  order by 2 DESC

  --TOP 15 MOST INJURED BY PERPETRATOR
    select TOP (15) (PERPETRATOR), SUM(INJURED) AS 'MOST INJURED_BY_PERPERTRATOR'
  from west_africa_crime..crime
  GROUP BY PERPETRATOR
  ORDER BY 2 DESC

  --TOP 15 MOST INJURIES IN A SINGLE YEAR
  select TOP (15) (DATE), SUM(INJURED) AS 'MOST INJURED_BY_DATE'
  from west_africa_crime..crime
  GROUP BY DATE
  ORDER BY 2 DESC


  --TOP 15 MOST FATALITIES IN A SINGLE YEAR
  select TOP (15) (DATE), SUM(FATALITIES) AS 'MOST FATALITIES_BY_DATE'
  from west_africa_crime..crime
  GROUP BY DATE
  ORDER BY 2 DESC


  select *
  from west_africa_crime..crime
  where PERPETRATOR = 'Boko Haram'
  order by FATALITIES desc

  --THIS HIGHLIGHTS THE MOST USED ATTACK TYPE BY THE MOST DANGEROUS ARMED GROUP SINCE 1974
  select [ATTACK TYPE], count([ATTACK TYPE]) as 'MOST USED ATTACK TYPE'
  from west_africa_crime..crime
  where PERPETRATOR = 'Boko Haram'
  group by [ATTACK TYPE]
  order by [MOST USED ATTACK TYPE] DESC


  --THIS HIGHLIGHTS THE MOST TARGETED PERSONS OR GROUP BY THE MOST DANGEROUS ARMED GROUP (BOKO HARAM) SINCE 1974
    select [TARGET TYPE], count([TARGET TYPE]) as 'BOKO_HARAM MOST_TARGETED'
  from west_africa_crime..crime
  where PERPETRATOR = 'Boko Haram'
  group by [TARGET TYPE]
  order by [BOKO_HARAM MOST_TARGETED] DESC


  select distinct([TARGET TYPE]), count([TARGET TYPE]) as 'MOST_TARGETED'
  from west_africa_crime..crime
  group by [TARGET TYPE]
  order by MOST_TARGETED desc
  --where 
  --order by FATALITIES desc


  --THIS IS THE MAXIMUM DAILY DEATH BY CITY. ALSO SHOWING COUNTRY & PERPETRATOR
   select CITY, MAX(fatalities) as 'MAXIMUM DAILY DEATH BY CITY',COUNTRY,PERPETRATOR
  from west_africa_crime..crime
  group by city, COUNTRY, PERPETRATOR
  order by [MAXIMUM DAILY DEATH BY CITY] desc


    select CITY, MAX(INJURED) as 'MAXIMUM DAILY INJURED BY CITY ',COUNTRY,PERPETRATOR
  from west_africa_crime..crime
  group by city, COUNTRY, PERPETRATOR
  order by [MAXIMUM DAILY INJURED BY CITY ] desc


  
  --THIS IS THE TOP 15 MOST ATTACKED CITY BY BOKO HARAM AND FATALITIES
  select TOP (15) CITY, COUNT(CITY) AS 'MOST_ATTACKED_CITY_BY_BOKO HARAM', SUM(FATALITIES) AS 'TOTAL DEATH'
  from west_africa_crime..crime
  WHERE PERPETRATOR = 'BOKO HARAM'
  GROUP BY CITY
  --HAVING COUNT(CITY) > 40
  ORDER BY [MOST_ATTACKED_CITY_BY_BOKO HARAM] DESC



  --MOST USED ATTACK TYPE IN WEST AFRICA
   select [ATTACK TYPE], count([ATTACK TYPE]) as 'MOST USED ATTACK TYPE IN WEST AFRICA'
  from west_africa_crime..crime
 -- where PERPETRATOR = 'Boko Haram'
  group by [ATTACK TYPE]
  order by [MOST USED ATTACK TYPE IN WEST AFRICA] DESC



  --MOST TARGETED IN WEST AFRICA
     select [TARGET TYPE], count([TARGET TYPE]) as 'MOST TARGETED IN WEST AFRICA'
  from west_africa_crime..crime
 -- where PERPETRATOR = 'Boko Haram'
  group by [TARGET TYPE]
  order by [MOST TARGETED IN WEST AFRICA] DESC



  -- select *,(MAX(FATALITIES)/SUM(FATALITIES))*100
  --from west_africa_crime..crime
  --GROUP BY GTID, DATE, COUNTRY, CITY, PERPETRATOR, FATALITIES, INJURED, [TARGET TYPE], [ATTACK TYPE]
  --HAVING FATALITIES > 0



  select *
  from west_africa_crime..crime
  WHERE CITY LIKE 'l%a%g%'

  update west_africa_crime..crime
  set city = REPLACE(city, 'Lagoa', 'Lagos' )
  
  select *
  from west_africa_crime..crime
  WHERE CITY = 'Lagoa'


  --GROUP WITH THE MOST RECORD FOR ASSINATION IN WEST AFRICA. SADLY MORE THAN 200 ARE STIL UNKNOWN
  select PERPETRATOR, count([ATTACK TYPE])
  from west_africa_crime.dbo.crime
  where [ATTACK TYPE] = 'Assassination'
  group by PERPETRATOR, [ATTACK TYPE]
  order by 2 desc


  select *
  from west_africa_crime..crime



