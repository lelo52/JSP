select custno , custname, phone , address
       , to_char(joindate,'yyyy-mm-dd')
       ,case when grade='A' then 'VIP'
             when grade='B' then '일반'
             when grade='C' then '직원'
        end grade
	       , city from member_tbl_02; 