select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
 a.rec_vol, a.emp_type, a.rec_edu, a.anno_title, 
d.comm_ctx as 직군 , e.comm_ctx as 경력, f.comm_ctx as 고용형태
from Company c 
left outer join Announce a
on c.com_id=a.com_id
left outer join (select sub_cat,comm_ctx
            from comm 
            where main_cat = 001) d
on a.job_tag=d.sub_cat
left outer join (select sub_cat,comm_ctx
            from comm 
            where main_cat = 070) e
on a.career=e.sub_cat  
left outer join (select sub_cat,comm_ctx
                 from comm 
                 where main_cat = 071) f
on a.emp_type=f.sub_cat    
where c.com_name  like '%백엔드%'
or a.anno_title like '%백엔드%'
;