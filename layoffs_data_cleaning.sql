show databases;
-- to show databases if exists
create database kavya_dB;
-- To create the database
use kavya_dB;
-- project
-- data cleaning
-- import table (layoffs.csv)
select * from layoffs;

-- 1) creating duplicates
select * from layoffs_staging;

-- 2)adding row number
select *, row_number() over(partition by company,location,industry,total_laid_off,percentage_laid_off,`date`,stage,country
,funds_raised_millions) as row_num from layoffs_staging;

select * from layoffs_staging where company='oda';
-- 3)checking duplicates By checking row_number <if greater than 1>
WITH duplicate_cte AS (
    SELECT *, ROW_NUMBER() OVER (PARTITION BY company, location, industry,
		total_laid_off, percentage_laid_off, `date`, stage, country,
		funds_raised_millions) AS row_num
    FROM layoffs_staging
)
SELECT *
FROM duplicate_cte
WHERE row_num > 1;

select * from layoffs_staging where company='Cazoo';
select * from layoffs_staging;

-- deleting duplicate
DELETE FROM layoffs_staging
WHERE row_num > 1;

-- 4)standardizing data
SELECT company,Trim(company) FROM layoffs_staging;

update layoffs_staging set company=trim(company);

select distinct industry from layoffs_staging order by 1;

select * from layoffs_staging where industry like 'Crypto%';

update layoffs_staging set industry='Crypto' where industry like 'Crypto%';

select distinct location from layoffs_staging order by 1;

select distinct country from layoffs_staging
where country like 'United States%'
order by 1;

select country from layoffs_staging order by 1;

select distinct country,trim(trailing '.' from country)
from layoffs_staging order by 1;

Update layoffs_staging
set country=trim(trailing '.' from country)
where country like 'United States%';

-- date formating
select `date` from layoffs_staging;

select `date`, STR_TO_DATE(`date`,'%m/%d/%Y')
from layoffs_staging;

update layoffs_staging set 
`date`=STR_TO_DATE(`date`, '%m/%d/%Y');

alter table layoffs_staging
modify column `date` Date;

-- removing  null or ''
select * from layoffs_staging where
industry IS NULL OR industry='';

-- replacing '' industry with same company
select * from layoffs_staging
where company='Airbnb'; -- 1.travel,2.''->Airbnb

select t1.industry, t2.industry 
from layoffs_staging t1
join layoffs_staging t2
 on t1.company = t2.company
where (t1.industry IS NULL OR t1.industry='')
AND t2.industry IS NOT NULL;

update layoffs_staging t1
join layoffs_staging t2
 on t1.company = t2.company
set t1.industry = t2.industry
where (t1.industry IS NULL OR t1.industry='')
AND t2.industry IS NOT NULL;

-- to check if there is any industry still empty
select * from layoffs_staging
where industry IS NULL
OR industry = '';

-- bally.. is the one which doesnt have other to fill
select * from layoffs_staging
where company like 'bally%';

select * from layoffs_staging;

-- to know for what all total_layid_off and precentage_laid _off is NULL
select * from layoffs_staging
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

-- Deleting them
delete from layoffs_staging
where total_laid_off IS NULL
AND percentage_laid_off IS NULL;

select * from layoffs_staging;

-- droping col from this table
alter table layoffs_staging
drop column row_num;

select * from layoffs_staging;







  




