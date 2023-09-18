delete from @target_database_schema.@target_cohort_table where cohort_definition_id in (201100006, 301100006);

insert into @target_database_schema.@target_cohort_table
select 201100006 as cohort_definition_id, c2.subject_id, c2.cohort_start_date, c2.cohort_end_date
from @target_database_schema.@target_cohort_table c
join @target_database_schema.@target_cohort_table c2 on c.subject_id = c2.subject_id
and c.cohort_definition_id = 201100000 and c2.cohort_definition_id = 6
where c.cohort_start_date<=c2.cohort_start_date
;

insert into @target_database_schema.@target_cohort_table
select 301100006 as cohort_definition_id, c2.subject_id, c2.cohort_start_date, c2.cohort_end_date
from @target_database_schema.@target_cohort_table c
join @target_database_schema.@target_cohort_table c2 on c.subject_id = c2.subject_id
and c.cohort_definition_id = 301100000 and c2.cohort_definition_id = 6
where c.cohort_start_date<=c2.cohort_start_date
;