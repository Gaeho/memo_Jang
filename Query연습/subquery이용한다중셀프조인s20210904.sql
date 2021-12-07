--1�� comm���� Ư�� �з��� ���
select main_cat, sub_cat, comm_ctx
from comm
where main_cat=001 or main_cat=070 or main_cat=071;


--2�� Company�� Announce�� lefter O.J��(����)
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title
from Company c 
left outer join Announce a
on c.com_id=a.com_id;


--3�� 2���� 3���� �����Ͽ� ��������� ������ ������(comm�� �׳� ������)
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as �������
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join comm c
on a.emp_type=c.sub_cat and c.main_cat=071
;

--3��-2 2���� 1���� ���������� �����Ͽ� ��������� ������ ������(comm�� �� �ڸ��� (1��)�� ���·� ��)->3���� ������ ��� ����
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as �������
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join (select main_cat, sub_cat, comm_ctx
            from comm
            where main_cat=001 or main_cat=070 or main_cat=071) c
on a.emp_type=c.sub_cat and c.main_cat=071
;




--5�� 3���� �Ǵٽ� comm�� ���� ��Ű���� ������ ������
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, c.comm_ctx as �������, d.comm_ctx as ��»���
from Company c 
left outer join Announce a
on c.com_id=a.com_id
inner join comm c
on a.emp_type=c.sub_cat and c.main_cat=071
join comm d
on a.career=d.sub_cat and c.main_cat=070;

--���� Ư�� main_cat���� �˻��� ����� innerjoin�Ѵٸ�? �̳�����x3
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, d.comm_ctx
from Company c 
left outer join Announce a
on c.com_id=a.com_id
left outer join (select *
            from comm 
            where main_cat = 001) d
on a.job_tag=d.sub_cat; 
--����

--comm���� main_cat�� 001�� ��
select sub_cat,comm_ctx
from comm 
where main_cat = 001;
--comm���� main_cat�� 070�� ��
select sub_cat,comm_ctx
from comm 
where main_cat = 070;
--comm���� main_cat�� 071�� ��
select sub_cat,comm_ctx
from comm 
where main_cat = 071;

-- �Ϲ� ���ο��� ��� left join���� ������
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
a.anno_code, a.rec_vol, a.emp_type, a.career, a.rec_edu, a.job_tag, a.anno_title, 
d.comm_ctx as ���� , e.comm_ctx as ���, f.comm_ctx as �������
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
-- ����


--���ڸ� �� �ִ� anno�� emp_type���� ǥ�� ��Ͽ��� �����Ѵ�. 
select c.com_id, c.com_name, c.com_tel, c.com_addr, c.com_bus, c.com_mgr_tel, c.com_web, c.com_img, 
 a.rec_vol, a.emp_type, a.rec_edu, a.anno_title, 
d.comm_ctx as ���� , e.comm_ctx as ���, f.comm_ctx as �������
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

--�Ϸ� 2021/12/07