insert into board(brd_id, brd_title, brd_content, brd_hit, brd_img, reg_date, reg_userid)
    select 
        board_seq.nextval, 
        dbms_random.string('a', 10), 
        dbms_random.string('a', 50),
        trunc(DBMS_RANDOM.value(0,100)),
        null,
        trunc(SYSDATE + DBMS_RANDOM.value(0,366)), 
        dbms_random.string('a', 5) from dual
connect by level < 45;

commit;

