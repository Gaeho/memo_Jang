--1번 comm에서 특정 분류만 골라냄
select main_cat, sub_cat, comm_ctx
from comm
where main_cat=001 or main_cat=070 or main_cat=071;


--2번 Company에 Announce를 lefter O.J함(기준)
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title
from Company c 
left outer join Announce a
on c.com_id=a.com_id;


--3번 2번에 3번을 조인하여 고용형태의 내용을 보여줌(comm을 그냥 조인함)
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as 고용형태
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join comm c
on a.emp_type=c.sub_cat and c.main_cat=071
;

--3번-2 2번에 1번을 서브쿼리로 조인하여 고용형태의 내용을 보여줌(comm이 들어갈 자리에 (1번)의 형태로 들어감)->3번과 동일한 결과 도출
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as 고용형태
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join (select main_cat, sub_cat, comm_ctx
            from comm
            where main_cat=001 or main_cat=070 or main_cat=071) c
on a.emp_type=c.sub_cat and c.main_cat=071
;




--5번 3번에 또다시 comm을 조인 시키려고 했으나 실패함
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as 고용형태, d.comm_ctx as 경력사항
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join comm c
on a.emp_type=c.sub_cat and c.main_cat=071
join comm d
on a.career=d.sub_cat and c.main_cat=070;

--가설 특정 main_cat으로 검색한 결과를 innerjoin한다면? 이너조인x3
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, d.comm_ctx
from Company c 
left outer join Announce a
on c.com_id=a.com_id
left outer join (select *
            from comm 
            where main_cat = 001) d
on a.job_tag=d.sub_cat; 
--성공

--comm에서 main_cat이 001인 것
select sub_cat,comm_ctx
from comm 
where main_cat = 001;
--comm에서 main_cat이 070인 것
select sub_cat,comm_ctx
from comm 
where main_cat = 070;
--comm에서 main_cat이 071인 것
select sub_cat,comm_ctx
from comm 
where main_cat = 071;

-- 일반 조인에서 모두 left join으로 변경함
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, 
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
;
-- 성공


--숫자만 써 있는 anno의 emp_type등은 표시 목록에서 제거한다. 
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
;

--완료 2021/12/07